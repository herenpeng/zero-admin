package com.zero.auth.security.handler;

import com.zero.auth.entity.User;
import com.zero.auth.security.jwt.properties.JwtProperties;
import com.zero.auth.security.jwt.util.JwtUtils;
import com.zero.auth.security.userdetails.LoginUserDetails;
import com.zero.auth.service.LoginLogService;
import com.zero.auth.util.ResponseUtils;
import com.zero.common.constant.StringConst;
import com.zero.common.response.domain.ResponseData;
import com.zero.common.util.JsonUtils;
import com.zero.common.util.RedisUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.UUID;

/**
 * 登录成功的处理器
 *
 * @author herenpeng
 * @since 2020-09-13 15:27
 */
@Component
public class MyLoginSuccessHandler implements AuthenticationSuccessHandler {

    @Autowired
    private JsonUtils jsonUtils;

    @Autowired
    private RedisUtils redisUtils;

    @Autowired
    private JwtProperties jwtProperties;

    @Autowired
    private JwtUtils jwtUtils;

    @Autowired
    private ResponseUtils responseUtils;

    @Autowired
    private LoginLogService loginLogService;


    @Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication) throws IOException {
        LoginUserDetails userDetails = (LoginUserDetails) authentication.getPrincipal();
        // 不应该把密码放入JWT的载荷中
        User user = userDetails.getUser();
        String tokenId = UUID.randomUUID().toString();
        String subject = jsonUtils.toJson(user);
        // 创建JWT
        String jwt = jwtUtils.createJWT(tokenId, subject);
        // 将jwt存放入redis中
        String tokenRedisKey = jwtProperties.getKey() + StringConst.COLON + tokenId;
        redisUtils.set(tokenRedisKey, jwt, jwtProperties.getTtl());

        // 记录登录日志
        loginLogService.loginLog(request, user.getId(), tokenId);

        ResponseData<String> responseData = ResponseData.ok(jwt);
        responseUtils.responseJson(response, responseData);
    }

}
