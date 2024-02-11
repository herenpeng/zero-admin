package com.zero.auth.properties;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Component
public class RootProperties {

    /**
     * Root用户的用户名，该用户会由系统自动插入
     */
    @Value("${zero.auth.root.username:root}")
    private String username;

    /**
     * root用户的默认密码，如果没有root用户，由系统插入的root用户的密码即为该属性，如果有root用户，则使用已有的密码
     */
    @Value("${zero.auth.root.password:111111}")
    private String password;

    /**
     * Root角色的角色名称
     */
    @Value("${zero.auth.root.role-name:root}")
    private String roleName;

    /**
     * root角色的描述
     */
    @Value("${zero.auth.root.role-description:root权限，系统的最高权限}")
    private String roleDescription;

}
