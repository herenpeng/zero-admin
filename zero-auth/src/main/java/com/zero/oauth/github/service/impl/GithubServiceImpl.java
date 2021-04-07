package com.zero.oauth.github.service.impl;

import com.zero.auth.entity.User;
import com.zero.auth.mapper.UserMapper;
import com.zero.oauth.github.entity.GithubUser;
import com.zero.oauth.github.mapper.GithubUserMapper;
import com.zero.oauth.github.service.GithubService;
import com.zero.oauth.github.util.GithubUtils;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.ObjectUtils;

import javax.servlet.http.HttpServletRequest;
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

    private final PasswordEncoder passwordEncoder;

    private final UserMapper userMapper;

    @Override
    public String login(String code, String state, HttpServletRequest request) throws Exception {
        String accessToken = githubUtils.getGithubToken(code);
        GithubUser githubUser = githubUtils.getGithubUser(accessToken);
        Integer id = githubUserMapper.selectIdByGithubId(githubUser.getGithubId());
        // 如果本地数据库没有该 Github 的用户信息，说明的第一次授权登录
        if (ObjectUtils.isEmpty(id)) {
            User user = new User();
            user.setUsername(githubUser.getLogin());
            // 设置一个随机密码
            user.setPassword(passwordEncoder.encode(UUID.randomUUID().toString()));
            userMapper.insert(user);
            // 直接插入该用户数据
            githubUserMapper.insert(githubUser);
        } else {
            // 否则则更新本地信息，因为 Github 的用户信息可能会被用户修改
            githubUser.setId(id);
            githubUserMapper.updateById(githubUser);
        }

        return null;
    }
}
