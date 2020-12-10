package com.zero.sys.service.impl;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.zero.common.base.service.impl.BaseServiceImpl;
import com.zero.sys.entity.Role;
import com.zero.sys.entity.User;
import com.zero.sys.entity.UserRole;
import com.zero.sys.mapper.RoleMapper;
import com.zero.sys.mapper.UserMapper;
import com.zero.sys.mapper.UserRoleMapper;
import com.zero.sys.property.UserProperties;
import com.zero.sys.security.jwt.util.JwtUtils;
import com.zero.sys.service.UserService;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * 用户业务逻辑层的实现类
 *
 * @author herenpeng
 * @since 2020-09-07 19:20
 */
@Slf4j
@Service
@Transactional(rollbackFor = Exception.class)
public class UserServiceImpl extends BaseServiceImpl<UserMapper, User> implements UserService {

    @Autowired
    private RoleMapper roleMapper;

    @Autowired
    private UserRoleMapper userRoleMapper;

    @Autowired
    private PasswordEncoder passwordEncoder;

    @Autowired
    private UserProperties userProperties;

    @Autowired
    private JwtUtils jwtUtils;

    @Override
    public IPage<User> page(Integer currentPage, Integer size, User queryUser) throws Exception {
        Page page = new Page(currentPage, size);
        IPage<User> pageInfo = baseMapper.getPage(page, queryUser);
        for (User user : pageInfo.getRecords()) {
            user.setRoles(roleMapper.getByUserId(user.getId()));
        }
        return pageInfo;
    }

    @Override
    public List<User> list(User queryUser) throws Exception {
        return baseMapper.getList(queryUser);
    }

    @Override
    public boolean save(User user) {
        // 删除用户名中的所有空格字符
        user.setUsername(StringUtils.deleteWhitespace(user.getUsername()));
        String defaultPassword = userProperties.getDefaultPassword();
        String encodePassword = passwordEncoder.encode(defaultPassword);
        user.setPassword(encodePassword);
        return retBool(baseMapper.insert(user));
    }

    @Override
    public void enabled(Integer id, Boolean enabled) throws Exception {
        User user = new User();
        user.setId(id);
        user.setEnabled(enabled);
        baseMapper.updateById(user);
    }


    @Override
    public User info(String accessToken) throws Exception {
        User user = jwtUtils.getUserInfo(accessToken);
        return user;
    }

    @Override
    public void deleteUserRole(Integer userId, Integer roleId) throws Exception {
        userRoleMapper.deleteUserRole(userId, roleId);
    }

    @Override
    public List<Role> getUserNotRoleList(Integer userId) throws Exception {
        return roleMapper.getUserNotRoleList(userId);
    }

    @Override
    public void addUserRole(Integer userId, Integer roleId) throws Exception {
        UserRole userRole = new UserRole();
        userRole.setUserId(userId);
        userRole.setRoleId(roleId);
        userRoleMapper.insert(userRole);
    }

    @Override
    public IPage<User> recoverPage(Integer currentPage, Integer size, User queryUser) throws Exception {
        Page page = new Page(currentPage, size);
        IPage<User> pageInfo = baseMapper.getRecoverPage(page, queryUser);
        for (User user : pageInfo.getRecords()) {
            user.setRoles(roleMapper.getByUserId(user.getId()));
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
        userRoleMapper.deleteByUserId(id);
    }

    @Override
    public void exportExcel(User queryUser, HttpServletResponse response) throws Exception {
        List<User> exportData = list(queryUser);
        for (User user : exportData) {
            user.setRoles(roleMapper.getByUserId(user.getId()));
        }
        excelUtils.exportExcel("用户列表", User.class, exportData, response);
    }


}
