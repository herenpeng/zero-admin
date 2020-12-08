package com.zero.sys.security.handler;

import com.zero.common.response.domain.ResponseData;
import com.zero.sys.request.util.RequestUtils;
import com.zero.sys.response.util.ResponseUtils;
import com.zero.sys.security.jwt.peoperty.JwtProperties;
import com.zero.sys.security.jwt.util.JwtUtils;
import lombok.SneakyThrows;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
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
@Component
public class MyLogoutHandler implements LogoutHandler {

    @Autowired
    private RedisTemplate redisTemplate;

    @Autowired
    private RequestUtils requestUtils;

    @Autowired
    private JwtProperties jwtProperties;

    @Autowired
    private JwtUtils jwtUtils;

    @Autowired
    private ResponseUtils responseUtils;

    @SneakyThrows
    @Override
    public void logout(HttpServletRequest request, HttpServletResponse response, Authentication authentication) {
        String token = requestUtils.getToken(request);
        String tokenId = jwtUtils.getId(token);
        redisTemplate.opsForHash().delete(jwtProperties.getKey(), tokenId);
        ResponseData<Object> responseData = ResponseData.ok().message("退出成功");
        responseUtils.responseJson(response, responseData);
    }
}
