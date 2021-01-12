package com.zero.sys.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.zero.common.base.service.BaseService;
import com.zero.sys.entity.UserInfo;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
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
}
