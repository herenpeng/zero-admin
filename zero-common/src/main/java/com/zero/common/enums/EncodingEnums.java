package com.zero.common.enums;

import lombok.AllArgsConstructor;

/**
 * 编码
 *
 * @author herenpeng
 * @since 2020-11-13 23:19
 */
@AllArgsConstructor
public enum EncodingEnums {

    UTF_8("UTF-8");

    private String encoding;

    public String getValue() {
        return encoding;
    }
}
