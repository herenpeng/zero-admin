package com.zero.auth.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.zero.common.base.service.impl.BaseServiceImpl;
import com.zero.auth.entity.LoginLog;
import com.zero.auth.mapper.LoginLogMapper;
import com.zero.auth.service.LoginLogService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * 系统账号登录日志表业务逻辑层的实现类
 *
 * @author herenpeng
 * @since 2021-02-17 10:04
 */
@Slf4j
@Service
@Transactional(rollbackFor = Exception.class)
public class LoginLogServiceImpl extends BaseServiceImpl<LoginLogMapper, LoginLog> implements LoginLogService {

    @Override
    public IPage<LoginLog> page(Integer currentPage, Integer size, LoginLog queryLoginLog) throws Exception {
        IPage<LoginLog> page = new Page<>(currentPage, size);
        QueryWrapper<LoginLog> queryWrapper = new QueryWrapper<>(queryLoginLog);
        IPage<LoginLog> pageInfo = baseMapper.selectPage(page, queryWrapper);
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
        IPage<LoginLog> page = new Page<>(currentPage, size);
        IPage<LoginLog> pageInfo = baseMapper.getRecoverPage(page, queryLoginLog);
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
    public void exportExcel(LoginLog queryLoginLog, HttpServletResponse response) throws Exception {
        List<LoginLog> exportData = list(queryLoginLog);
        excelUtils.exportExcel("系统账号登录日志表", LoginLog.class, exportData, response);
    }

}