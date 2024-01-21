package com.zero.auth.service.impl;

import cn.hutool.http.useragent.Browser;
import cn.hutool.http.useragent.OS;
import cn.hutool.http.useragent.UserAgent;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.zero.auth.entity.LoginLog;
import com.zero.auth.mapper.LoginLogMapper;
import com.zero.auth.mapper.UserMapper;
import com.zero.auth.properties.JwtProperties;
import com.zero.auth.service.LoginLogService;
import com.zero.common.base.service.impl.BaseServiceImpl;
import com.zero.common.constant.AppConst;
import com.zero.common.http.domain.IpInfo;
import com.zero.common.http.kit.HttpKit;
import com.zero.common.http.kit.IpKit;
import com.zero.common.kit.ExcelKit;
import com.zero.common.kit.RedisKit;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.ObjectUtils;

import java.util.Date;
import java.util.List;

/**
 * 系统账号登录日志表业务逻辑层的实现类
 *
 * @author herenpeng
 * @since 2021-02-17 10:04
 */
@Slf4j
@RequiredArgsConstructor
@Service
@Transactional(rollbackFor = Exception.class)
public class LoginLogServiceImpl extends BaseServiceImpl<LoginLogMapper, LoginLog> implements LoginLogService {

    private final JwtProperties jwtProperties;

    private final RedisKit redisKit;

    private final IpKit ipKit;

    private final UserMapper userMapper;

    @Override
    public IPage<LoginLog> page(Integer currentPage, Integer size, LoginLog queryLoginLog) throws Exception {
        return page(currentPage, size, queryLoginLog, false);
    }

    private IPage<LoginLog> page(Integer currentPage, Integer size, LoginLog queryLoginLog, Boolean deleted) throws Exception {
        queryLoginLog.setDeleted(deleted);
        IPage<LoginLog> page = new Page<>(currentPage, size);
        IPage<LoginLog> pageInfo = baseMapper.getPage(page, queryLoginLog);
        for (LoginLog loginLog : pageInfo.getRecords()) {
            loginLog.setUser(userMapper.selectById(loginLog.getUserId()));
        }
        return pageInfo;
    }


    @Override
    public List<LoginLog> list(LoginLog queryLoginLog) throws Exception {
        QueryWrapper<LoginLog> queryWrapper = new QueryWrapper<>(queryLoginLog);
        List<LoginLog> loginLogList = baseMapper.selectList(queryWrapper);
        return loginLogList;
    }

    @Override
    public IPage<LoginLog> recoverPage(Integer currentPage, Integer size, LoginLog queryLoginLog) throws Exception {
        return page(currentPage, size, queryLoginLog, true);
    }

    @Override
    public void recover(Integer id) throws Exception {
        baseMapper.recoverById(id);
    }

    @Override
    public void recoverDelete(Integer id) throws Exception {
        baseMapper.recoverDelete(id);
    }

    @Override
    public void exportExcel(LoginLog queryLoginLog, HttpServletResponse response) throws Exception {
        List<LoginLog> exportData = list(queryLoginLog);
        ExcelKit.exportExcel("系统账号登录日志表", LoginLog.class, exportData, response);
    }


    @Override
    public List<LoginLog> online(Integer userId) throws Exception {
        return baseMapper.getOnlineByUserId(userId);
    }

    @Override
    public void offline(Integer userId, String tokenId) throws Exception {
        String tokenRedisKey = jwtProperties.getKey() + AppConst.COLON + tokenId;
        redisKit.del(tokenRedisKey);
        logoutLog(userId, tokenId);
    }

    @Override
    public void offlineAll(Integer userId) throws Exception {
        // 获取所有在线的账号登录日志
        List<LoginLog> onlineLoginLog = online(userId);
        // 下线该账号的所有用户
        for (LoginLog loginLog : onlineLoginLog) {
            offline(loginLog.getUserId(), loginLog.getTokenId());
        }
    }

    @Override
    public LoginLog loginLog(HttpServletRequest request, Integer userId, String tokenId) {
        // 记录登录日志
        String ip = ipKit.getIpAddr(request);
        LoginLog loginLog = new LoginLog();
        loginLog.setUserId(userId);
        loginLog.setIp(ip);
        loginLog.setTokenId(tokenId);
        // 获取客户端信息
        logUserAgent(loginLog, request);
        IpInfo ipInfo = ipKit.getIpInfo(ip);
        // 登录的IP地址信息，如果可以获取则设置，如果获取不到则不设置
        if (ipInfo != null) {
            IpInfo.Data data = ipInfo.getData();
            loginLog.setCountry(data.getCountry());
            loginLog.setRegion(data.getRegion());
            loginLog.setCity(data.getCity());
            loginLog.setIsp(data.getIsp());
        }
        // 登录时间
        Date loginTime = new Date();
        loginLog.setLoginTime(loginTime);
        // 默认登录时间为登录时间+token失效时间，在用户主动登出时，需要将登出时间关闭
        long logoutTime = loginTime.getTime() + jwtProperties.getTtl();
        Date defaultLogoutTime = new Date(logoutTime);
        loginLog.setLogoutTime(defaultLogoutTime);
        baseMapper.insert(loginLog);
        return loginLog;
    }


    private void logUserAgent(LoginLog loginLog, HttpServletRequest request) {
        UserAgent userAgent = HttpKit.getUserAgent(request);
        loginLog.setMobile(userAgent.isMobile());
        Browser browser = userAgent.getBrowser();
        loginLog.setBrowserName(browser.getName());
        loginLog.setBrowserVersion(userAgent.getVersion());
        OS os = userAgent.getOs();
        loginLog.setOsName(os.getName());
    }


    @Override
    public void logoutLog(Integer userId, String tokenId) {
        // 更新登入记录
        LoginLog queryLoginLog = new LoginLog();
        queryLoginLog.setUserId(userId);
        queryLoginLog.setTokenId(tokenId);
        // 通过用户主键和tokenId获取对应的登入记录
        LoginLog loginLog = baseMapper.selectOne(new QueryWrapper<>(queryLoginLog));
        if (ObjectUtils.isEmpty(loginLog)) {
            return;
        }
        // 设置主动登出
        loginLog.setLogout(true);
        // 设置主动登出时间
        loginLog.setLogoutTime(new Date());
        // 更新
        baseMapper.updateById(loginLog);
    }

}