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
     * showSettings 是否显示设置栏
     */
    SHOW_SETTINGS("SHOW_SETTINGS"),
    /**
     * 主题颜色
     */
    THEME_COLOR("THEME_COLOR"),
    /**
     * 开启页面顶部标签 Tags-View
     */
    TAGS_VIEW("TAGS_VIEW"),
    /**
     * fixedHeader 固定顶部显示栏
     */
    FIXED_HEADER("FIXED_HEADER"),
    /**
     * sidebarLogo 显示侧边栏LOGO
     */
    SIDEBAR_LOGO("SIDEBAR_LOGO");

    @EnumValue
    private final String key;


}
