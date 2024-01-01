package com.zero.auth.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.zero.common.base.service.BaseService;
import com.zero.auth.entity.Role;
import com.zero.auth.entity.User;

import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * 用户业务逻辑层接口
 *
 * @author herenpeng
 * @since 2020-08-04 22:42
 */
public interface UserService extends BaseService<User> {

    /**
     * 分页查询用户数据
     *
     * @param currentPage 当前页面数，页面从1开始
     * @param size        当前页的大小，默认为10
     * @param queryUser   查询用户的条件
     * @return 分页查询所有的用户数据
     * @throws Exception 抛出异常
     */
    IPage<User> page(Integer currentPage, Integer size, User queryUser) throws Exception;

    /**
     * 查询所有的用户数据
     *
     * @param queryUser 查询用户的条件
     * @return 查询所有的用户数据
     * @throws Exception 抛出异常
     */
    List<User> list(User queryUser) throws Exception;

    /**
     * 启用或者禁用该用户账号
     *
     * @param id      用户id
     * @param enabled true为启用，false为禁用
     * @throws Exception 抛出异常
     */
    void enabled(Integer id, Boolean enabled) throws Exception;

    /**
     * 通过accessToken解析用户信息并返回
     *
     * @param accessToken 请求头中的accessToken信息
     * @return 用户信息
     * @throws Exception 抛出异常
     */
    User token(String accessToken) throws Exception;

    /**
     * 删除用户的角色
     *
     * @param userId 用户主键
     * @param roleId 角色主键
     * @throws Exception
     */
    void deleteUserRole(Integer userId, Integer roleId) throws Exception;

    /**
     * 获取该用户没有的角色信息
     *
     * @param userId 用户主键
     * @return 用户未拥有的角色集合
     * @throws Exception 抛出异常
     */
    List<Role> getUserNotRoleList(Integer userId) throws Exception;

    /**
     * 添加用户角色关系
     *
     * @param userId 用户主键
     * @param roleId 角色主键
     * @throws Exception 抛出异常
     */
    void addUserRole(Integer userId, Integer roleId) throws Exception;

    /**
     * 检测本地用户名是否已存在
     *
     * @param username 用户名
     * @return 如果该用户名已存在，返回true，否则返回false
     * @throws Exception 抛出异常
     */
    Boolean checkUsername(String username) throws Exception;

    /**
     * 检测用户密码是否正确
     *
     * @param password 用户密码
     * @return 如果该用户密码正确，返回true，否则返回false
     * @throws Exception 抛出异常
     */
    Boolean checkPassword(String password) throws Exception;

    /**
     * 分页查询逻辑删除的用户数据
     *
     * @param currentPage 当前页面数，页面从1开始
     * @param size        当前页的大小，默认为10
     * @param queryUser   查询用户的条件
     * @return 分页查询逻辑删除的用户数据
     * @throws Exception 抛出异常
     */
    IPage<User> recoverPage(Integer currentPage, Integer size, User queryUser) throws Exception;

    /**
     * 通过主键恢复逻辑删除的用户数据
     *
     * @param id 用户主键
     * @throws Exception 抛出异常
     */
    void recover(Integer id) throws Exception;

    /**
     * 回收站删除，通过用户主键彻底删除用户数据
     *
     * @param id 用户主键
     * @throws Exception 抛出异常
     */
    void recoverDelete(Integer id) throws Exception;


    /**
     * 导出用户列表数据的Excel文件
     *
     * @param queryUser 查询用户的条件
     * @param response  HttpServletResponse对象
     * @throws Exception 抛出异常
     */
    void exportExcel(User queryUser, HttpServletResponse response) throws Exception;

    /**
     * 重置用户账号密码
     *
     * @param oldPassword 旧密码
     * @param newPassword 新密码
     * @throws Exception 抛出异常
     */
    void resetPassword(String oldPassword, String newPassword) throws Exception;
}
