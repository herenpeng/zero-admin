package com.zero.mail.service;

import com.zero.mail.domain.ToMail;

/**
 * 邮件服务的Service层接口
 *
 * @author herenpeng
 * @since 2021-01-17 20:00
 */
public interface MailService {

    /**
     * 发送普通的文本邮件
     *
     * @param toMail 邮件接收封装实体
     * @return 发送成功返回true，发送失败返回false
     * @throws Exception 抛出异常
     */
    Boolean sendTextMail(ToMail toMail) throws Exception;

    /**
     * 发送包含HTML的模板邮件
     *
     * @param toMail 邮件接收封装实体
     * @return 发送成功返回true，发送失败返回false
     * @throws Exception 抛出异常
     */
    Boolean sendTemplateMail(ToMail toMail) throws Exception;

}
