package com.zero.sys.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.zero.common.base.service.BaseService;
import com.zero.sys.entity.Organ;

import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * 系统组织机构表业务逻辑层接口
 *
 * @author herenpeng
 * @since 2024-01-13 22:07
 */
public interface OrganService extends BaseService<Organ> {

    /**
     * 分页查询系统组织机构表数据
     *
     * @param currentPage 当前页面数，页面从1开始
     * @param size        当前页的大小，默认为10
     * @param queryOrgan   查询系统组织机构表的条件
     * @return 分页查询所有的系统组织机构表数据
     * @throws Exception 抛出异常
     */
    IPage<Organ> page(Integer currentPage, Integer size, Organ queryOrgan) throws Exception;

    /**
     * 查询所有的系统组织机构表数据
     *
     * @param queryOrgan 查询系统组织机构表的条件
     * @return 查询所有的系统组织机构表数据
     * @throws Exception 抛出异常
     */
    List<Organ> list(Organ queryOrgan) throws Exception;

    /**
     * 查询系统组织机构表数据并构建树状结构
     *
     * @return 查询系统组织机构表数据并构建树状结构
     * @throws Exception 抛出异常
     */
    List<Organ> tree() throws Exception;

    /**
     * 分页查询逻辑删除的系统组织机构表数据
     *
     * @param currentPage 当前页面数，页面从1开始
     * @param size        当前页的大小，默认为10
     * @param queryOrgan  查询系统组织机构表的条件
     * @return 分页查询逻辑删除的系统组织机构表数据
     * @throws Exception 抛出异常
     */
    IPage<Organ> recoverPage(Integer currentPage, Integer size, Organ queryOrgan) throws Exception;

    /**
     * 通过主键恢复逻辑删除的系统组织机构表数据
     *
     * @param id 系统组织机构表主键
     * @throws Exception 抛出异常
     */
    void recover(Integer id) throws Exception;

    /**
     * 回收站删除，通过系统组织机构表主键彻底删除系统组织机构表数据
     *
     * @param id 系统组织机构表主键
     * @throws Exception 抛出异常
     */
    void recoverDelete(Integer id) throws Exception;

    /**
     * 导出系统组织机构表列表数据的Excel文件
     *
     * @param queryOrgan 查询系统组织机构表的条件
     * @param response  HttpServletResponse对象
     * @throws Exception 抛出异常
     */
    void exportExcel(Organ queryOrgan, HttpServletResponse response) throws Exception;

}
