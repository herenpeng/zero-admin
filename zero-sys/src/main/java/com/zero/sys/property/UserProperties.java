package com.zero.sys.property;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

/**
 * 默认的用户相关属性，使用配置文件进行配置，该Java类读取配置文件属性
 *
 * @author herenpeng
 * @since 2020-09-26 21:53
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@Component
@ConfigurationProperties(prefix = "zero.sys.user")
public class UserProperties {

    /**
     * Root用户的用户名，该用户会由系统自动插入
     */
    private String rootUsername;

    /**
     * root用户的默认密码，如果没有root用户，由系统插入的root用户的密码即为该属性，如果有root用户，则使用已有的密码
     */
    private String rootPassword;

    /**
     * 添加用户时的默认密码
     */
    private String defaultPassword;

}
