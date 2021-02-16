package com.zero.common.enums;

import lombok.AllArgsConstructor;
import lombok.Getter;

/**
 * 编码
 *
 * @author herenpeng
 * @since 2020-11-13 23:19
 */
@Getter
@AllArgsConstructor
public enum EncodingEnums {

    /**
     * UTF-8编码
     */
    UTF_8("UTF-8");

    /**
     * 编码格式
     */
    private String value;

}
