package com.zero.sys.service.impl;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.zero.auth.entity.User;
import com.zero.auth.mapper.UserMapper;
import com.zero.common.base.service.impl.BaseServiceImpl;
import com.zero.sys.entity.Log;
import com.zero.sys.mapper.LogMapper;
import com.zero.sys.service.LogService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.HttpServletResponse;
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
public class LogServiceImpl extends BaseServiceImpl<LogMapper, Log> implements LogService {

    private final UserMapper userMapper;

    @Override
    public IPage<Log> page(Integer currentPage, Integer size, Log queryLog) throws Exception {
        IPage<Log> page = new Page<>(currentPage, size);
        IPage<Log> pageInfo = baseMapper.getPage(page, queryLog);
        for (Log log : pageInfo.getRecords()) {
            User user = userMapper.selectById(log.getOperationUserId());
            log.setUser(user);
        }
        return pageInfo;
    }

    @Override
    public List<Log> list(Log queryLog) throws Exception {
        return baseMapper.getList(queryLog);
    }

    @Override
    public IPage<Log> recoverPage(Integer currentPage, Integer size, Log queryLog) throws Exception {
        IPage<Log> page = new Page<>(currentPage, size);
        IPage<Log> pageInfo = baseMapper.getRecoverPage(page, queryLog);
        for (Log log : pageInfo.getRecords()) {
            User user = userMapper.selectById(log.getOperationUserId());
            log.setUser(user);
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
    public void exportExcel(Log queryLog, HttpServletResponse response) throws Exception {
        List<Log> exportData = list(queryLog);
        excelUtils.exportExcel("操作日志列表", Log.class, exportData, response);
    }
}