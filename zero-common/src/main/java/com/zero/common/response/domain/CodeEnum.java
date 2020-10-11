package com.zero.common.response.domain;

import lombok.Getter;

/**
 * ResponseData对象的code属性枚举类
 *
 * @author herenpeng
 * @since 2020-09-13 20:00
 */
@Getter
public enum CodeEnum {
    /**
     * code为20000，代表正常返回数据
     */
    OK(20000),
    /**
     * code为30000，代表登录错误
     */
    LOGIN_ERROR(30000),
    /**
     * code为30001，代表未登录
     */
    NOT_LOGIN(30001),
    /**
     * code为50000，代表系统发生异常
     */
    SYS_EXCEPTION(50000);

    private Integer value;

    CodeEnum(Integer value) {
        this.value = value;
    }

}
