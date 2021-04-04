package com.zero.auth.security.handler;

import com.zero.auth.security.jwt.properties.JwtProperties;
import com.zero.auth.security.jwt.util.JwtUtils;
import com.zero.auth.service.LoginLogService;
import com.zero.auth.util.RequestUtils;
import com.zero.auth.util.ResponseUtils;
import com.zero.common.constant.StringConst;
import com.zero.common.response.domain.ResponseData;
import com.zero.common.util.RedisUtils;
import lombok.RequiredArgsConstructor;
import lombok.SneakyThrows;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.logout.LogoutHandler;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 登录退出处理器类
 *
 * @author herenpeng
 * @since 2020-09-13 15:25
 */
@Slf4j
@RequiredArgsConstructor
@Component
public class MyLogoutHandler implements LogoutHandler {

    private final RedisUtils redisUtils;

    private final RequestUtils requestUtils;

    private final JwtProperties jwtProperties;

    private final JwtUtils jwtUtils;

    private final ResponseUtils responseUtils;

    private final LoginLogService loginLogService;

    @SneakyThrows
    @Override
    public void logout(HttpServletRequest request, HttpServletResponse response, Authentication authentication) {
        String token = requestUtils.getToken(request);
        String tokenId = jwtUtils.getId(token);
        Integer userId = jwtUtils.getUserId(token);

        // 登出的时候，更新登入记录
        loginLogService.logoutLog(userId, tokenId);

        String tokenRedisKey = jwtProperties.getKey() + StringConst.COLON + tokenId;
        redisUtils.del(tokenRedisKey);
        ResponseData<Object> responseData = ResponseData.ok().message("退出成功");
        responseUtils.responseJson(response, responseData);
    }

}
