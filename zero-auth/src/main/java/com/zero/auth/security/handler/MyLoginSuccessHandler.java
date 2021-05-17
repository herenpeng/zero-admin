package com.zero.auth.security.handler;

import com.zero.auth.entity.User;
import com.zero.auth.security.userdetails.LoginUserDetails;
import com.zero.auth.security.util.LoginUtils;
import com.zero.common.response.domain.ResponseData;
import com.zero.common.response.util.ResponseUtils;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * 登录成功的处理器
 *
 * @author herenpeng
 * @since 2020-09-13 15:27
 */
@Slf4j
@RequiredArgsConstructor
@Component
public class MyLoginSuccessHandler implements AuthenticationSuccessHandler {

    private final ResponseUtils responseUtils;

    private final LoginUtils loginUtils;

    @Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication) throws IOException {
        LoginUserDetails userDetails = (LoginUserDetails) authentication.getPrincipal();
        // 不应该把密码放入JWT的载荷中
        User user = userDetails.getUser();
        // 生成Jwt
        String jwt = loginUtils.generateJwt(user, request);
        ResponseData<String> responseData = ResponseData.ok(jwt);
        responseUtils.responseJson(response, responseData);
    }

}
