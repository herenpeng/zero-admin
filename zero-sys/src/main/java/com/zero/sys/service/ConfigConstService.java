package com.zero.sys.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.zero.common.base.service.BaseService;
import com.zero.sys.entity.ConfigConst;

import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import java.util.Map;

/**
 * 系统配置常量表业务逻辑层接口
 *
 * @author herenpeng
 * @since 2021-06-05 22:29
 */
public interface ConfigConstService extends BaseService<ConfigConst> {

    /**
     * 分页查询系统配置常量表数据
     *
     * @param currentPage      当前页面数，页面从1开始
     * @param size             当前页的大小，默认为10
     * @param queryConfigConst 查询系统配置常量表的条件
     * @return 分页查询所有的系统配置常量表数据
     * @throws Exception 抛出异常
     */
    IPage<ConfigConst> page(Integer currentPage, Integer size, ConfigConst queryConfigConst) throws Exception;

    /**
     * 查询所有的系统配置常量表数据
     *
     * @param queryConfigConst 查询系统配置常量表的条件
     * @return 查询所有的系统配置常量表数据
     * @throws Exception 抛出异常
     */
    List<ConfigConst> list(ConfigConst queryConfigConst) throws Exception;


    /**
     * 通过 key 值模糊查询所有的 Key
     *
     * @param key      key 值
     * @param userable 是否允许用户配置
     * @return
     * @throws Exception
     */
    List<String> getKeyList(String key, Boolean userable) throws Exception;

    /**
     * 通过 key 值准确匹配唯一的 配置信息
     *
     * @param key key 值
     * @return
     * @throws Exception
     */
    String getByKey(String key) throws Exception;


    /**
     * 批量查询常量键值配置数据
     *
     * @param keys key键集合
     * @return
     * @throws Exception 抛出异常
     */
    Map<String, String> getByKeys(List<String> keys) throws Exception;

    /**
     * 分页查询逻辑删除的系统配置常量表数据
     *
     * @param currentPage      当前页面数，页面从1开始
     * @param size             当前页的大小，默认为10
     * @param queryConfigConst 查询系统配置常量表的条件
     * @return 分页查询逻辑删除的系统配置常量表数据
     * @throws Exception 抛出异常
     */
    IPage<ConfigConst> recoverPage(Integer currentPage, Integer size, ConfigConst queryConfigConst) throws Exception;

    /**
     * 通过主键恢复逻辑删除的系统配置常量表数据
     *
     * @param id 系统配置常量表主键
     * @throws Exception 抛出异常
     */
    void recover(Integer id) throws Exception;

    /**
     * 回收站删除，通过系统配置常量表主键彻底删除系统配置常量表数据
     *
     * @param id 系统配置常量表主键
     * @throws Exception 抛出异常
     */
    void recoverDelete(Integer id) throws Exception;

    /**
     * 导出系统配置常量表列表数据的Excel文件
     *
     * @param queryConfigConst 查询系统配置常量表的条件
     * @param response         HttpServletResponse对象
     * @throws Exception 抛出异常
     */
    void exportExcel(ConfigConst queryConfigConst, HttpServletResponse response) throws Exception;

}
