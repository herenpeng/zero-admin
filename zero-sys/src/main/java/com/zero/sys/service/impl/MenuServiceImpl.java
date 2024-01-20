package com.zero.sys.service.impl;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.zero.auth.entity.Role;
import com.zero.auth.kit.TokenKit;
import com.zero.auth.mapper.RoleMapper;
import com.zero.common.base.service.impl.BaseServiceImpl;
import com.zero.common.kit.ExcelKit;
import com.zero.common.kit.TreeKit;
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

    private final TokenKit tokenKit;

    @Override
    public IPage<Menu> page(Integer currentPage, Integer size, Menu queryMenu) throws Exception {
        return page(currentPage, size, queryMenu, false);
    }


    private IPage<Menu> page(Integer currentPage, Integer size, Menu queryMenu, Boolean deleted) throws Exception {
        queryMenu.setDeleted(deleted);
        IPage<Menu> page = new Page<>(currentPage, size);
        return baseMapper.getPage(page, queryMenu);
    }


    @Override
    public List<Menu> list(Menu queryMenu) throws Exception {
        return baseMapper.getList(queryMenu);
    }


    @Override
    public List<Menu> tree() throws Exception {
        return TreeKit.findChildren(0, baseMapper::getByParentId, menu -> {
            List<Role> roles = roleMapper.getByMenuId(menu.getId());
            menu.setRoles(roles);
        });
    }


    @Override
    public void move(Menu menu) throws Exception {
        TreeKit.move(menu.getId(), menu.getParentId(), menu.getSort(),
                baseMapper::selectById, baseMapper::getByParentId, this::updateBatchById);
    }


    @Override
    public List<Menu> getRoutes() throws Exception {
        Integer userId = tokenKit.getUserId(request);
        return getRoutes(userId, 0);
    }


    private List<Menu> getRoutes(Integer userId, Integer parentId) throws Exception {
        List<Menu> parentList = baseMapper.getRoutes(userId, parentId);
        for (Menu menu : parentList) {
            List<Menu> children = getRoutes(userId, menu.getId());
            menu.setChildren(children);
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
        return page(currentPage, size, queryMenu, true);
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
        List<Menu> exportData = baseMapper.getList(queryMenu);
        for (Menu menu : exportData) {
            menu.setRoles(roleMapper.getByMenuId(menu.getId()));
        }
        ExcelKit.exportExcel("系统菜单列表", Menu.class, exportData, response);
    }
}