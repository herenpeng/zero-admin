package com.zero.common.kit;

import com.zero.common.constant.AppConst;
import org.apache.commons.lang3.StringUtils;

/**
 * 命名风格转换工具类
 *
 * @author herenpeng
 * @since 2020-11-15 15:58
 */
public class CamelCaseKit {

    /**
     * 小驼峰命名，转换为下划线命名
     *
     * @param string 小驼峰命名名称
     * @return 下划线命名名称
     */
    public static String toUnderlineName(String string) {
        return toName(string, AppConst.UNDERLINE_SEPARATOR);
    }

    /**
     * 小驼峰命名，转换为中划线命名
     *
     * @param string 小驼峰命名名称
     * @return 中划线命名名称
     */
    public static String toStrikeName(String string) {
        return toName(string, AppConst.STRIKE_SEPARATOR);
    }

    /**
     * 将小驼峰命名风格转换为划线风格
     *
     * @param string    小驼峰命名风格
     * @param character 划线类型
     * @return 划线风格
     */
    private static String toName(String string, Character character) {
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
    public static String toCamelCase(String string) {
        if (StringUtils.isBlank(string)) {
            return null;
        }
        string = string.toLowerCase();
        StringBuilder sb = new StringBuilder(string.length());
        boolean upperCase = false;
        for (int i = 0; i < string.length(); i++) {
            char ch = string.charAt(i);
            if (ch == AppConst.UNDERLINE_SEPARATOR) {
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
    public static String toCapitalizeCamelCase(String string) {
        string = toCamelCase(string);
        if (StringUtils.isBlank(string)) {
            return null;
        }
        return string.substring(0, 1).toUpperCase() + string.substring(1);
    }

}
