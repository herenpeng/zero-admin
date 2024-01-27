package com.zero.common.kit;

import org.apache.commons.lang3.time.DateFormatUtils;

import java.util.Date;

public class DateKit {

    /**
     * 一秒毫秒值
     */
    public static final long SECOND = 1000;
    /**
     * 一分钟毫秒值
     */
    public static final long MINUTE = 60 * SECOND;
    /**
     * 一小时毫秒值
     */
    public static final long HOUR = 60 * MINUTE;
    /**
     * 一天毫秒值
     */
    public static final long DAY = 24 * HOUR;


    private static final String DATE_PATTERN = "yyyy-MM-dd HH:mm:ss";

    public static String format(long time) {
        return DateFormatUtils.format(new Date(time), DATE_PATTERN);
    }



}
