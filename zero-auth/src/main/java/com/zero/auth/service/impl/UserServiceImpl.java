package com.zero.auth.service.impl;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.zero.auth.entity.Role;
import com.zero.auth.entity.User;
import com.zero.auth.entity.UserInfo;
import com.zero.auth.entity.UserRole;
import com.zero.auth.mapper.RoleMapper;
import com.zero.auth.mapper.UserInfoMapper;
import com.zero.auth.mapper.UserMapper;
import com.zero.auth.mapper.UserRoleMapper;
import com.zero.auth.properties.UserProperties;
import com.zero.auth.security.jwt.util.JwtUtils;
import com.zero.auth.service.UserService;
import com.zero.common.base.service.impl.BaseServiceImpl;
import com.zero.common.exception.MyException;
import com.zero.common.exception.MyExceptionEnum;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.HttpServletResponse;
import java.io.Serializable;
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
    private UserInfoMapper userInfoMapper;

    @Autowired
    private PasswordEncoder passwordEncoder;

    @Autowired
    private UserProperties userProperties;

    @Autowired
    private JwtUtils jwtUtils;

    @Override
    public IPage<User> page(Integer currentPage, Integer size, User queryUser) throws Exception {
        IPage<User> page = new Page<>(currentPage, size);
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
        int result = baseMapper.insert(user);
        // 插入User对象之后，同时插入一个UserInfo对象
        UserInfo userInfo = new UserInfo();
        userInfo.setId(user.getId());
        userInfoMapper.insert(userInfo);
        return retBool(result);
    }

    @Override
    public void enabled(Integer id, Boolean enabled) throws Exception {
        verifyRootPermissions(id);
        User user = new User();
        user.setId(id);
        user.setEnabled(enabled);
        baseMapper.updateById(user);
    }


    @Override
    public User token(String accessToken) throws Exception {
        User user = jwtUtils.getUser(accessToken);
        UserInfo userInfo = userInfoMapper.selectById(user.getId());
        user.setUserInfo(userInfo);
        return user;
    }

    @Override
    public boolean updateById(User user) {
        verifyRootPermissions(user.getId());
        return super.updateById(user);
    }

    @Override
    public boolean removeById(Serializable id) {
        verifyRootPermissions(id);
        return super.removeById(id);
    }

    @Override
    public void deleteUserRole(Integer userId, Integer roleId) throws Exception {
        verifyRootPermissions(userId);
        userRoleMapper.deleteUserRole(userId, roleId);
    }

    @Override
    public List<Role> getUserNotRoleList(Integer userId) throws Exception {
        return roleMapper.getUserNotRoleList(userId);
    }

    @Override
    public void addUserRole(Integer userId, Integer roleId) throws Exception {
        verifyRootPermissions(userId);
        UserRole userRole = new UserRole();
        userRole.setUserId(userId);
        userRole.setRoleId(roleId);
        userRoleMapper.insert(userRole);
    }

    @Override
    public Boolean checkUsername(String username) throws Exception {
        return baseMapper.checkUsername(username);
    }

    @Override
    public Boolean checkPassword(String password) throws Exception {
        Integer id = jwtUtils.getUserId(request);
        User user = baseMapper.selectById(id);
        return passwordEncoder.matches(password, user.getPassword());
    }

    @Override
    public IPage<User> recoverPage(Integer currentPage, Integer size, User queryUser) throws Exception {
        IPage<User> page = new Page<>(currentPage, size);
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

    @Override
    public void resetPassword(String oldPassword, String newPassword) throws Exception {
        Integer id = jwtUtils.getUserId(request);
        User user = baseMapper.selectById(id);
        if (!checkPassword(oldPassword)) {
            log.error("[重置用户密码]用户{}密码输入错误", user.getUsername());
            throw new MyException(MyExceptionEnum.PASSWORD_ERROR);
        }
        // 删除密码中的所有空格字符
        String encodeNewPassword = passwordEncoder.encode(StringUtils.deleteWhitespace(newPassword));
        user.setPassword(encodeNewPassword);
        baseMapper.updateById(user);
    }

    /**
     * 校验Root用户的权限，不允许所有用户对该Root账号进行修改，删除，增删角色等等操作
     *
     * @param id 用户主键
     */
    private void verifyRootPermissions(Serializable id) {
        User user = baseMapper.selectById(id);
        if (StringUtils.equals(userProperties.getRootUsername(), user.getUsername())) {
            throw new MyException(MyExceptionEnum.ACCESS_DENIED);
        }
    }


}
