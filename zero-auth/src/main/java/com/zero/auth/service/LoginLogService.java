package com.zero.auth.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.zero.auth.entity.LoginLog;
import com.zero.common.base.service.BaseService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
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
     * @param currentPage   当前页面数，页面从1开始
     * @param size          当前页的大小，默认为10
     * @param queryLoginLog 查询系统账号登录日志表的条件
     * @return 分页查询所有的系统账号登录日志表数据
     * @throws Exception 抛出异常
     */
    IPage<LoginLog> page(Integer currentPage, Integer size, LoginLog queryLoginLog) throws Exception;

    /**
     * 查询所有的系统账号登录日志表数据
     *
     * @param queryLoginLog 查询系统账号登录日志表的条件
     * @return 查询所有的系统账号登录日志表数据
     * @throws Exception 抛出异常
     */
    List<LoginLog> list(LoginLog queryLoginLog) throws Exception;

    /**
     * 分页查询逻辑删除的系统账号登录日志表数据
     *
     * @param currentPage   当前页面数，页面从1开始
     * @param size          当前页的大小，默认为10
     * @param queryLoginLog 查询系统账号登录日志表的条件
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
     * @param response      HttpServletResponse对象
     * @throws Exception 抛出异常
     */
    void exportExcel(LoginLog queryLoginLog, HttpServletResponse response) throws Exception;

    /**
     * 获取当前在线的用户记录，即logout为false，并且logoutTime小于当前时间
     *
     * @param userId 用户主键
     * @return 当前登录的用户记录
     * @throws Exception 抛出异常
     */
    List<LoginLog> online(Integer userId) throws Exception;

    /**
     * 通过tokenId下线用户，即为删除redis中对应的token信息
     *
     * @param userId  指定下线的用户主键
     * @param tokenId 指定下线的用户tokenId
     * @throws Exception 抛出异常
     */
    void offline(Integer userId, String tokenId) throws Exception;

    /**
     * 通过用户 Id 对所有的在线用户进行下线操作
     *
     * @param userId 指定下线的用户主键
     * @throws Exception 抛出异常
     */
    void offlineAll(Integer userId) throws Exception;

    /**
     * 记录登录日志
     *
     * @param request HttpServletRequest对象
     * @param userId  登录用户主键
     * @param tokenId tokenId
     * @return 返回登录日志对象
     */
    LoginLog loginLog(HttpServletRequest request, Integer userId, String tokenId);

    /**
     * 登出的时候，更新登录记录
     *
     * @param userId  登录用户主键
     * @param tokenId tokenId
     */
    void logoutLog(Integer userId, String tokenId);
}
