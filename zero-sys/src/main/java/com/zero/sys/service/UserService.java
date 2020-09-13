package com.zero.sys.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.zero.sys.domain.User;

/**
 * 用户业务逻辑层接口
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


}
