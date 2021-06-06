package com.zero.sys.enums;

import com.baomidou.mybatisplus.annotation.EnumValue;
import lombok.AllArgsConstructor;
import lombok.Getter;

/**
 * sys_config_const 表的 key 字段对应的枚举类
 *
 * @author herenpeng
 * @since 2021-06-06 10:52
 */
@Getter
@AllArgsConstructor
public enum ConfigConstKey {

    /**
     * 备案号
     */
    RECORD_NUMBER("RECORD_NUMBER"),
    /**
     * 主题颜色
     */
    THEME_COLOR("THEME_COLOR"),
    /**
     * 开启 Tags-View
     */
    OPEN_TAGS_VIEW("OPEN_TAGS_VIEW");

    @EnumValue
    private final String key;


}
