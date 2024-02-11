package com.zero.auth.service.impl;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.zero.auth.annotation.RootDefend;
import com.zero.auth.entity.Role;
import com.zero.auth.entity.User;
import com.zero.auth.entity.UserInfo;
import com.zero.auth.entity.UserRole;
import com.zero.auth.enums.LoginTypeEnum;
import com.zero.auth.kit.PasswordKit;
import com.zero.auth.kit.TokenKit;
import com.zero.auth.mapper.*;
import com.zero.auth.properties.RootProperties;
import com.zero.auth.service.LoginLogService;
import com.zero.auth.service.RoleService;
import com.zero.auth.service.UserService;
import com.zero.common.base.service.impl.BaseServiceImpl;
import com.zero.common.exception.AppException;
import com.zero.common.exception.AppExceptionEnum;
import com.zero.common.kit.ExcelKit;
import jakarta.servlet.http.HttpServletResponse;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.io.Serializable;
import java.util.List;

/**
 * 用户业务逻辑层的实现类
 *
 * @author herenpeng
 * @since 2020-09-07 19:20
 */
@Slf4j
@RequiredArgsConstructor
@Service
@Transactional(rollbackFor = Exception.class)
public class UserServiceImpl extends BaseServiceImpl<UserMapper, User> implements UserService {

    private final RoleMapper roleMapper;

    private final UserRoleMapper userRoleMapper;

    private final UserInfoMapper userInfoMapper;

    private final RootProperties rootProperties;

    private final TokenKit tokenKit;

    private final LoginLogMapper loginLogMapper;

    private final RoleService roleService;

    private final LoginLogService loginLogService;

    /**
     * 普通用户默认密码
     */
    @Value("${zero.auth.user.default-password:111111}")
    private String defaultPassword;

    @Override
    public IPage<User> page(Integer currentPage, Integer size, User queryUser) throws Exception {
        queryUser.setDeleted(false);
        IPage<User> page = new Page<>(currentPage, size);
        IPage<User> pageInfo = baseMapper.getPage(page, queryUser);
        for (User user : pageInfo.getRecords()) {
            user.setRoles(roleMapper.getByUserId(user.getId()));
            user.setOnlineLoginLogs(loginLogMapper.getOnlineByUserId(user.getId()));
        }
        return pageInfo;
    }

    @Override
    public List<User> list(User queryUser) throws Exception {
        return baseMapper.getList(queryUser);
    }

    @Override
    public boolean save(User user) {
        // 删除用户名中头尾的空格字符
        user.setUsername(StringUtils.trim(user.getUsername()));
        String encodePassword = PasswordKit.sha256(defaultPassword);
        user.setPassword(encodePassword);
        // 本地系统添加的用户类型为 LOCAL
        user.setType(LoginTypeEnum.PASSWORD);
        boolean result = super.save(user);
        // 赋予该用户默认角色
        roleService.setAcquiescence(user.getId());
        // 插入User对象之后，同时插入一个UserInfo对象
        UserInfo userInfo = new UserInfo();
        userInfo.setId(user.getId());
        userInfoMapper.insert(userInfo);
        return result;
    }

    @Override
    @RootDefend(userId = "#id")
    public void enabled(Integer id, Boolean enabled) throws Exception {
        User user = new User();
        user.setId(id);
        user.setEnabled(enabled);
        baseMapper.updateById(user);
    }


    @Override
    public User token(String accessToken) throws Exception {
        User user = tokenKit.getUser(accessToken);
        UserInfo userInfo = userInfoMapper.selectById(user.getId());
        user.setUserInfo(userInfo);
        return user;
    }

    @Override
    @RootDefend(userId = "#user.id")
    public boolean updateById(User user) {
        return super.updateById(user);
    }

    @Override
    @RootDefend(userId = "#id")
    public boolean removeById(Serializable id) {
        return super.removeById(id);
    }

    @Override
    @RootDefend(userId = "#userId")
    public void deleteUserRole(Integer userId, Integer roleId) throws Exception {
        userRoleMapper.deleteUserRole(userId, roleId);
    }

    @Override
    public List<Role> getUserNotRoleList(Integer userId) throws Exception {
        return roleMapper.getUserNotRoleList(userId);
    }

    @Override
    @RootDefend(userId = "#userId")
    public void addUserRole(Integer userId, Integer roleId) throws Exception {
        UserRole userRole = new UserRole();
        userRole.setUserId(userId);
        userRole.setRoleId(roleId);
        userRoleMapper.insert(userRole);
    }

    @Override
    public Boolean checkUsername(String username) throws Exception {
        return baseMapper.checkUsername(username, LoginTypeEnum.PASSWORD);
    }

    @Override
    public Boolean checkPassword(String password) throws Exception {
        Integer id = tokenKit.getUserId(request);
        User user = baseMapper.selectById(id);
        return StringUtils.equals(PasswordKit.sha256(password), user.getPassword());
    }

    @Override
    public IPage<User> recoverPage(Integer currentPage, Integer size, User queryUser) throws Exception {
        queryUser.setDeleted(true);
        IPage<User> page = new Page<>(currentPage, size);
        IPage<User> pageInfo = baseMapper.getPage(page, queryUser);
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
        ExcelKit.exportExcel("用户列表", User.class, exportData, response);
    }

    @Override
    public void resetPassword(String oldPassword, String newPassword) throws Exception {
        Integer id = tokenKit.getUserId(request);
        User user = baseMapper.selectById(id);
        // 后端进行旧密码和用户输入的旧密码匹配校验
        if (!checkPassword(oldPassword)) {
            log.error("[重置用户密码]用户{}密码输入错误", user.getUsername());
            throw new AppException(AppExceptionEnum.PASSWORD_ERROR);
        }
        // 删除密码中的所有空格字符
        String encodePassword = PasswordKit.sha256(StringUtils.deleteWhitespace(newPassword));
        user.setPassword(encodePassword);
        baseMapper.updateById(user);
        // 重置账号密码后对该账号的所有在线用户进行下线操作
        loginLogService.offlineAll(id);
    }


}
