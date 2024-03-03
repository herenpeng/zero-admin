package com.zero.auth.annotation;

import java.lang.annotation.*;

/**
 * 忽略授权注解，被该注解标识的接口可以绕过系统授权，直接访问
 */
@Target(ElementType.METHOD)
@Retention(RetentionPolicy.RUNTIME)
@Inherited
@Documented
public @interface IgnoreAuth {
}
