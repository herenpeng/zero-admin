package com.zero.sys.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.zero.common.base.service.impl.BaseServiceImpl;
import com.zero.sys.entity.UserConfig;
import com.zero.sys.mapper.UserConfigMapper;
import com.zero.sys.service.UserConfigService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.HttpServletResponse;
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

    @Override
    public IPage<UserConfig> page(Integer currentPage, Integer size, UserConfig queryUserConfig) throws Exception {
        IPage<UserConfig> page = new Page<>(currentPage, size);
        IPage<UserConfig> pageInfo = baseMapper.getPage(page, queryUserConfig);
        return pageInfo;
    }

    @Override
    public List<UserConfig> list(UserConfig queryUserConfig) throws Exception {
        QueryWrapper<UserConfig> queryWrapper = new QueryWrapper<>(queryUserConfig);
        List<UserConfig> userConfigList = baseMapper.selectList(queryWrapper);
        return userConfigList;
    }

    @Override
    public IPage<UserConfig> recoverPage(Integer currentPage, Integer size, UserConfig queryUserConfig) throws Exception {
        IPage<UserConfig> page = new Page<>(currentPage, size);
        IPage<UserConfig> pageInfo = baseMapper.getRecoverPage(page, queryUserConfig);
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