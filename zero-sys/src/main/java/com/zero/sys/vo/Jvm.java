package com.zero.sys.vo;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

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
public class Jvm implements Serializable {

    /**
     * JVM名称
     */
    private String name;
    /**
     * JDK版本
     */
    private String version;
    /**
     * JDK路径
     */
    private String home;
    /**
     * JVM启动时间
     */
    private String startTime;
    /**
     * JVM运行时间
     */
    private String runTime;
    /**
     * JVM最大可用内存总数（MB）
     */
    private double max;
    /**
     * 当前JVM占用的内存总数（MB）
     */
    private double total;
    /**
     * JVM空闲内存（MB）
     */
    private double free;
    /**
     * JVM使用内存（MB）
     */
    private double used;
    /**
     * JVM内存使用率
     */
    private double usage;


}
