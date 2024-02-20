package com.zero.common.event;

import org.springframework.stereotype.Component;

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
@Component
public @interface AppStopEvent {

    /**
     * 事件排序
     *
     * @return 事件排序序号
     */
    int sort() default 0;


    /**
     * 事件是否启用
     *
     * @return 是否启用
     */
    boolean enable() default false;

}
