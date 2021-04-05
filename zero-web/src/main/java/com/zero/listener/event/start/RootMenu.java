package com.zero.listener.event.start;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.zero.auth.entity.Role;
import com.zero.auth.mapper.RoleMapper;
import com.zero.auth.properties.RoleProperties;
import com.zero.common.listener.annotation.EventSort;
import com.zero.common.listener.event.StartEvent;
import com.zero.sys.entity.Menu;
import com.zero.sys.entity.MenuRole;
import com.zero.sys.mapper.MenuMapper;
import com.zero.sys.mapper.MenuRoleMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;
import org.springframework.util.ObjectUtils;

import java.util.List;

/**
 * root用户菜单事件，插入root用户的所有菜单权限
 *
 * @author herenpeng
 * @since 2021-01-03 12:15
 */
@Slf4j
@RequiredArgsConstructor
@EventSort(2)
@Component
public class RootMenu implements StartEvent {

    private final MenuMapper menuMapper;

    private final RoleMapper roleMapper;

    private final MenuRoleMapper menuRoleMapper;

    private final RoleProperties roleProperties;

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
