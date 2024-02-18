package com.zero.sys.event;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.zero.auth.entity.Role;
import com.zero.auth.entity.User;
import com.zero.auth.entity.UserRole;
import com.zero.auth.enums.LoginTypeEnum;
import com.zero.auth.kit.PasswordKit;
import com.zero.auth.mapper.RoleMapper;
import com.zero.auth.mapper.UserMapper;
import com.zero.auth.mapper.UserRoleMapper;
import com.zero.auth.properties.RootProperties;
import com.zero.common.event.AppEvent;
import com.zero.common.event.AppStartEvent;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;

/**
 * root用户事件，在系统启动时，插入root角色和root用户，并关联两者的关系
 *
 * @author herenpeng
 * @since 2021-01-02 22:51
 */
@Slf4j
@RequiredArgsConstructor
@AppStartEvent(sort = 1, enable = true)
@Component
public class RootUserEvent implements AppEvent {

    private final RootProperties rootProperties;

    private final UserMapper userMapper;

    private final RoleMapper roleMapper;

    private final UserRoleMapper userRoleMapper;

    @Override
    public void doEvent() throws Exception {
        // 如果root用户为空，插入一个root用户
        User user = userMapper.loadUserByUsername(rootProperties.getUsername(), LoginTypeEnum.PASSWORD);
        if (user == null) {
            user = new User();
            user.setUsername(rootProperties.getUsername());
            String encodePassword = PasswordKit.sha256(rootProperties.getPassword());
            user.setPassword(encodePassword);
            user.setEnabled(true);
            user.setLocked(false);
            user.setAccountExpire(false);
            user.setPasswordExpire(false);
            userMapper.insert(user);
        }
        // 如果root角色为空，插入一个root角色
        Role role = roleMapper.getByName(rootProperties.getRoleName());
        if (role == null) {
            role = new Role();
            role.setName(rootProperties.getRoleName());
            role.setDescription(rootProperties.getRoleDescription());
            roleMapper.insert(role);
        }
        // 如果root用户角色关系为空，插入一个root用户角色关系
        UserRole userRole = new UserRole();
        userRole.setUserId(user.getId());
        userRole.setRoleId(role.getId());
        UserRole queryUserRole = userRoleMapper.selectOne(new QueryWrapper<>(userRole));
        if (queryUserRole == null) {
            userRoleMapper.insert(userRole);
        }
    }

}
