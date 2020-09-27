package com.zero.sys.property;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

/**
 * 默认的用户密码属性，使用配置文件进行配置，该Java类读取配置文件属性
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

    private String defaultPassword;

}
