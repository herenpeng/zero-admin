package com.zero.sys.event;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.zero.auth.entity.Role;
import com.zero.auth.mapper.RoleMapper;
import com.zero.auth.properties.RootProperties;
import com.zero.common.event.AppEvent;
import com.zero.common.event.AppStartEvent;
import com.zero.sys.entity.Menu;
import com.zero.sys.entity.MenuRole;
import com.zero.sys.mapper.MenuMapper;
import com.zero.sys.mapper.MenuRoleMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * root用户菜单事件，插入root用户的所有菜单权限
 *
 * @author herenpeng
 * @since 2021-01-03 12:15
 */
@Slf4j
@RequiredArgsConstructor
@AppStartEvent(sort = 2, enable = true)
@Component
public class RootMenuEvent implements AppEvent {

    private final MenuMapper menuMapper;

    private final RoleMapper roleMapper;

    private final MenuRoleMapper menuRoleMapper;

    private final RootProperties rootProperties;

    @Override
    public void doEvent() throws Exception {
        List<Menu> menuList = menuMapper.selectList(null);
        Role role = roleMapper.getByName(rootProperties.getRoleName());
        for (Menu menu : menuList) {
            MenuRole menuRole = new MenuRole();
            menuRole.setMenuId(menu.getId());
            menuRole.setRoleId(role.getId());
            MenuRole queryMenuRole = menuRoleMapper.selectOne(new QueryWrapper<>(menuRole));
            if (queryMenuRole == null) {
                menuRoleMapper.insert(menuRole);
            }
        }
    }

}
