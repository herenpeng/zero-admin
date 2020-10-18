package com.zero.common.listener.config;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

/**
 * 监听器配置属性，可以通过配置文件改变配置值
 *
 * @author herenpeng
 * @since 2020-10-16 21:04
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@Component
@ConfigurationProperties(prefix = "zero.sys.listener")
public class ListenerConfig {

    /**
     * 系统启动事件，默认为false，即系统启动时不执行任何事件
     * 如果需要在系统启动的时候执行一些事件，需要先配置该属性为true才能够执行
     * 如果该属性为false，即使开启了事件执行，也不会执行对应的事件
     */
    private boolean executionStart = false;

    /**
     * 系统停止事件，默认为false，即系统停止时不执行任何事件
     * 系统停止的配置和系统启动时配置效果一致
     */
    private boolean executionStop = false;

}
