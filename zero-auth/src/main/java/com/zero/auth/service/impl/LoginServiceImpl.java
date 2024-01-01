package com.zero.auth.service.impl;

import com.zero.auth.entity.User;
import com.zero.auth.enums.UserTypeEnums;
import com.zero.auth.kit.EncryptKit;
import com.zero.auth.mapper.UserMapper;
import com.zero.auth.security.jwt.properties.JwtProperties;
import com.zero.auth.security.util.LoginUtils;
import com.zero.auth.security.util.SecurityUtils;
import com.zero.auth.service.LoginLogService;
import com.zero.auth.service.LoginService;
import com.zero.common.constant.StringConst;
import com.zero.common.exception.AppException;
import com.zero.common.exception.AppExceptionEnum;
import com.zero.common.util.RedisUtils;
import jakarta.servlet.http.HttpServletRequest;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.ObjectUtils;

@Slf4j
@RequiredArgsConstructor
@Service
@Transactional(rollbackFor = Exception.class)
public class LoginServiceImpl implements LoginService {


    private final UserMapper userMapper;
    private final LoginUtils loginUtils;
    private final JwtProperties jwtProperties;
    private final RedisUtils redisUtils;
    private final LoginLogService loginLogService;
    private final SecurityUtils securityUtils;

    @Override
    public String login(String username, String password, HttpServletRequest request) {
        User user = userMapper.loadUserByUsername(username, UserTypeEnums.LOCAL);
        if (ObjectUtils.isEmpty(user)) {
            log.error("[登录功能]用户名{}不存在！", username);
            throw new AppException(AppExceptionEnum.LOGIN_USERNAME_ERROR);
        }
        if (!StringUtils.equals(EncryptKit.sha256(password), user.getPassword())) {
            throw new AppException(AppExceptionEnum.LOGIN_PASSWORD_ERROR);
        }
        if (user.getLocked()) {
            throw new AppException(AppExceptionEnum.LOGIN_ACCOUNT_LOCKED);
        }
        if (!user.getEnabled()) {
            throw new AppException(AppExceptionEnum.LOGIN_ACCOUNT_DISABLE);
        }
        if (user.getAccountExpire()) {
            throw new AppException(AppExceptionEnum.LOGIN_ACCOUNT_EXPIRE);
        }
        if (user.getPasswordExpire()) {
            throw new AppException(AppExceptionEnum.LOGIN_PASSWORD_EXPIRE);
        }
        return loginUtils.generateJwt(user, request);
    }

    @Override
    public void logout(HttpServletRequest request) {
        String token = securityUtils.getToken(request);
        String tokenId = securityUtils.getId(token);
        Integer userId = securityUtils.getUserId(token);

        // 登出的时候，更新登入记录
        loginLogService.logoutLog(userId, tokenId);
        String tokenRedisKey = jwtProperties.getKey() + StringConst.COLON + tokenId;
        redisUtils.del(tokenRedisKey);
    }
}
