package com.zero.sys.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.zero.common.base.service.BaseService;
import com.zero.sys.entity.Log;

import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * 系统操作日志表业务逻辑层接口
 *
 * @author herenpeng
 * @since 2020-12-01 22:31
 */
public interface LogService extends BaseService<Log> {

    /**
     * 分页查询系统操作日志表数据
     *
     * @param currentPage 当前页面数，页面从1开始
     * @param size        当前页的大小，默认为10
     * @param queryLog    查询系统操作日志表的条件
     * @return 分页查询所有的系统操作日志表数据
     * @throws Exception 抛出异常
     */
    IPage<Log> page(Integer currentPage, Integer size, Log queryLog) throws Exception;

    /**
     * 查询所有的系统操作日志表数据
     *
     * @param queryLog 查询系统操作日志表的条件
     * @return 查询所有的系统操作日志表数据
     * @throws Exception 抛出异常
     */
    List<Log> list(Log queryLog) throws Exception;

    /**
     * 分页查询逻辑删除的系统操作日志表数据
     *
     * @param currentPage 当前页面数，页面从1开始
     * @param size        当前页的大小，默认为10
     * @param queryLog    查询系统操作日志表的条件
     * @return 分页查询逻辑删除的系统操作日志表数据
     * @throws Exception 抛出异常
     */
    IPage<Log> recoverPage(Integer currentPage, Integer size, Log queryLog) throws Exception;

    /**
     * 通过主键恢复逻辑删除的系统操作日志表数据
     *
     * @param id 系统操作日志表主键
     * @throws Exception 抛出异常
     */
    void recover(Integer id) throws Exception;

    /**
     * 回收站删除，通过系统操作日志表主键彻底删除系统操作日志表数据
     *
     * @param id 系统操作日志表主键
     * @throws Exception 抛出异常
     */
    void recoverDelete(Integer id) throws Exception;

    /**
     * 导出操作日志列表数据的Excel文件
     *
     * @param queryLog 查询系统操作日志表的条件
     * @param response HttpServletResponse对象
     * @throws Exception 抛出异常
     */
    void exportExcel(Log queryLog, HttpServletResponse response) throws Exception;
}
