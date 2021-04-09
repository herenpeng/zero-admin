package com.zero.auth.security.userdetails;

import com.zero.auth.entity.User;
import com.zero.auth.enums.UserTypeEnums;
import com.zero.auth.mapper.UserMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.ObjectUtils;

/**
 * Spring Security的接口UserDetailsService的实现类，用来处理服务登录相关的业务逻辑
 *
 * @author herenpeng
 * @since 2020-09-13 8:31
 */
@Slf4j
@RequiredArgsConstructor
@Service
@Transactional(rollbackFor = Exception.class)
public class UserDetailsServiceImpl implements UserDetailsService {

    private final UserMapper userMapper;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        User user = userMapper.loadUserByUsername(username, UserTypeEnums.LOCAL);
        if (ObjectUtils.isEmpty(user)) {
            log.error("[登录功能]用户名{}不存在！", username);
            throw new UsernameNotFoundException("用户名" + username + "不存在！");
        }
        return new LoginUserDetails(user);
    }
}
