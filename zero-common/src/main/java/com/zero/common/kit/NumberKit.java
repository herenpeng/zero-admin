package com.zero.common.kit;

import java.util.Random;

/**
 * 数字工具类
 *
 * @author herenpeng
 * @since 2021-01-18 20:02
 */
public class NumberKit {

    /**
     * 生成随机的数字字符串
     *
     * @param length 数字字符串长度
     * @return 随机的数字字符串
     */
    public static String generateRandomNumberString(int length) {
        StringBuilder sb = new StringBuilder();
        Random random = new Random();
        for (int i = 0; i < length; i++) {
            sb.append(random.nextInt(10));
        }
        return sb.toString();
    }




}
