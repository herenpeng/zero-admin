package com.zero.sys.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.zero.auth.entity.User;
import com.zero.auth.mapper.UserMapper;
import com.zero.auth.security.util.SecurityUtils;
import com.zero.common.base.service.impl.BaseServiceImpl;
import com.zero.common.exception.AppException;
import com.zero.common.exception.AppExceptionEnum;
import com.zero.sys.entity.ConfigConst;
import com.zero.sys.entity.UserConfig;
import com.zero.sys.mapper.ConfigConstMapper;
import com.zero.sys.mapper.UserConfigMapper;
import com.zero.sys.service.UserConfigService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.ObjectUtils;

import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * 系统用户配置表业务逻辑层的实现类
 *
 * @author herenpeng
 * @since 2021-06-06 18:28
 */
@Slf4j
@RequiredArgsConstructor
@Service
@Transactional(rollbackFor = Exception.class)
public class UserConfigServiceImpl extends BaseServiceImpl<UserConfigMapper, UserConfig> implements UserConfigService {

    private final ConfigConstMapper configConstMapper;

    private final UserMapper userMapper;

    private final SecurityUtils securityUtils;

    @Override
    public IPage<UserConfig> page(Integer currentPage, Integer size, UserConfig queryUserConfig) throws Exception {
        IPage<UserConfig> page = new Page<>(currentPage, size);
        IPage<UserConfig> pageInfo = baseMapper.getPage(page, queryUserConfig);
        for (UserConfig userConfig : pageInfo.getRecords()) {
            ConfigConst configConst = configConstMapper.selectById(userConfig.getConfigId());
            userConfig.setConfigConst(configConst);
            User user = userMapper.selectById(userConfig.getUserId());
            userConfig.setUser(user);
        }
        return pageInfo;
    }

    @Override
    public List<UserConfig> list(UserConfig queryUserConfig) throws Exception {
        QueryWrapper<UserConfig> queryWrapper = new QueryWrapper<>(queryUserConfig);
        List<UserConfig> userConfigList = baseMapper.selectList(queryWrapper);
        return userConfigList;
    }

    @Override
    public void updateByKey(String key, String value) throws Exception {
        ConfigConst configConst = configConstMapper.getByKey(key);
        if (ObjectUtils.isEmpty(configConst)) {
            log.error("[用户配置业务层]系统配置的KEY值：{}不存在", key);
            throw new AppException(AppExceptionEnum.CONFIG_KEY_NOT_EXIST);
        }
        if (!configConst.getUserable()) {
            log.error("[用户配置业务层]系统配置的KEY值：{}不允许用户配置", key);
            throw new AppException(AppExceptionEnum.CONFIG_KEY_NOT_CAN);
        }
        Integer userId = securityUtils.getUserId(request);
        UserConfig userConfig = baseMapper.getByUserIdAndConfigId(userId, configConst.getId());
        if (ObjectUtils.isEmpty(userConfig)) {
            log.info("[用户配置业务层]用户未配置该系统配置，新增用户配置，用户系统配置KEY值：{}", key);
            // 插入一条数据
            userConfig = new UserConfig();
            userConfig.setUserId(userId);
            userConfig.setConfigId(configConst.getId());
            userConfig.setValue(value);
            baseMapper.insert(userConfig);
        } else {
            log.info("[用户配置业务层]用户已配置该系统配置，更新用户配置，系统配置KEY值：{}，用户配置Id：{}", key, userConfig.getId());
            // 更新数据
            userConfig.setValue(value);
            baseMapper.updateById(userConfig);
        }
    }

    @Override
    public IPage<UserConfig> recoverPage(Integer currentPage, Integer size, UserConfig queryUserConfig) throws Exception {
        IPage<UserConfig> page = new Page<>(currentPage, size);
        IPage<UserConfig> pageInfo = baseMapper.getRecoverPage(page, queryUserConfig);
        for (UserConfig userConfig : pageInfo.getRecords()) {
            ConfigConst configConst = configConstMapper.selectById(userConfig.getConfigId());
            userConfig.setConfigConst(configConst);
        }
        return pageInfo;
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
    public void exportExcel(UserConfig queryUserConfig, HttpServletResponse response) throws Exception {
        List<UserConfig> exportData = list(queryUserConfig);
        excelUtils.exportExcel("系统用户配置表", UserConfig.class, exportData, response);
    }

}