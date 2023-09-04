package com.zero.listener.event.start;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.zero.auth.entity.Role;
import com.zero.auth.entity.User;
import com.zero.auth.entity.UserRole;
import com.zero.auth.enums.UserTypeEnums;
import com.zero.auth.mapper.RoleMapper;
import com.zero.auth.mapper.UserMapper;
import com.zero.auth.mapper.UserRoleMapper;
import com.zero.auth.properties.RoleProperties;
import com.zero.auth.properties.UserProperties;
import com.zero.common.listener.annotation.EventSort;
import com.zero.common.listener.event.StartEvent;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;
import org.springframework.util.ObjectUtils;

/**
 * root用户事件，在系统启动时，插入root角色和root用户，并关联两者的关系
 *
 * @author herenpeng
 * @since 2021-01-02 22:51
 */
@Slf4j
@RequiredArgsConstructor
@EventSort(1)
@Component
public class RootUserEvent implements StartEvent {

    private final UserProperties userProperties;

    private final UserMapper userMapper;

    private final RoleProperties roleProperties;

    private final RoleMapper roleMapper;

    private final PasswordEncoder passwordEncoder;

    private final UserRoleMapper userRoleMapper;

    @Override
    public void doEvent() throws Exception {
        // 如果root用户为空，插入一个root用户
        User user = userMapper.loadUserByUsername(userProperties.getRootUsername(), UserTypeEnums.LOCAL);
        if (ObjectUtils.isEmpty(user)) {
            user = new User();
            user.setUsername(userProperties.getRootUsername());
            String encodePassword = passwordEncoder.encode(userProperties.getRootPassword());
            user.setPassword(encodePassword);
            user.setEnabled(true);
            user.setLocked(false);
            user.setAccountExpire(false);
            user.setPasswordExpire(false);
            userMapper.insert(user);
        }
        // 如果root角色为空，插入一个root角色
        Role role = roleMapper.getByName(roleProperties.getRootName());
        if (ObjectUtils.isEmpty(role)) {
            role = new Role();
            role.setName(roleProperties.getRootName());
            role.setDescription(roleProperties.getRootDescription());
            roleMapper.insert(role);
        }
        // 如果root用户角色关系为空，插入一个root用户角色关系
        UserRole userRole = new UserRole();
        userRole.setUserId(user.getId());
        userRole.setRoleId(role.getId());
        QueryWrapper<UserRole> queryWrapper = new QueryWrapper<>(userRole);
        UserRole userRole1 = userRoleMapper.selectOne(queryWrapper);
        if (ObjectUtils.isEmpty(userRole1)) {
            userRoleMapper.insert(userRole);
        }
    }

}
