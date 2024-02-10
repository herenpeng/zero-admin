package com.zero.sys.enums;

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
public enum FileTypeEnum {

    /**
     * 默认文件类型的文件
     */
    DEFAULT_FILE("DEFAULT_FILE", "默认文件类型"),
    /**
     * 图片类型的文件
     */
    IMAGE("IMAGE", "图片"),
    /**
     * PDF文件
     */
    PDF("PDF", "PDF");

    /**
     * 持久化到数据库中的值
     */
    @EnumValue
    private final String value;

    /**
     * 格式化为json字符串时展示的数据
     */
    @JsonValue
    private final String description;

}
