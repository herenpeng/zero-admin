package com.zero.auth.enums;

import com.baomidou.mybatisplus.annotation.EnumValue;
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
public enum UserTypeEnums {
    /**
     * 本地账号
     */
    LOCAL("LOCAL"),
    /**
     * Github第三方登录，由系统生成的账号
     */
    GITHUB("GITHUB"),
    /**
     * Wechat第三方登录，由系统生成的账号
     */
    WECHAT("WECHAT"),
    /**
     * QQ第三方登录，由系统生成的账号
     */
    QQ("QQ");

    @EnumValue
    private final String value;

}
