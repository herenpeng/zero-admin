package com.zero.common.enums;

import lombok.AllArgsConstructor;
import lombok.Getter;

/**
 * 编码格式
 *
 * @author herenpeng
 * @since 2020-11-13 23:19
 */
@Getter
@AllArgsConstructor
public enum EncodingEnum {

    /**
     * UTF-8 编码
     */
    UTF_8("UTF-8"),
    /**
     * ISO-8859-1 编码
     */
    ISO_8859_1("ISO-8859-1");

    /**
     * 编码格式
     */
    private String value;

}
