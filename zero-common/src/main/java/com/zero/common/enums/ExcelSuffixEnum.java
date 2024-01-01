package com.zero.common.enums;

import lombok.AllArgsConstructor;
import lombok.Getter;

/**
 * @author herenpeng
 * @since 2020-12-08 20:31
 */
@Getter
@AllArgsConstructor
public enum ExcelSuffixEnum {

    /**
     * .xlsx格式的excel文件
     */
    XLSX(".xlsx");

    /**
     * 文件后缀名
     */
    private final String suffix;

}
