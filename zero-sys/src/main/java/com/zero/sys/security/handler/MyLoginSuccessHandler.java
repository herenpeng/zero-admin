package com.zero.sys.security.handler;

import com.zero.common.response.domain.CodeEnum;
import com.zero.common.response.domain.ResponseData;
import com.zero.common.response.util.ResponseUtils;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * 登录成功的处理器
 *
 * @author herenpeng
 * @since 2020-09-13 15:27
 */
@Component
public class MyLoginSuccessHandler implements AuthenticationSuccessHandler {

    @Override
    @ResponseBody
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication) throws IOException, ServletException {
        ResponseData<Object> responseData = new ResponseData<>(CodeEnum.OK.getValue(), authentication.getPrincipal());
        ResponseUtils.responseJson(response, responseData);
    }
}
