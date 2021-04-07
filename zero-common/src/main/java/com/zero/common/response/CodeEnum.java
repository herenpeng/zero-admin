package com.zero.common.response;

import lombok.AllArgsConstructor;
import lombok.Getter;

/**
 * ResponseData对象的code属性枚举类
 *
 * @author herenpeng
 * @since 2020-09-13 20:00
 */
@Getter
@AllArgsConstructor
public enum CodeEnum {
    /**
     * code为20000，代表正常返回数据
     */
    OK(20000);

    private final Integer value;

}
