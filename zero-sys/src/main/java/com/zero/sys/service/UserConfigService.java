package com.zero.sys.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.zero.common.base.service.BaseService;
import com.zero.sys.entity.UserConfig;

import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * 系统用户配置表业务逻辑层接口
 *
 * @author herenpeng
 * @since 2021-06-06 18:28
 */
public interface UserConfigService extends BaseService<UserConfig> {

    /**
     * 分页查询系统用户配置表数据
     *
     * @param currentPage     当前页面数，页面从1开始
     * @param size            当前页的大小，默认为10
     * @param queryUserConfig 查询系统用户配置表的条件
     * @return 分页查询所有的系统用户配置表数据
     * @throws Exception 抛出异常
     */
    IPage<UserConfig> page(Integer currentPage, Integer size, UserConfig queryUserConfig) throws Exception;

    /**
     * 查询所有的系统用户配置表数据
     *
     * @param queryUserConfig 查询系统用户配置表的条件
     * @return 查询所有的系统用户配置表数据
     * @throws Exception 抛出异常
     */
    List<UserConfig> list(UserConfig queryUserConfig) throws Exception;

    /**
     * 更新用户配置数据
     *
     * @param key   常量键值
     * @param value 用户配置值
     * @throws Exception 抛出异常
     */
    void updateByKey(String key, String value) throws Exception;

    /**
     * 分页查询逻辑删除的系统用户配置表数据
     *
     * @param currentPage     当前页面数，页面从1开始
     * @param size            当前页的大小，默认为10
     * @param queryUserConfig 查询系统用户配置表的条件
     * @return 分页查询逻辑删除的系统用户配置表数据
     * @throws Exception 抛出异常
     */
    IPage<UserConfig> recoverPage(Integer currentPage, Integer size, UserConfig queryUserConfig) throws Exception;

    /**
     * 通过主键恢复逻辑删除的系统用户配置表数据
     *
     * @param id 系统用户配置表主键
     * @throws Exception 抛出异常
     */
    void recover(Integer id) throws Exception;

    /**
     * 回收站删除，通过系统用户配置表主键彻底删除系统用户配置表数据
     *
     * @param id 系统用户配置表主键
     * @throws Exception 抛出异常
     */
    void recoverDelete(Integer id) throws Exception;

    /**
     * 导出系统用户配置表列表数据的Excel文件
     *
     * @param queryUserConfig 查询系统用户配置表的条件
     * @param response        HttpServletResponse对象
     * @throws Exception 抛出异常
     */
    void exportExcel(UserConfig queryUserConfig, HttpServletResponse response) throws Exception;

}
