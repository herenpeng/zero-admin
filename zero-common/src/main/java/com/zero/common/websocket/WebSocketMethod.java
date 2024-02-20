package com.zero.common.websocket;

import java.lang.annotation.*;

@Target(ElementType.METHOD)
@Retention(RetentionPolicy.RUNTIME)
@Inherited
@Documented
public @interface WebSocketMethod {

    /**
     * cmd 命令Id
     *
     * @return 命令Id
     */
    int value() default 0;

}
