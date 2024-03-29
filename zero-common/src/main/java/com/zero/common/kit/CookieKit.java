package com.zero.common.kit;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;

/**
 * Cookie相关的工具类
 *
 * @author herenpeng
 * @since 2020-12-08 20:04
 */
@Slf4j
public class CookieKit {

    /**
     * 获取对应的cookieName的cookie值
     *
     * @param request    HttpServletRequest对象
     * @param cookieName cookie名称
     * @return cookie名称对应的值
     */
    public static String getCookie(HttpServletRequest request, String cookieName) {
        if (StringUtils.isBlank(cookieName)) {
            log.error("[Cookie工具]传入的cookieName：{}为空，无法获取cookie", cookieName);
            return null;
        }
        Cookie[] cookies = request.getCookies();
        if (cookies == null) {
            return null;
        }
        for (Cookie cookie : cookies) {
            if (cookie.getName().equals(cookieName)) {
                return cookie.getValue();
            }
        }
        return null;
    }

}
