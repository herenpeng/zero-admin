package com.zero.mail.template.login;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

/**
 * @author herenpeng
 * @since 2021-05-17 23:37
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@Component
@ConfigurationProperties(prefix = "zero.mail.template.login-mail")
public class LoginMailProperties {

    /**
     * 发送登录邮件的邮件主题
     */
    private String subject;

    /**
     * 发送登录邮件的模板加载路径
     */
    private String path;

    /**
     * 发送登录邮件的模板文件名
     */
    private String file;

}
