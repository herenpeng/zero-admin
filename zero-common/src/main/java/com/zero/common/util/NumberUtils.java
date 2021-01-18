package com.zero.common.util;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;

import java.util.Random;

/**
 * 数字工具类
 *
 * @author herenpeng
 * @since 2021-01-18 20:02
 */
@Slf4j
@Component
public class NumberUtils {

    /**
     * 生成随机的数字字符串
     *
     * @param length 数字字符串长度
     * @return 随机的数字字符串
     */
    public String generateRandomNumberString(int length) {
        StringBuilder sb = new StringBuilder();
        int num;
        Random random = new Random(System.currentTimeMillis());
        for (int i = 0; i < length; i++) {
            num = random.nextInt(10);
            sb.append(num);
        }
        return sb.toString();
    }




}
