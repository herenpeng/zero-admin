package com.zero.auth.service.impl;

import com.zero.auth.entity.User;
import com.zero.auth.enums.LoginTypeEnum;
import com.zero.auth.kit.LoginKit;
import com.zero.auth.kit.PasswordKit;
import com.zero.auth.kit.TokenKit;
import com.zero.auth.mapper.UserMapper;
import com.zero.auth.properties.JwtProperties;
import com.zero.auth.service.LoginLogService;
import com.zero.auth.service.LoginService;
import com.zero.common.constant.AppConst;
import com.zero.common.exception.AppException;
import com.zero.common.exception.AppExceptionEnum;
import com.zero.common.kit.RedisKit;
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
    private final LoginKit loginKit;
    private final JwtProperties jwtProperties;
    private final RedisKit redisKit;
    private final LoginLogService loginLogService;
    private final TokenKit tokenKit;

    @Override
    public String login(String username, String password, HttpServletRequest request) {
        User user = userMapper.loadUserByUsername(username, LoginTypeEnum.PASSWORD);
        if (ObjectUtils.isEmpty(user)) {
            log.error("[登录功能]用户名{}不存在！", username);
            throw new AppException(AppExceptionEnum.LOGIN_USERNAME_ERROR);
        }
        String shaPassword = PasswordKit.sha256(password);
        if (StringUtils.isBlank(shaPassword) || !StringUtils.equals(shaPassword, user.getPassword())) {
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
        return loginKit.generateJwt(user, request);
    }

    @Override
    public void logout(HttpServletRequest request) {
        String token = tokenKit.getToken(request);
        String tokenId = tokenKit.getId(token);
        Integer userId = tokenKit.getUserId(token);

        // 登出的时候，更新登录记录
        loginLogService.logoutLog(userId, tokenId);
        String tokenRedisKey = jwtProperties.getKey() + AppConst.COLON + tokenId;
        redisKit.del(tokenRedisKey);
    }
}
