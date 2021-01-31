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

    IMAGE("IMAGE", "图片");

    @EnumValue
    private String fileType;

    @JsonValue
    private String description;

}
