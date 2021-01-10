package com.zero.listener.event.start;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.zero.common.listener.annotation.EventSort;
import com.zero.common.listener.event.StartEvent;
import com.zero.sys.entity.Menu;
import com.zero.sys.entity.MenuRole;
import com.zero.sys.entity.Role;
import com.zero.sys.mapper.MenuMapper;
import com.zero.sys.mapper.MenuRoleMapper;
import com.zero.sys.mapper.RoleMapper;
import com.zero.sys.properties.RoleProperties;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.util.ObjectUtils;

import java.util.List;

/**
 * root用户菜单事件，插入root用户的所有菜单权限
 *
 * @author herenpeng
 * @since 2021-01-03 12:15
 */
@EventSort(2)
@Component
public class RootMenu implements StartEvent {

    @Autowired
    private MenuMapper menuMapper;

    @Autowired
    private RoleMapper roleMapper;

    @Autowired
    private MenuRoleMapper menuRoleMapper;

    @Autowired
    private RoleProperties roleProperties;

    @Override
    public void doEvent() throws Exception {
        List<Menu> menuList = menuMapper.selectList(null);
        Role role = roleMapper.getByName(roleProperties.getRootName());
        for (Menu menu : menuList) {
            MenuRole menuRole = new MenuRole();
            menuRole.setMenuId(menu.getId());
            menuRole.setRoleId(role.getId());
            QueryWrapper<MenuRole> queryWrapper = new QueryWrapper(menuRole);
            MenuRole menuRole1 = menuRoleMapper.selectOne(queryWrapper);
            if (ObjectUtils.isEmpty(menuRole1)) {
                menuRoleMapper.insert(menuRole);
            }
        }
    }

}
