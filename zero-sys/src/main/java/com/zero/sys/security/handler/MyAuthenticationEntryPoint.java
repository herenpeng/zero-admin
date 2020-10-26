package com.zero.sys.security.handler;

import com.zero.common.request.util.RequestUtils;
import com.zero.common.response.domain.CodeEnum;
import com.zero.common.response.domain.ResponseData;
import com.zero.common.response.util.ResponseUtils;
import com.zero.sys.security.jwt.util.JwtUtils;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.AuthenticationEntryPoint;
import org.springframework.stereotype.Component;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * @author herenpeng
 * @since 2020-10-26 21:45
 */
@Slf4j
@Component
public class MyAuthenticationEntryPoint implements AuthenticationEntryPoint {

    @Autowired
    private RequestUtils requestUtils;

    @Autowired
    private ResponseUtils responseUtils;

    @Autowired
    private JwtUtils jwtUtils;

    @Override
    public void commence(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, AuthenticationException e) throws IOException, ServletException {
        String token = requestUtils.getToken(httpServletRequest);
        String username = jwtUtils.getUsername(token);
        log.info("[权限管理]用户【{}】访问权限不足", username);
        ResponseData responseData = ResponseData.code(CodeEnum.INSUFFICIENT_PERMISSIONS.getValue()).message("您的访问权限不足，无法进行此操作");
        responseUtils.responseJson(httpServletResponse, responseData);
    }
}
