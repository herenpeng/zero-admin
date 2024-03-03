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
public enum AppExceptionEnum {

    /**
     * 登录错误
     */
    LOGIN_ERROR(30000, "登录失败"),
    LOGIN_USERNAME_ERROR(30001, "用户名错误，登录失败"),
    LOGIN_ACCOUNT_LOCKED(30002, "账号被锁定，登录失败"),
    LOGIN_ACCOUNT_DISABLE(30003, "账号被禁用，登录失败"),
    LOGIN_ACCOUNT_EXPIRE(30004, "账号过期，登录失败"),
    LOGIN_PASSWORD_EXPIRE(30005, "密码过期，登录失败"),
    LOGIN_PASSWORD_ERROR(30006, "密码错误，登录失败"),

    ILLEGAL_TOKEN(40002, "访问凭证无效，请重新登录刷新访问凭证"),
    INSUFFICIENT_AUTHENTICATION(40003, "您的访问权限不足"),

    /**
     * 业务逻辑错误
     */
    SYS_EXCEPTION(50000, "系统错误"),
    PASSWORD_ERROR(50001, "密码错误"),
    FILE_TYPE_NOT_ALLOW(50002, "文件上传类型错误"),
    CONFIG_KEY_NOT_EXIST(50003, "系统配置的KEY值不存在"),
    CONFIG_KEY_NOT_CAN(50004, "系统配置的KEY值不允许用户配置"),
    TABLE_INFO_NOT_EXIST(50005, "表数据不存在"),
    ;

    private int code;
    private String message;


}
