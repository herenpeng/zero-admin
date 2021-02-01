package com.zero.upload.enums;

import com.baomidou.mybatisplus.annotation.EnumValue;
import com.fasterxml.jackson.annotation.JsonValue;
import lombok.AllArgsConstructor;
import lombok.Getter;

/**
 * 文件类型枚举类
 *
 * @author herenpeng
 * @since 2021-01-31 19:12
 */
@Getter
@AllArgsConstructor
public enum FileTypeEnums {

    /**
     * 图片类型的文件
     */
    IMAGE("IMAGE", "图片"),
    /**
     * PDF文件
     */
    PDF("PDF", "PDF");

    @EnumValue
    private String value;

    @JsonValue
    private String description;

}
