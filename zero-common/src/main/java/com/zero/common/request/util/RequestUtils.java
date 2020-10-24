package com.zero.common.request.util;

import com.zero.common.jwt.peoperty.JwtProperties;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestMethod;

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
        return accessToken;
    }

    /**
     * 获取枚举类型的方法类型
     *
     * @param request HttpServletRequest对象，HTTP请求
     * @return 枚举类型的方法类型
     */
    public RequestMethod getRequestMethodType(HttpServletRequest request) {
        String methodType = request.getMethod().toUpperCase();
        return getRequestMethodType(methodType);
    }


    /**
     * 获取枚举类型的方法类型
     *
     * @param methodType 字符串格式方法类型
     * @return 枚举类型的方法类型
     */
    public RequestMethod getRequestMethodType(String methodType) {
        String type = methodType.toUpperCase();
        switch (type) {
            case "GET":
                return RequestMethod.GET;
            case "POST":
                return RequestMethod.POST;
            case "PUT":
                return RequestMethod.PUT;
            case "DELETE":
                return RequestMethod.DELETE;
            default:
                throw new IllegalArgumentException("传入的方法类型参数错误");
        }
    }

}
