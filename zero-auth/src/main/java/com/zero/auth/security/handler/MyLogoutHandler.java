package com.zero.auth.security.handler;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.zero.auth.entity.LoginLog;
import com.zero.auth.mapper.LoginLogMapper;
import com.zero.auth.security.jwt.properties.JwtProperties;
import com.zero.auth.security.jwt.util.JwtUtils;
import com.zero.auth.util.RequestUtils;
import com.zero.auth.util.ResponseUtils;
import com.zero.common.constant.StringConst;
import com.zero.common.response.domain.ResponseData;
import lombok.SneakyThrows;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.logout.LogoutHandler;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Date;

/**
 * 登录退出处理器类
 *
 * @author herenpeng
 * @since 2020-09-13 15:25
 */
@Component
public class MyLogoutHandler implements LogoutHandler {

    @Autowired
    private RedisTemplate redisTemplate;

    @Autowired
    private RequestUtils requestUtils;

    @Autowired
    private JwtProperties jwtProperties;

    @Autowired
    private JwtUtils jwtUtils;

    @Autowired
    private ResponseUtils responseUtils;

    @Autowired
    private LoginLogMapper loginLogMapper;

    @SneakyThrows
    @Override
    public void logout(HttpServletRequest request, HttpServletResponse response, Authentication authentication) {
        String token = requestUtils.getToken(request);
        String tokenId = jwtUtils.getId(token);
        Integer userId = jwtUtils.getUserId(token);

        // 登出的时候，更新登入记录
        logoutLog(userId, tokenId);

        String tokenRedisKey = jwtProperties.getKey() + StringConst.COLON + tokenId;
        redisTemplate.delete(tokenRedisKey);
        ResponseData<Object> responseData = ResponseData.ok().message("退出成功");
        responseUtils.responseJson(response, responseData);
    }


    /**
     * 登出的时候，更新登入记录
     *
     * @param userId  登录用户主键
     * @param tokenId tokenId
     */
    private void logoutLog(Integer userId, String tokenId) {
        // 更新登入记录
        LoginLog queryLoginLog = new LoginLog();
        queryLoginLog.setUserId(userId);
        queryLoginLog.setTokenId(tokenId);
        // 通过用户主键和tokenId获取对应的登入记录
        LoginLog loginLog = loginLogMapper.selectOne(new QueryWrapper<>(queryLoginLog));
        // 设置主动登出
        loginLog.setLogout(true);
        // 设置主动登出时间
        loginLog.setLogoutTime(new Date());
        // 更新
        loginLogMapper.updateById(loginLog);
    }

}
