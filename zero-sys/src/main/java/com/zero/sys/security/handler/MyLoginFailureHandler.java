package com.zero.sys.security.handler;

import com.zero.common.response.domain.CodeEnum;
import com.zero.common.response.domain.ResponseData;
import com.zero.common.response.util.ResponseUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.*;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
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
        Map<String, Object> resultData = new HashMap<>(16);
        if (e instanceof LockedException) {
            resultData.put("msg", "账号被锁定，登录失败");
        } else if (e instanceof BadCredentialsException) {
            resultData.put("msg", "用户名或密码错误，登录失败");
        } else if (e instanceof DisabledException) {
            resultData.put("msg", "账号被禁用，登录失败");
        } else if (e instanceof CredentialsExpiredException) {
            resultData.put("msg", "密码过期，登录失败");
        } else if (e instanceof AccountExpiredException) {
            resultData.put("msg", "账号过期，登录失败");
        } else {
            resultData.put("msg", "登录失败");
        }
        ResponseData<Map<String, Object>> responseData = ResponseData.code(CodeEnum.LOGIN_ERROR.getValue()).data(resultData);
        responseUtils.responseJson(response, responseData);
    }
}
