package com.zero.listener.config;

import com.zero.common.listener.config.EventRegister;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import org.springframework.stereotype.Component;

/**
 * 系统事件注册中心
 *
 * @author herenpeng
 * @since 2020-10-17 22:21
 */
@Data
@EqualsAndHashCode(callSuper = false)
@NoArgsConstructor
@AllArgsConstructor
@Component
public class SysEventRegister extends EventRegister {

    /**
     * [系统启动事件]注册扫描资源事件，在系统启动时，扫描系统资源
     */
    private boolean scanResources = true;

    /**
     * [系统停止事件]销毁所有的系统资源
     */
    private boolean destroyResources = false;

    /**
     * [系统启动事件]root用户事件，在系统启动时，插入root角色和root用户，并关联两者的关系
     */
    private boolean rootUser = true;

    /**
     * [系统启动事件]root用户菜单事件，插入root用户的所有菜单权限
     */
    private boolean rootMenu = true;


}
