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
     * 登录错误
     */
    LOGIN_ERROR(30000, "登录错误"),
    /**
     * 40002，无效的token
     */
    ILLEGAL_TOKEN(40002, "访问凭证无效，请重新登录刷新访问凭证"),

    /**
     * 40003，访问权限不足
     */
    INSUFFICIENT_AUTHENTICATION(40003, "您的访问权限不足"),

    /**
     * 系统错误
     */
    SYS_EXCEPTION(50000, "系统错误"),

    /**
     * 密码错误
     */
    PASSWORD_ERROR(50001, "密码错误"),

    /**
     * 文件上传类型不允许
     */
    FILE_TYPE_NOT_ALLOW(50002, "文件上传类型错误"),

    /**
     * 系统配置的KEY值不存在
     */
    CONFIG_KEY_NOT_EXIST(50003, "系统配置的KEY值不存在"),
    /**
     * 系统配置的KEY值不允许用户配置
     */
    CONFIG_KEY_NOT_CAN(50004, "系统配置的KEY值不允许用户配置");

    private int code;
    private String message;


}
