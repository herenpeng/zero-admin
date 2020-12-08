package com.zero.common.export.excel.enums;

import lombok.AllArgsConstructor;
import lombok.Getter;

/**
 * @author herenpeng
 * @since 2020-12-08 20:31
 */
@Getter
@AllArgsConstructor
public enum ExcelSuffixEnum {

    XLSX(".xlsx");

    String suffix;

}
