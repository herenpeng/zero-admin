package com.zero.common.util;

import com.zero.common.constant.StringConst;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Component;

/**
 * 命名风格转换工具类
 *
 * @author herenpeng
 * @since 2020-11-15 15:58
 */
@Slf4j
@Component
public class CamelCaseUtils {

    /**
     * 小驼峰命名，转换为下划线命名
     *
     * @param string 小驼峰命名名称
     * @return 下划线命名名称
     */
    public String toUnderscoreName(String string) {
        return toName(string, StringConst.UNDERSCORE_SEPARATOR);
    }

    /**
     * 小驼峰命名，转换为中划线命名
     *
     * @param string 小驼峰命名名称
     * @return 中划线命名名称
     */
    public String toUnderlineName(String string) {
        return toName(string, StringConst.UNDERLINE_SEPARATOR);
    }

    /**
     * 将小驼峰命名风格转换为划线风格
     *
     * @param string    小驼峰命名风格
     * @param character 划线类型
     * @return 划线风格
     */
    private String toName(String string, Character character) {
        if (StringUtils.isBlank(string)) {
            return null;
        }
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < string.length(); i++) {
            char ch = string.charAt(i);
            if (Character.isUpperCase(ch)) {
                sb.append(character);
            }
            sb.append(Character.toLowerCase(ch));
        }
        return sb.toString();
    }

    /**
     * 下划线命名，转换为小驼峰命名
     *
     * @param string 下划线命名名称
     * @return 小驼峰命名名称
     */
    public String toCamelCase(String string) {
        if (StringUtils.isBlank(string)) {
            return null;
        }
        string = string.toLowerCase();
        StringBuilder sb = new StringBuilder(string.length());
        boolean upperCase = false;
        for (int i = 0; i < string.length(); i++) {
            char ch = string.charAt(i);
            if (ch == StringConst.UNDERSCORE_SEPARATOR) {
                upperCase = true;
            } else if (upperCase) {
                sb.append(Character.toUpperCase(ch));
                upperCase = false;
            } else {
                sb.append(ch);
            }
        }
        return sb.toString();
    }

    /**
     * 下划线命名，转换为大驼峰命名
     *
     * @param string 下划线命名名称
     * @return 大驼峰命名名称
     */
    public String toCapitalizeCamelCase(String string) {
        if (StringUtils.isBlank(string)) {
            return null;
        }
        string = toCamelCase(string);
        return string.substring(0, 1).toUpperCase() + string.substring(1);
    }

}
