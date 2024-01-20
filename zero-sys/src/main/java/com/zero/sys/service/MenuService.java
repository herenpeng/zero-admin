package com.zero.sys.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.zero.auth.entity.Role;
import com.zero.common.base.service.BaseService;
import com.zero.sys.entity.Menu;
import jakarta.servlet.http.HttpServletResponse;

import java.util.List;

/**
 * 系统菜单表业务逻辑层接口
 *
 * @author herenpeng
 * @since 2020-11-15 21:20
 */
public interface MenuService extends BaseService<Menu> {

    /**
     * 分页查询菜单数据
     *
     * @param currentPage 当前页面数，页面从1开始
     * @param size        当前页的大小，默认为10
     * @param queryMenu   查询系统菜单表的条件
     * @return 分页查询所有的系统菜单表数据
     * @throws Exception 抛出异常
     */
    IPage<Menu> page(Integer currentPage, Integer size, Menu queryMenu) throws Exception;

    /**
     * 查询所有的系统菜单数据
     *
     * @param queryMenu 查询系统菜单的条件
     * @return 查询所有的系统菜单数据
     * @throws Exception 抛出异常
     */
    List<Menu> list(Menu queryMenu) throws Exception;

    /**
     * 查询系统菜单表并构建树状结构
     *
     * @return 查询系统菜单表并构建树状结构
     * @throws Exception 抛出异常
     */
    List<Menu> tree() throws Exception;


    /**
     * 移动系统菜单表树状结构节点
     *
     * @param menu 系统菜单树状结构节节点
     * @throws Exception 抛出异常
     */
    void move(Menu menu) throws Exception;

    /**
     * [动态路由]获取所有启用（enabled=1）的父级菜单信息，以及菜单的子菜单
     *
     * @return 所有的父级菜单信息，以及菜单的子菜单
     * @throws Exception 抛出异常
     */
    List<Menu> getRoutes() throws Exception;

    /**
     * 隐藏或者显示该系统菜单
     *
     * @param id     菜单id
     * @param hidden true为隐藏，false为显示
     * @throws Exception 抛出异常
     */
    void hidden(Integer id, Boolean hidden) throws Exception;

    /**
     * 启用或者禁用该系统菜单
     *
     * @param id      菜单id
     * @param enabled true为启用，false为禁用
     * @throws Exception 抛出异常
     */
    void enabled(Integer id, Boolean enabled) throws Exception;

    /**
     * 删除菜单角色
     *
     * @param menuId 菜单主键
     * @param roleId 角色主键
     * @throws Exception 抛出异常
     */
    void deleteMenuRole(Integer menuId, Integer roleId) throws Exception;

    /**
     * 获取该菜单未拥有的角色
     *
     * @param menuId 菜单主键
     * @return 该菜单没有的角色列表
     * @throws Exception 抛出异常
     */
    List<Role> getMenuNotRoleList(Integer menuId) throws Exception;

    /**
     * 添加拥有该菜单的角色信息
     *
     * @param menuId 菜单主键
     * @param roleId 角色主键
     * @throws Exception 抛出异常
     */
    void addMenuRole(Integer menuId, Integer roleId) throws Exception;

    /**
     * 分页查询逻辑删除的系统菜单表数据
     *
     * @param currentPage 当前页面数，页面从1开始
     * @param size        当前页的大小，默认为10
     * @param queryMenu   查询系统菜单表的条件
     * @return 分页查询逻辑删除的系统菜单表数据
     * @throws Exception 抛出异常
     */
    IPage<Menu> recoverPage(Integer currentPage, Integer size, Menu queryMenu) throws Exception;

    /**
     * 通过主键恢复逻辑删除的系统菜单表数据
     *
     * @param id 系统菜单表主键
     * @throws Exception 抛出异常
     */
    void recover(Integer id) throws Exception;

    /**
     * 回收站删除，通过系统菜单表主键彻底删除系统菜单表数据
     *
     * @param id 系统菜单表主键
     * @throws Exception 抛出异常
     */
    void recoverDelete(Integer id) throws Exception;

    /**
     * 导出系统菜单列表数据的Excel文件
     *
     * @param queryMenu 查询系统菜单的条件
     * @param response  HttpServletResponse对象
     * @throws Exception 抛出异常
     */
    void exportExcel(Menu queryMenu, HttpServletResponse response) throws Exception;

}
