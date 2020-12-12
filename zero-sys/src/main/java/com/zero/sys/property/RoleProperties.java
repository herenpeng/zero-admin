package com.zero.sys.property;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

/**
 * 默认的角色相关属性，使用配置文件进行配置，该Java类读取配置文件属性
 *
 * @author herenpeng
 * @since 2020-12-12 12:58
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@Component
@ConfigurationProperties(prefix = "zero.sys.role")
public class RoleProperties {

    /**
     * Root角色的角色名称
     */
    private String rootName;

}
