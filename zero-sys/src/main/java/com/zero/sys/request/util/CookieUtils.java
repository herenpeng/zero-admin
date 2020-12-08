package com.zero.sys.request.util;

import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Component;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

/**
 * Cookie相关的工具类
 *
 * @author herenpeng
 * @since 2020-12-08 20:04
 */
@Slf4j
@Component
public class CookieUtils {

    public String getCookie(HttpServletRequest request, String cookieName) {
        if (StringUtils.isBlank(cookieName)) {
            log.error("[Cookie工具]传入的cookieName：{}为空，无法获取cookie", cookieName);
            return null;
        }
        Cookie[] cookies = request.getCookies();
        if (cookies != null && cookies.length > 0) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals(cookieName)) {
                    return cookie.getValue();
                }
            }
        }
        return null;
    }

}
