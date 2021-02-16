package com.zero.common.export.excel.enums;

import cn.afterturn.easypoi.excel.export.styler.ExcelExportStylerBorderImpl;
import cn.afterturn.easypoi.excel.export.styler.ExcelExportStylerColorImpl;
import cn.afterturn.easypoi.excel.export.styler.ExcelExportStylerDefaultImpl;
import cn.afterturn.easypoi.excel.export.styler.IExcelExportStyler;
import lombok.AllArgsConstructor;
import lombok.Getter;

/**
 * Excel样式枚举
 * ExcelExportStylerDefaultImpl,ExcelExportStylerBorderImpl,ExcelExportStylerColorImpl
 * 这三个Excel样式为easypoi默认实现的样式，如果我们需要自己实现样式，继承 IExcelExportStyler 接口即可
 *
 * @author herenpeng
 * @since 2020-12-08 22:56
 */
@Getter
@AllArgsConstructor
public enum ExcelStyleEnum {

    /**
     * 默认样式
     */
    DEFAULT("默认样式", ExcelExportStylerDefaultImpl.class),
    /**
     * 边框样式
     */
    BORDER("边框样式", ExcelExportStylerBorderImpl.class),
    /**
     * 间隔行样式
     */
    COLOR("间隔行样式", ExcelExportStylerColorImpl.class);

    /**
     * 样式名称
     */
    private String styleName;

    /**
     * 样式实现类字节码对象
     */
    private Class<? extends IExcelExportStyler> styleClass;
}
