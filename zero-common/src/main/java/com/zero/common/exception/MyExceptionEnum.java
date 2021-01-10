package com.zero.common.exception;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;

/**
 * @author herenpeng
 * @since 2020-10-25 12:50
 */
@Getter
@NoArgsConstructor
@AllArgsConstructor
public enum MyExceptionEnum {

    /**
     * 40002，无效的token
     */
    ILLEGAL_TOKEN(40002, "访问凭证无效，请重新登录刷新访问凭证"),

    /**
     * 40003，访问权限不足
     */
    ACCESS_DENIED(40003, "您的访问权限不足"),

    /**
     * 密码错误
     */
    PASSWORD_ERROR(50001, "密码错误");

    private int code;
    private String message;


}
