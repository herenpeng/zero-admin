package com.zero.auth.security.handler;

import com.zero.auth.util.ResponseUtils;
import com.zero.common.response.CodeEnum;
import com.zero.common.response.domain.ResponseData;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.*;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Map;

/**
 * 登录失败的处理器
 *
 * @author herenpeng
 * @since 2020-09-13 15:29
 */
@Component
public class MyLoginFailureHandler implements AuthenticationFailureHandler {

    @Autowired
    private ResponseUtils responseUtils;

    @Override
    public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response, AuthenticationException e) throws IOException {
        ResponseData<Map<String, Object>> responseData = ResponseData.code(CodeEnum.LOGIN_ERROR.getValue());
        if (e instanceof LockedException) {
            responseData.message("账号被锁定，登录失败");
        } else if (e instanceof BadCredentialsException) {
            responseData.message("用户名或密码错误，登录失败");
        } else if (e instanceof DisabledException) {
            responseData.message("账号被禁用，登录失败");
        } else if (e instanceof CredentialsExpiredException) {
            responseData.message("密码过期，登录失败");
        } else if (e instanceof AccountExpiredException) {
            responseData.message("账号过期，登录失败");
        } else {
            responseData.message("登录失败");
        }
        responseUtils.responseJson(response, responseData);
    }
}
