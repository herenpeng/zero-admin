package com.zero.sys.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.zero.common.base.service.BaseService;
import com.zero.sys.entity.Resources;
import com.zero.sys.entity.Role;

import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * 系统资源的业务逻辑层接口
 *
 * @author herenpeng
 * @since 2020-10-20 21:56
 */
public interface ResourcesService extends BaseService<Resources> {

    /**
     * 分页查询系统资源数据
     *
     * @param currentPage    当前页面数，页面从1开始
     * @param size           当前页的大小，默认为10
     * @param queryResources 查询系统资源的条件
     * @return 分页查询所有的系统资源数据
     * @throws Exception 抛出异常
     */
    IPage<Resources> page(Integer currentPage, Integer size, Resources queryResources) throws Exception;

    /**
     * 查询所有的系统资源数据
     *
     * @param queryResources 查询系统资源的条件
     * @return 查询所有的系统资源数据
     * @throws Exception 抛出异常
     */
    List<Resources> list(Resources queryResources) throws Exception;

    /**
     * 删除系统资源的角色
     *
     * @param resourcesId 系统资源主键
     * @param roleId      角色主键
     * @throws Exception
     */
    void deleteResourcesRole(Integer resourcesId, Integer roleId) throws Exception;

    /**
     * 获取该系统资源没有的角色信息
     *
     * @param resourcesId 系统资源主键
     * @return 系统资源未拥有的角色集合
     * @throws Exception 抛出异常
     */
    List<Role> getResourcesNotRoleList(Integer resourcesId) throws Exception;

    /**
     * 添加系统资源角色关系
     *
     * @param resourcesId 系统资源主键
     * @param roleId      角色主键
     * @throws Exception 抛出异常
     */
    void addResourcesRole(Integer resourcesId, Integer roleId) throws Exception;

    /**
     * 分页查询逻辑删除的系统资源表数据
     *
     * @param currentPage    当前页面数，页面从1开始
     * @param size           当前页的大小，默认为10
     * @param queryResources 查询系统资源表的条件
     * @return 分页查询逻辑删除的系统资源表数据
     * @throws Exception 抛出异常
     */
    IPage<Resources> recoverPage(Integer currentPage, Integer size, Resources queryResources) throws Exception;

    /**
     * 通过主键恢复逻辑删除的系统资源表数据
     *
     * @param id 系统资源表主键
     * @throws Exception 抛出异常
     */
    void recover(Integer id) throws Exception;

    /**
     * 回收站删除，通过系统资源表主键彻底删除系统资源表数据
     *
     * @param id 系统资源表主键
     * @throws Exception 抛出异常
     */
    void recoverDelete(Integer id) throws Exception;


    /**
     * 导出系统资源列表数据的Excel文件
     *
     * @param queryResources 查询系统资源的条件
     * @param response       HttpServletResponse对象
     * @throws Exception 抛出异常
     */
    void exportExcel(Resources queryResources, HttpServletResponse response) throws Exception;
}
