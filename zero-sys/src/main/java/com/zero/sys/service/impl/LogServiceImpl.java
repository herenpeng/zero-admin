package com.zero.sys.service.impl;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.zero.common.service.impl.BaseServiceImpl;
import com.zero.sys.domain.Log;
import com.zero.sys.mapper.LogMapper;
import com.zero.sys.service.LogService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * @author herenpeng
 * @since 2020-10-30 22:27
 */
@Slf4j
@Service
@Transactional(rollbackFor = Exception.class)
public class LogServiceImpl extends BaseServiceImpl<LogMapper, Log> implements LogService {

    @Override
    public IPage<Log> page(Integer currentPage, Integer size, Log queryLog) throws Exception {
        Page page = new Page(currentPage, size);
        IPage<Log> pageInfo = baseMapper.getPage(page, queryLog);
        return pageInfo;
    }
}
