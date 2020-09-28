package com.zero.sys.security.handler;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.zero.common.response.domain.ResponseData;
import com.zero.common.response.util.ResponseUtils;
import com.zero.sys.domain.User;
import com.zero.sys.security.jwt.util.JwtUtils;
import lombok.SneakyThrows;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import javax.servlet.ServletException;
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
    private ObjectMapper objectMapper;

    @SneakyThrows
    @Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication) throws IOException, ServletException {
        User user = (User) authentication.getPrincipal();
        // 不应该把密码放入JWT的载荷中
        user.setPassword(null);
        String tokenId = UUID.randomUUID().toString();
        String subject = objectMapper.writeValueAsString(user);
        // 创建JWT
        String jwt = JwtUtils.createJWT(tokenId, subject);

        ResponseData<Object> responseData = ResponseData.ok(jwt);
        ResponseUtils.responseJson(response, responseData);
    }
}
