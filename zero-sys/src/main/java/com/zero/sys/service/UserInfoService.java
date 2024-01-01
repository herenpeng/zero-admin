package com.zero.sys.service;


import com.baomidou.mybatisplus.core.metadata.IPage;
import com.zero.auth.entity.UserInfo;
import com.zero.common.base.service.BaseService;
import org.springframework.web.multipart.MultipartFile;

import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * 系统用户信息表业务逻辑层接口
 *
 * @author herenpeng
 * @since 2021-01-12 22:19
 */
public interface UserInfoService extends BaseService<UserInfo> {

    /**
     * 分页查询系统用户信息表数据
     *
     * @param currentPage   当前页面数，页面从1开始
     * @param size          当前页的大小，默认为10
     * @param queryUserInfo 查询系统用户信息表的条件
     * @return 分页查询所有的系统用户信息表数据
     * @throws Exception 抛出异常
     */
    IPage<UserInfo> page(Integer currentPage, Integer size, UserInfo queryUserInfo) throws Exception;

    /**
     * 查询所有的系统用户信息表数据
     *
     * @param queryUserInfo 查询系统用户信息表的条件
     * @return 查询所有的系统用户信息表数据
     * @throws Exception 抛出异常
     */
    List<UserInfo> list(UserInfo queryUserInfo) throws Exception;

    /**
     * 分页查询逻辑删除的系统用户信息表数据
     *
     * @param currentPage   当前页面数，页面从1开始
     * @param size          当前页的大小，默认为10
     * @param queryUserInfo 查询系统用户信息表的条件
     * @return 分页查询逻辑删除的系统用户信息表数据
     * @throws Exception 抛出异常
     */
    IPage<UserInfo> recoverPage(Integer currentPage, Integer size, UserInfo queryUserInfo) throws Exception;

    /**
     * 通过主键恢复逻辑删除的系统用户信息表数据
     *
     * @param id 系统用户信息表主键
     * @throws Exception 抛出异常
     */
    void recover(Integer id) throws Exception;

    /**
     * 回收站删除，通过系统用户信息表主键彻底删除系统用户信息表数据
     *
     * @param id 系统用户信息表主键
     * @throws Exception 抛出异常
     */
    void recoverDelete(Integer id) throws Exception;

    /**
     * 导出系统用户信息表列表数据的Excel文件
     *
     * @param queryUserInfo 查询系统用户信息表的条件
     * @param response      HttpServletResponse对象
     * @throws Exception 抛出异常
     */
    void exportExcel(UserInfo queryUserInfo, HttpServletResponse response) throws Exception;

    /**
     * 上传用户头像，并将用户头像路径更新至UserInfo对象中
     *
     * @param file 用户头像文件
     * @return 用户头像路径
     * @throws Exception 抛出异常
     */
    String avatar(MultipartFile file) throws Exception;

    /**
     * 获取用户头像路径
     *
     * @return 用户头像路径
     * @throws Exception 抛出异常
     */
    String getAvatar() throws Exception;

    /**
     * 查询当前登录用户的信息数据
     *
     * @return 前登录用户的信息数据
     * @throws Exception 抛出异常
     */
    UserInfo info() throws Exception;

    /**
     * 发送校验邮箱的校验邮件
     *
     * @param mail 接受者的邮箱号码
     * @return 发送成功返回true，发送失败返回false
     * @throws Exception 抛出异常
     */
    boolean sendVerifyMail(String mail) throws Exception;

    /**
     * 验证邮件验证码
     *
     * @param mail 电子邮件号码
     * @param verify 电子邮件验证码
     * @return 验证成功返回true，否则返回false
     * @throws Exception 抛出异常
     */
    boolean verify(String mail, String verify) throws Exception;
}
