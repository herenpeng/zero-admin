package com.zero.sys.service.impl;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.zero.auth.entity.Role;
import com.zero.auth.mapper.RoleMapper;
import com.zero.auth.security.util.SecurityUtils;
import com.zero.common.base.service.impl.BaseServiceImpl;
import com.zero.common.kit.ExcelKit;
import com.zero.sys.entity.Menu;
import com.zero.sys.entity.MenuRole;
import com.zero.sys.mapper.MenuMapper;
import com.zero.sys.mapper.MenuRoleMapper;
import com.zero.sys.service.MenuService;
import jakarta.servlet.http.HttpServletResponse;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * 系统菜单表业务逻辑层的实现类
 *
 * @author herenpeng
 * @since 2020-11-15 21:20
 */
@Slf4j
@RequiredArgsConstructor
@Service
@Transactional(rollbackFor = Exception.class)
public class MenuServiceImpl extends BaseServiceImpl<MenuMapper, Menu> implements MenuService {

    private final RoleMapper roleMapper;

    private final MenuRoleMapper menuRoleMapper;

    private final SecurityUtils securityUtils;

    @Override
    public IPage<Menu> page(Integer currentPage, Integer size, Menu queryMenu) throws Exception {
        IPage<Menu> page = new Page<>(currentPage, size);
        IPage<Menu> pageInfo = baseMapper.getPage(page, queryMenu);
        for (Menu menu : pageInfo.getRecords()) {
            menu.setRoles(roleMapper.getByMenuId(menu.getId()));
            menu.setChildren(baseMapper.getByParentId(menu.getId()));
            for (Menu child : menu.getChildren()) {
                child.setRoles(roleMapper.getByMenuId(child.getId()));
            }
        }
        return pageInfo;
    }

    @Override
    public List<Menu> list(Menu queryMenu) throws Exception {
        return baseMapper.getList(queryMenu);
    }

    @Override
    public List<Menu> getRoutes() throws Exception {
        Integer userId = securityUtils.getUserId(request);
        List<Menu> parentList = baseMapper.getRoutes(userId, null);
        for (Menu menu : parentList) {
            menu.setChildren(baseMapper.getRoutes(userId, menu.getId()));
        }
        return parentList;
    }

    @Override
    public void hidden(Integer id, Boolean hidden) {
        Menu menu = new Menu();
        menu.setId(id);
        menu.setHidden(hidden);
        baseMapper.updateById(menu);
    }

    @Override
    public void enabled(Integer id, Boolean enabled) throws Exception {
        Menu menu = new Menu();
        menu.setId(id);
        menu.setEnabled(enabled);
        baseMapper.updateById(menu);
    }

    @Override
    public void deleteMenuRole(Integer menuId, Integer roleId) throws Exception {
        menuRoleMapper.deleteMenuRole(menuId, roleId);
    }

    @Override
    public List<Role> getMenuNotRoleList(Integer menuId) throws Exception {
        return roleMapper.getMenuNotRoleList(menuId);
    }

    @Override
    public void addMenuRole(Integer menuId, Integer roleId) throws Exception {
        MenuRole menuRole = new MenuRole();
        menuRole.setMenuId(menuId);
        menuRole.setRoleId(roleId);
        menuRoleMapper.insert(menuRole);
    }

    @Override
    public IPage<Menu> recoverPage(Integer currentPage, Integer size, Menu queryMenu) throws Exception {
        IPage<Menu> page = new Page<>(currentPage, size);
        IPage<Menu> pageInfo = baseMapper.getRecoverPage(page, queryMenu);
        for (Menu menu : pageInfo.getRecords()) {
            menu.setRoles(roleMapper.getByMenuId(menu.getId()));
        }
        return pageInfo;
    }

    @Override
    public void recover(Integer id) throws Exception {
        baseMapper.recoverById(id);
    }

    @Override
    public void recoverDelete(Integer id) throws Exception {
        baseMapper.recoverDelete(id);
    }


    @Override
    public void exportExcel(Menu queryMenu, HttpServletResponse response) throws Exception {
        List<Menu> exportData = list(queryMenu);
        for (Menu menu : exportData) {
            menu.setRoles(roleMapper.getByMenuId(menu.getId()));
        }
        ExcelKit.exportExcel("系统菜单列表", Menu.class, exportData, response);
    }
}