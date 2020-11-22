package com.zero.sys.service.impl;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.zero.common.base.service.impl.BaseServiceImpl;
import com.zero.sys.entity.Menu;
import com.zero.sys.entity.MenuRole;
import com.zero.sys.entity.Role;
import com.zero.sys.mapper.MenuMapper;
import com.zero.sys.mapper.MenuRoleMapper;
import com.zero.sys.mapper.RoleMapper;
import com.zero.sys.request.util.RequestUtils;
import com.zero.sys.security.jwt.util.JwtUtils;
import com.zero.sys.service.MenuService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
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
@Service
@Transactional(rollbackFor = Exception.class)
public class MenuServiceImpl extends BaseServiceImpl<MenuMapper, Menu> implements MenuService {

    @Autowired
    private RoleMapper roleMapper;

    @Autowired
    private MenuRoleMapper menuRoleMapper;

    @Autowired
    private JwtUtils jwtUtils;

    @Autowired
    private RequestUtils requestUtils;

    @Override
    public IPage<Menu> page(Integer currentPage, Integer size, Menu queryMenu) throws Exception {
        Page page = new Page(currentPage, size);
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
    public List<Menu> getRoutes() throws Exception {
        Integer userId = jwtUtils.getUserId(requestUtils.getToken(request));
        List<Menu> parentList = baseMapper.getRoutes(userId,null);
        for (Menu menu : parentList) {
            menu.setChildren(baseMapper.getRoutes(userId, menu.getId()));
        }
        return parentList;
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

}