package com.zero.auth.security.handler;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.zero.auth.entity.User;
import com.zero.auth.security.jwt.properties.JwtProperties;
import com.zero.auth.security.jwt.util.JwtUtils;
import com.zero.auth.security.userdetails.MyUserDetails;
import com.zero.auth.service.LoginLogService;
import com.zero.auth.util.ResponseUtils;
import com.zero.common.constant.StringConst;
import com.zero.common.response.domain.ResponseData;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.UUID;
import java.util.concurrent.TimeUnit;

/**
 * 登录成功的处理器
 *
 * @author herenpeng
 * @since 2020-09-13 15:27
 */
@Component
public class MyLoginSuccessHandler implements AuthenticationSuccessHandler {

    @Autowired
    private ObjectMapper objectMapper;

    @Autowired
    private RedisTemplate redisTemplate;

    @Autowired
    private JwtProperties jwtProperties;

    @Autowired
    private JwtUtils jwtUtils;

    @Autowired
    private ResponseUtils responseUtils;

    @Autowired
    private LoginLogService loginLogService;


    @Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication) throws IOException, ServletException {
        MyUserDetails myUserDetails = (MyUserDetails) authentication.getPrincipal();
        // 不应该把密码放入JWT的载荷中
        User user = myUserDetails.getUser();
        String tokenId = UUID.randomUUID().toString();
        String subject = objectMapper.writeValueAsString(user);
        // 创建JWT
        String jwt = jwtUtils.createJWT(tokenId, subject);
        // 将jwt存放入redis中
        String tokenRedisKey = jwtProperties.getKey() + StringConst.COLON + tokenId;
        Long tokenRedisTtl = jwtProperties.getTtl() / 1000;
        redisTemplate.opsForValue().set(tokenRedisKey, jwt, tokenRedisTtl, TimeUnit.SECONDS);

        // 记录登录日志
        loginLogService.loginLog(request, user.getId(), tokenId);

        ResponseData<String> responseData = ResponseData.ok(jwt);
        responseUtils.responseJson(response, responseData);
    }

}
