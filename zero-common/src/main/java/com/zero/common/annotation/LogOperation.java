package com.zero.common.annotation;

import java.lang.annotation.*;

/**
 * 记录系统操作日志注解
 * -- @Target(ElementType.METHOD)该注解作用于方法上
 * -- @Retention(RetentionPolicy.RUNTIME)该注解保留至运行时，JVM中
 * -- @Inherited该注解会被子类继承
 * -- @Documented该注解能够被javadoc工具生成java文档
 *
 * @author herenpeng
 * @since 2020-10-27 22:25
 */
@Target(ElementType.METHOD)
@Retention(RetentionPolicy.RUNTIME)
@Inherited
@Documented
public @interface LogOperation {

    /**
     * 操作日志说明，如果该值为null或者为""，则获取@ApiOperation注解上面的方法说明
     *
     * @return
     */
    String value() default "";


}
