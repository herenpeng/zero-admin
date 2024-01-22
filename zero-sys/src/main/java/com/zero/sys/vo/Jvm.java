package com.zero.sys.vo;

import com.zero.common.kit.ArithHelper;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.apache.commons.lang3.time.DateFormatUtils;

import java.lang.management.ManagementFactory;
import java.util.Date;

/**
 * 系统JVM参数信息实体类
 *
 * @author herenpeng
 * @since 2020-10-12 20:16
 */
@Schema(name = "系统JVM参数信息实体类")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Jvm {

    /**
     * 当前JVM占用的内存总数(M)
     */
    private double total;

    /**
     * JVM最大可用内存总数(M)
     */
    private double max;

    /**
     * JVM空闲内存(M)
     */
    private double free;

    /**
     * JDK版本
     */
    private String version;

    /**
     * JDK路径
     */
    private String home;

    public double getTotal() {
        return ArithHelper.div(total, (1024 * 1024), 2);
    }

    public double getMax() {
        return ArithHelper.div(max, (1024 * 1024), 2);
    }

    public double getFree() {
        return ArithHelper.div(free, (1024 * 1024), 2);
    }

    public double getUsed() {
        return ArithHelper.div(total - free, (1024 * 1024), 2);
    }

    public double getUsage() {
        return ArithHelper.mul(ArithHelper.div(total - free, total, 4), 100);
    }

    /**
     * 获取JVM名称
     */
    public String getName() {
        return ManagementFactory.getRuntimeMXBean().getVmName();
    }

    /**
     * JVM启动时间
     */
    public String getStartTime() {
        long time = ManagementFactory.getRuntimeMXBean().getStartTime();
        return DateFormatUtils.format(new Date(time), "yyyy-MM-dd HH:mm:ss");
    }

    /**
     * JVM运行时间
     */
    public String getRunTime() {
        long startTime = ManagementFactory.getRuntimeMXBean().getStartTime();
        long nowTime = System.currentTimeMillis();
        long runTime = nowTime - startTime;
        long runDay = runTime / (24 * 60 * 60 * 1000);

        long runHourTime = runTime % (24 * 60 * 60 * 1000);
        long runHour = runHourTime / (60 * 60 * 1000);

        long runMinuteTime = runHourTime % (60 * 60 * 1000);
        long runMinute = runMinuteTime / (60 * 1000);
        return runDay + "天" + runHour + "小时" + runMinute + "分钟";
    }

}
