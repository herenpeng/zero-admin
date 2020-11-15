package com.zero.camel;

import com.zero.MyApplication;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

/**
 * @author herenpeng
 * @since 2020-11-15 16:18
 */
@SpringBootTest(classes = {MyApplication.class})
@RunWith(SpringRunner.class)
public class CamelTest {

    @Test
    public void test01 () {
        String str = "helloWorld";
        System.out.println(toUnderlineName(str));
        str = "aaa_bbb_Cdc_WA";
        System.out.println(toCamelCase(str));
        System.out.println(toCapitalizeCamelCase(str));
    }


    public String toUnderlineName(String string) {
        if (string == null) {
            return null;
        }
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < string.length(); i++) {
            char ch = string.charAt(i);
            if ((i > 0) && Character.isUpperCase(ch)) {
                sb.append(SEPARATOR);
            }
            sb.append(Character.toLowerCase(ch));
        }
        return sb.toString();
    }


    public String toCamelCase(String string) {
        if (string == null) {
            return null;
        }
        string = string.toLowerCase();
        StringBuilder sb = new StringBuilder(string.length());
        boolean upperCase = false;
        for (int i = 0; i < string.length(); i++) {
            char ch = string.charAt(i);
            if (ch == SEPARATOR) {
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
        if (string == null) {
            return null;
        }
        string = toCamelCase(string);
        return string.substring(0, 1).toUpperCase() + string.substring(1);
    }

    private static final char SEPARATOR = '_';
}
