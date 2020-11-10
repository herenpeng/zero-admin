package com.zero.common.listener.config;

import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.ObjectUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

import java.lang.reflect.Field;

/**
 * 系统事件注册中心，所有的系统事件都需要到该类或该类的子类下进行事件注册
 * 事件注册逻辑，注册名称为系统事件（继承Event接口的实现类）类名的首字母小写
 * 如果不进行注册，或者注册名称未符合注册名称命名规范，则默认事件开关为false，即不执行该事件
 *
 * @author herenpeng
 * @since 2020-10-16 22:20
 */
@Slf4j
@Component
@ConfigurationProperties(prefix = "zero.sys.listener.event")
public abstract class EventRegister {

    /**
     * 判断对应事件开关是否开启
     *
     * @param eventName 事件开关属性名称，也是对应事件类名的首字母小写
     * @return 事件开关是否开启，如果开启返回true，如果关闭，返回false
     * @throws NoSuchFieldException   抛出反射没有对应属性异常
     * @throws IllegalAccessException 抛出反射非法访问异常
     */
    public boolean checkSwitch(String eventName) throws NoSuchFieldException, IllegalAccessException {
        // 类名首字母小写为事件开关名称
        String flagName = StringUtils.uncapitalize(eventName);
        Field field = this.getClass().getDeclaredField(flagName);
        field.setAccessible(true);
        Boolean flag = field.getBoolean(this);
        if (ObjectUtils.allNotNull(flag)) {
            return flag;
        } else {
            // 如果对应的属性为空，说明没有找到该属性，即该属性配置未配置或者未按照事件类名首字母小写的规则配置
            log.warn("[系统事件配置]{}事件未配置对应的事件开关，{}开关配置错误，默认禁用该事件", eventName, flagName);
            return false;
        }
    }

}
