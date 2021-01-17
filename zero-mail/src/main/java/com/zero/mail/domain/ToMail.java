package com.zero.mail.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

/**
 * 发送邮件的封装属性
 *
 * @author herenpeng
 * @since 2021-01-17 18:59
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class ToMail implements Serializable {

    /**
     * 接收邮件的账号，可以多选发送
     */
    private String[] toMails;

    /**
     * 邮件主题
     */
    private String subject;

    /**
     * 邮件内容
     */
    private String content;

}
