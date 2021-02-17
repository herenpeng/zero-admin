package com.zero.auth.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.zero.common.base.service.BaseService;
import com.zero.auth.entity.LoginLog;

import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * 系统账号登录日志表业务逻辑层接口
 *
 * @author herenpeng
 * @since 2021-02-17 10:04
 */
public interface LoginLogService extends BaseService<LoginLog> {

    /**
     * 分页查询系统账号登录日志表数据
     *
     * @param currentPage 当前页面数，页面从1开始
     * @param size        当前页的大小，默认为10
     * @param queryLoginLog   查询系统账号登录日志表的条件
     * @return 分页查询所有的系统账号登录日志表数据
     * @throws Exception 抛出异常
     */
    IPage<LoginLog> page(Integer currentPage, Integer size, LoginLog queryLoginLog) throws Exception;

    /**
     * 查询所有的系统账号登录日志表数据
     *
     * @param queryLoginLog   查询系统账号登录日志表的条件
     * @return 查询所有的系统账号登录日志表数据
     * @throws Exception 抛出异常
     */
    List<LoginLog> list(LoginLog queryLoginLog) throws Exception;

    /**
     * 分页查询逻辑删除的系统账号登录日志表数据
     *
     * @param currentPage 当前页面数，页面从1开始
     * @param size        当前页的大小，默认为10
     * @param queryLoginLog   查询系统账号登录日志表的条件
     * @return 分页查询逻辑删除的系统账号登录日志表数据
     * @throws Exception 抛出异常
     */
    IPage<LoginLog> recoverPage(Integer currentPage, Integer size, LoginLog queryLoginLog) throws Exception;

    /**
     * 通过主键恢复逻辑删除的系统账号登录日志表数据
     *
     * @param id 系统账号登录日志表主键
     * @throws Exception 抛出异常
     */
    void recover(Integer id) throws Exception;

    /**
     * 回收站删除，通过系统账号登录日志表主键彻底删除系统账号登录日志表数据
     *
     * @param id 系统账号登录日志表主键
     * @throws Exception 抛出异常
     */
    void recoverDelete(Integer id) throws Exception;

    /**
     * 导出系统账号登录日志表列表数据的Excel文件
     *
     * @param queryLoginLog 查询系统账号登录日志表的条件
     * @param response  HttpServletResponse对象
     * @throws Exception 抛出异常
     */
    void exportExcel(LoginLog queryLoginLog, HttpServletResponse response) throws Exception;

}
