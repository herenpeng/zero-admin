package com.zero.auth.security.handler;

import com.zero.auth.security.jwt.util.JwtUtils;
import com.zero.auth.util.ResponseUtils;
import com.zero.common.exception.MyExceptionEnum;
import com.zero.common.response.domain.ResponseData;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.AuthenticationEntryPoint;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * 系统认证接入点，用户 AuthenticationException 异常问题
 *
 * @author herenpeng
 * @since 2020-10-26 21:45
 */
@Slf4j
@RequiredArgsConstructor
@Component
public class MyAuthenticationEntryPoint implements AuthenticationEntryPoint {

    private final ResponseUtils responseUtils;

    private final JwtUtils jwtUtils;

    @Override
    public void commence(HttpServletRequest request, HttpServletResponse httpServletResponse, AuthenticationException e) throws IOException {
        String username = jwtUtils.getUsername(request);
        log.info("[权限管理]用户【{}】访问权限不足", username);
        ResponseData<Void> responseData = ResponseData.code(MyExceptionEnum.INSUFFICIENT_AUTHENTICATION.getCode())
                .message("您的访问权限不足，无法访问该页面数据，或进行该操作");
        responseUtils.responseJson(httpServletResponse, responseData);
    }
}
