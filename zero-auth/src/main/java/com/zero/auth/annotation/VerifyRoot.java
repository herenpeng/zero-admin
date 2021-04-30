package com.zero.auth.annotation;

import java.lang.annotation.*;

/**
 * 校验系统的 root 权限
 * -- @Target(ElementType.METHOD)该注解作用于方法上
 * -- @Retention(RetentionPolicy.RUNTIME)该注解保留至运行时，JVM中
 * -- @Inherited该注解会被子类继承
 * -- @Documented该注解能够被javadoc工具生成java文档
 *
 * @author herenpeng
 * @since 2021-04-29 23:04
 */
@Target(ElementType.METHOD)
@Retention(RetentionPolicy.RUNTIME)
@Inherited
@Documented
public @interface VerifyRoot {
}
