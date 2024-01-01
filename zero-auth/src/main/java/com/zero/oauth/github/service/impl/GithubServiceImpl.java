package com.zero.oauth.github.service.impl;

import com.zero.auth.entity.Role;
import com.zero.auth.entity.User;
import com.zero.auth.entity.UserInfo;
import com.zero.auth.enums.UserTypeEnums;
import com.zero.auth.mapper.RoleMapper;
import com.zero.auth.mapper.UserInfoMapper;
import com.zero.auth.mapper.UserMapper;
import com.zero.auth.security.util.LoginUtils;
import com.zero.auth.service.RoleService;
import com.zero.oauth.github.entity.GithubUser;
import com.zero.oauth.github.mapper.GithubUserMapper;
import com.zero.oauth.github.service.GithubService;
import com.zero.oauth.github.util.GithubUtils;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
//import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.ObjectUtils;

import jakarta.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.UUID;

/**
 * @author herenpeng
 * @since 2021-04-05 18:40
 */
@Slf4j
@RequiredArgsConstructor
@Service
@Transactional(rollbackFor = Exception.class)
public class GithubServiceImpl implements GithubService {

    private final GithubUtils githubUtils;

    private final GithubUserMapper githubUserMapper;

//    private final PasswordEncoder passwordEncoder;

    private final UserMapper userMapper;

    private final RoleMapper roleMapper;

    private final RoleService roleService;

    private final UserInfoMapper userInfoMapper;

    private final LoginUtils loginUtils;

    @Override
    public String login(String code, String state, HttpServletRequest request) throws Exception {
        String accessToken = githubUtils.getGithubToken(code);
        GithubUser githubUser = githubUtils.getGithubUser(accessToken);
        GithubUser localGithubUser = githubUserMapper.selectByGithubId(githubUser.getGithubId());
        User user;
        // 如果本地数据库没有该 Github 的用户信息，说明的第一次授权登录
        if (ObjectUtils.isEmpty(localGithubUser)) {
            user = githubUserFirstLogin(githubUser);
        } else {
            // 否则则更新本地信息，因为 Github 的用户信息可能会被用户修改
            user = updateGithubUser(githubUser, localGithubUser);
        }
        // 开始生成本地 JWT
        List<Role> roles = roleMapper.getByUserId(user.getId());
        user.setRoles(roles);
        return loginUtils.generateJwt(user, request);
    }


    /**
     * 从github获取的用户信息，并插入本地数据库
     *
     * @param githubUser 远端的 Github 用户信息
     */
    private User githubUserFirstLogin(GithubUser githubUser) {
        User user = new User();
        user.setUsername(githubUser.getLogin());
        // 设置一个随机密码
//        user.setPassword(passwordEncoder.encode(UUID.randomUUID().toString()));
        user.setPassword(UUID.randomUUID().toString());
        // 添加的用户类型为 GITHUB
        user.setType(UserTypeEnums.GITHUB);
        userMapper.insert(user);
        Integer userId = user.getId();
        // 赋予该用户默认角色
        roleService.setAcquiescence(userId);
        // 插入User对象之后，同时插入一个UserInfo对象
        UserInfo userInfo = new UserInfo();
        userInfo.setId(userId);
        String email = githubUser.getEmail();
        if (StringUtils.isNotBlank(email)) {
            userInfo.setMail(email);
        }
        String avatarUrl = githubUser.getAvatarUrl();
        if (StringUtils.isNotBlank(avatarUrl)) {
            userInfo.setAvatar(avatarUrl);
        }
        userInfoMapper.insert(userInfo);
        // 将用户主键关联道githubUser中
        githubUser.setUserId(userId);
        githubUserMapper.insert(githubUser);
        return user;
    }

    /**
     * 更新 Github 的用户信息
     *
     * @param githubUser      远端的 Github 用户信息
     * @param localGithubUser 本地的 Github 用户信息
     */
    private User updateGithubUser(GithubUser githubUser, GithubUser localGithubUser) {
        githubUser.setId(localGithubUser.getId());
        Integer userId = localGithubUser.getUserId();
        githubUser.setUserId(userId);
        // 更新 Github 用户信息
        githubUserMapper.updateById(githubUser);

        // 更新用户名
        User user = userMapper.selectById(userId);
        user.setUsername(githubUser.getLogin());
        userMapper.updateById(user);

        UserInfo userInfo = userInfoMapper.selectById(userId);
        String email = githubUser.getEmail();
        // 当本地的邮箱为空，并且 github 用户的邮箱信息不为空的时候，才将 github 远端的邮箱信息更新到本地
        if (StringUtils.isBlank(userInfo.getMail()) && StringUtils.isNotBlank(email)) {
            userInfo.setMail(email);
        }
        // 当本地的头像路径为空，并且 github 用户的头像路径不为空的时候，才将 github 远端的头像路径更新到本地
        String avatarUrl = githubUser.getAvatarUrl();
        if (StringUtils.isBlank(userInfo.getAvatar()) && StringUtils.isNotBlank(avatarUrl)) {
            userInfo.setAvatar(avatarUrl);
        }
        // 更新本地 UserInfo 信息
        userInfoMapper.updateById(userInfo);
        return user;
    }


}
