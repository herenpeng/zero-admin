package com.zero.sys.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.zero.common.service.BaseService;
import com.zero.sys.domain.Log;

/**
 * @author herenpeng
 * @since 2020-10-30 22:26
 */
public interface LogService extends BaseService<Log> {

    /**
     * 分页查询操作日志数据
     *
     * @param currentPage 当前页面数，页面从1开始
     * @param size        前页的大小，默认为8
     * @param queryLog    查询操作日志的条件
     * @return 分页查询的所有操作日志数据
     * @throws Exception 抛出异常
     */
    IPage<Log> page(Integer currentPage, Integer size, Log queryLog) throws Exception;
}
