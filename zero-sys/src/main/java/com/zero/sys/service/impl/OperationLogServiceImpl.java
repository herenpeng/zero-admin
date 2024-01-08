package com.zero.sys.service.impl;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.zero.auth.entity.User;
import com.zero.auth.mapper.UserMapper;
import com.zero.common.base.service.impl.BaseServiceImpl;
import com.zero.common.kit.ExcelKit;
import com.zero.sys.entity.OperationLog;
import com.zero.sys.mapper.OperationLogMapper;
import com.zero.sys.service.OperationLogService;
import jakarta.servlet.http.HttpServletResponse;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * 系统操作日志表业务逻辑层的实现类
 *
 * @author herenpeng
 * @since 2020-12-01 22:31
 */
@Slf4j
@RequiredArgsConstructor
@Service
@Transactional(rollbackFor = Exception.class)
public class OperationLogServiceImpl extends BaseServiceImpl<OperationLogMapper, OperationLog> implements OperationLogService {

    private final UserMapper userMapper;

    @Override
    public IPage<OperationLog> page(Integer currentPage, Integer size, OperationLog queryOperationLog) throws Exception {
        return page(currentPage, size, queryOperationLog, false);
    }


    private IPage<OperationLog> page(Integer currentPage, Integer size, OperationLog queryOperationLog, Boolean deleted) throws Exception {
        queryOperationLog.setDeleted(deleted);
        IPage<OperationLog> page = new Page<>(currentPage, size);
        IPage<OperationLog> pageInfo = baseMapper.getPage(page, queryOperationLog);
        for (OperationLog log : pageInfo.getRecords()) {
            User user = userMapper.selectById(log.getOperationUserId());
            log.setUser(user);
        }
        return pageInfo;
    }


    @Override
    public List<OperationLog> list(OperationLog queryOperationLog) throws Exception {
        return baseMapper.getList(queryOperationLog);
    }

    @Override
    public IPage<OperationLog> recoverPage(Integer currentPage, Integer size, OperationLog queryOperationLog) throws Exception {
        return page(currentPage, size, queryOperationLog, true);
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
    public void exportExcel(OperationLog queryOperationLog, HttpServletResponse response) throws Exception {
        List<OperationLog> exportData = list(queryOperationLog);
        ExcelKit.exportExcel("操作日志列表", OperationLog.class, exportData, response);
    }
}