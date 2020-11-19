package com.zero.sys.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.zero.common.base.service.BaseService;
import com.zero.sys.entity.Menu;

import java.util.List;

/**
 * 系统菜单表业务逻辑层接口
 *
 * @author herenpeng
 * @since 2020-11-15 21:20
 */
public interface MenuService extends BaseService<Menu> {

    /**
     * 分页查询用户数据
     *
     * @param currentPage 当前页面数，页面从1开始
     * @param size        当前页的大小，默认为10
     * @param queryMenu   查询系统菜单表的条件
     * @return 分页查询的所有系统菜单表数据
     * @throws Exception 抛出异常
     */
    IPage<Menu> page(Integer currentPage, Integer size, Menu queryMenu) throws Exception;


    /**
     * 获取所有的父级菜单信息，以及菜单的子菜单
     *
     * @return 所有的父级菜单信息，以及菜单的子菜单
     * @throws Exception 抛出异常
     */
    List<Menu> getList() throws Exception;
}
