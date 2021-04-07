package com.zero.auth.enums;

import lombok.AllArgsConstructor;
import lombok.Getter;

/**
 * 用户账号的类型，
 *
 * @author herenpeng
 * @since 2021-04-08 0:01
 */
@Getter
@AllArgsConstructor
public enum UserTypeEnum {
    /**
     * 本地账号
     */
    LOCAL,
    /**
     * Github第三方登录，由系统生成的账号
     */
    GITHUB,
    /**
     * Wechat第三方登录，由系统生成的账号
     */
    WECHAT,
    /**
     * QQ第三方登录，由系统生成的账号
     */
    QQ;
}
