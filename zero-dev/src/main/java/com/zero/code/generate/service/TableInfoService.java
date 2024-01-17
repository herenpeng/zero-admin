package com.zero.code.generate.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.zero.code.generate.entity.TableInfo;
import com.zero.common.base.service.BaseService;

import java.util.List;

/**
 * 系统数据库表信息业务层接口
 *
 * @author herenpeng
 * @since 2020-11-08 20:29
 */
public interface TableInfoService extends BaseService<TableInfo> {

    /**
     * 分页查询系统数据库表信息数据
     *
     * @param currentPage    当前页面数，页面从1开始
     * @param size           当前页的大小，默认为10
     * @param queryTableInfo 查询系统数据库表信息的条件
     * @return 分页查询的所有系统数据库表信息数据
     * @throws Exception 抛出异常
     */
    IPage<TableInfo> page(Integer currentPage, Integer size, TableInfo queryTableInfo) throws Exception;

    /**
     * 获取没有添加到table_info表中的数据库表信息
     *
     * @return 数据库表信息集合
     * @throws Exception 抛出异常
     */
    List<TableInfo> getNotAddList() throws Exception;


    /**
     * 生成代码
     *
     * @param id 数据表信息表主键
     * @throws Exception 抛出异常
     */
    void codeGenerate(Integer id) throws Exception;

    /**
     * 分页查询逻辑删除的系统数据库表信息表数据
     *
     * @param currentPage    当前页面数，页面从1开始
     * @param size           当前页的大小，默认为10
     * @param queryTableInfo 查询系统数据库表信息表的条件
     * @return 分页查询逻辑删除的系统数据库表信息表数据
     * @throws Exception 抛出异常
     */
    IPage<TableInfo> recoverPage(Integer currentPage, Integer size, TableInfo queryTableInfo) throws Exception;

    /**
     * 通过主键恢复逻辑删除的系统数据库表信息表数据
     *
     * @param id 系统数据库表信息表主键
     * @throws Exception 抛出异常
     */
    void recover(Integer id) throws Exception;

    /**
     * 回收站删除，通过系统数据库表信息表主键彻底删除系统数据库表信息表数据
     * 该方法同时还会彻底删除dev_table_column表里面对应的字段信息
     *
     * @param id 系统数据库表信息表主键
     * @throws Exception 抛出异常
     */
    void recoverDelete(Integer id) throws Exception;
}
