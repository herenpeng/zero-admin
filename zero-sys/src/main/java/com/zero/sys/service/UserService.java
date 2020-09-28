package com.zero.sys.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.zero.sys.domain.User;

/**
 * 用户业务逻辑层接口
 *
 * @author herenpeng
 * @since 2020-08-04 22:42
 */
public interface UserService {

    /**
     * 分页查询用户数据
     *
     * @param currentPage 当前页面数，页面从1开始
     * @param size        当前页的大小，默认为10
     * @return 分页查询的所有用户数据
     * @throws Exception 抛出异常
     */
    IPage<User> page(Integer currentPage, Integer size) throws Exception;

    /**
     * 启用或者禁用该用户账号
     *
     * @param id      用户id
     * @param enabled true为启用，false为禁用
     * @throws Exception
     */
    void enabled(Integer id, Boolean enabled) throws Exception;

    /**
     * 插入一条用户信息
     *
     * @param user 用户对象
     * @throws Exception
     */
    void insert(User user) throws Exception;

    /**
     * 通过主键删除用户信息
     *
     * @param id 用户主键
     * @throws Exception
     */
    void delete(Integer id) throws Exception;

    /**
     * 通过accessToken解析用户信息并返回
     *
     * @param accessToken cookie中的accessToken信息
     * @return 用户信息
     */
    User info(String accessToken) throws Exception;
}
