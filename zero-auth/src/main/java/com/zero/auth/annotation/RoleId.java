package com.zero.auth.annotation;

import java.lang.annotation.*;

/**
 * @author herenpeng
 * @since 2021-04-29 23:06
 */
@Target(ElementType.PARAMETER)
@Retention(RetentionPolicy.RUNTIME)
@Inherited
@Documented
public @interface RoleId {
}
