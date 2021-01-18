package com.zero.mail.template.verify;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

/**
 * 发送邮件验证码邮件的模板属性
 *
 * @author herenpeng
 * @since 2021-01-17 21:26
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@Component
@ConfigurationProperties(prefix = "zero.mail.template.verify")
public class VerifyProperties {

    /**
     * 邮件验证码存放在redis中的key值前缀
     */
    private String key;

    /**
     * 邮件验证码的长度
     */
    private Integer length;

    /**
     * 验证码对过期时间，单位为毫秒
     */
    private Long ttl;

    /**
     * 发送邮件验证码邮件的邮件主题
     */
    private String subject;

    /**
     * 发送邮件验证码邮件的模板加载路径
     */
    private String path;

    /**
     * 发送邮件验证码邮件的模板文件名
     */
    private String file;

}
