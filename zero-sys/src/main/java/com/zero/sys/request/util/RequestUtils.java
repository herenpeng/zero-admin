package com.zero.sys.request.util;

import com.zero.sys.security.jwt.peoperty.JwtProperties;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpServletRequest;

/**
 * Http请求工具类，用于处理和request请求相关的操作
 *
 * @author herenpeng
 * @since 2020-10-22 20:42
 */
@Component
public class RequestUtils {

    @Autowired
    private JwtProperties jwtProperties;

    /**
     * 获取请求头上的accessToken
     *
     * @param request HTTP请求
     * @return accessToken字符串
     */
    public String getToken(HttpServletRequest request) {
        String accessToken = request.getHeader(jwtProperties.getName());
        if(StringUtils.isBlank(accessToken)) {
            accessToken = request.getParameter(jwtProperties.getName());
        }
        return accessToken;
    }

}
