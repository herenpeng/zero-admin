package com.zero.common.listener.annotation;

import java.lang.annotation.*;

/**
 * 系统事件排序注解
 * -- @Target(ElementType.METHOD)该注解作用于方法上
 * -- @Retention(RetentionPolicy.RUNTIME)该注解保留至运行时，JVM中
 * -- @Inherited该注解会被子类继承
 * -- @Documented该注解能够被javadoc工具生成java文档
 *
 * @author herenpeng
 * @since 2021-01-02 20:01
 */
@Target(ElementType.TYPE)
@Retention(RetentionPolicy.RUNTIME)
@Inherited
@Documented
public @interface EventSort {

    /**
     * 事件排序
     *
     * @return 事件排序序号
     */
    int value() default 5;

}
