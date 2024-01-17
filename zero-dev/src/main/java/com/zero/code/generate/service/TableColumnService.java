package com.zero.code.generate.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.zero.common.base.service.BaseService;
import com.zero.code.generate.entity.TableColumn;

import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * 系统数据库表字段信息表业务逻辑层接口
 *
 * @author herenpeng
 * @since 2021-03-28 18:11
 */
public interface TableColumnService extends BaseService<TableColumn> {

    /**
     * 分页查询系统数据库表字段信息表数据
     *
     * @param currentPage      当前页面数，页面从1开始
     * @param size             当前页的大小，默认为10
     * @param queryTableColumn 查询系统数据库表字段信息表的条件
     * @return 分页查询所有的系统数据库表字段信息表数据
     * @throws Exception 抛出异常
     */
    IPage<TableColumn> page(Integer currentPage, Integer size, TableColumn queryTableColumn) throws Exception;

    /**
     * 查询所有的系统数据库表字段信息表数据
     *
     * @param queryTableColumn 查询系统数据库表字段信息表的条件
     * @return 查询所有的系统数据库表字段信息表数据
     * @throws Exception 抛出异常
     */
    List<TableColumn> list(TableColumn queryTableColumn) throws Exception;

    /**
     * 分页查询逻辑删除的系统数据库表字段信息表数据
     *
     * @param currentPage      当前页面数，页面从1开始
     * @param size             当前页的大小，默认为10
     * @param queryTableColumn 查询系统数据库表字段信息表的条件
     * @return 分页查询逻辑删除的系统数据库表字段信息表数据
     * @throws Exception 抛出异常
     */
    IPage<TableColumn> recoverPage(Integer currentPage, Integer size, TableColumn queryTableColumn) throws Exception;

    /**
     * 通过主键恢复逻辑删除的系统数据库表字段信息表数据
     *
     * @param id 系统数据库表字段信息表主键
     * @throws Exception 抛出异常
     */
    void recover(Integer id) throws Exception;

    /**
     * 回收站删除，通过系统数据库表字段信息表主键彻底删除系统数据库表字段信息表数据
     *
     * @param id 系统数据库表字段信息表主键
     * @throws Exception 抛出异常
     */
    void recoverDelete(Integer id) throws Exception;

    /**
     * 通过tableInfoId获取所有的字段信息
     *
     * @param tableInfoId tableInfo主键
     * @return 表对应的所有字段信息
     * @throws Exception 抛出异常
     */
    List<TableColumn> getByTableInfoId(Integer tableInfoId) throws Exception;

    /**
     * 导出系统数据库表字段信息表列表数据的Excel文件
     *
     * @param queryTableColumn 查询系统数据库表字段信息表的条件
     * @param response         HttpServletResponse对象
     * @throws Exception 抛出异常
     */
    void exportExcel(TableColumn queryTableColumn, HttpServletResponse response) throws Exception;


}
