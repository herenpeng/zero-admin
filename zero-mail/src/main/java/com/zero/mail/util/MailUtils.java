package com.zero.mail.util;

import com.zero.mail.domain.ToMail;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.MailException;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Component;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

/**
 * 邮件工具类
 *
 * @author herenpeng
 * @since 2021-01-17 18:54
 */
@Slf4j
@RequiredArgsConstructor
@Component
public class MailUtils {

    @Value("${spring.mail.username}")
    private String from;

    private final JavaMailSender mailSender;

    /**
     * 发送普通的文本邮件
     *
     * @param toMail 邮件接收封装实体
     * @return 发送成功返回true，发送失败返回false
     */
    public boolean sendTextMail(ToMail toMail) {
        // 创建简单邮件消息
        SimpleMailMessage message = new SimpleMailMessage();
        // 邮件发送方
        message.setFrom(from);
        // 邮件接收方
        message.setTo(toMail.getToMails());
        // 邮件标题
        message.setSubject(toMail.getSubject());
        // 邮件内容
        message.setText(toMail.getContent());
        try {
            mailSender.send(message);
            log.info("邮件发送成功，邮件接收方：{}", toMail.getToMails());
            return true;
        } catch (MailException e) {
            log.error("邮件发送失败，邮件接收方：{}", toMail.getToMails());
            e.printStackTrace();
            return false;
        }
    }

    /**
     * 发送包含HTML的模板邮件
     *
     * @param toMail 邮件接收封装实体
     * @return 发送成功返回true，发送失败返回false
     * @throws MessagingException 抛出邮件消息异常
     */
    public boolean sendTemplateMail(ToMail toMail) throws MessagingException {
        //创建一个MINE消息
        MimeMessage message = mailSender.createMimeMessage();
        MimeMessageHelper mimeMessageHelper = new MimeMessageHelper(message, true);
        // 邮件发送方
        mimeMessageHelper.setFrom(from);
        // 邮件接收方
        mimeMessageHelper.setTo(toMail.getToMails());
        // 邮件标题
        mimeMessageHelper.setSubject(toMail.getSubject());
        // 邮件内容
        mimeMessageHelper.setText(toMail.getContent(), true);
        try {
            mailSender.send(message);
            log.info("邮件发送成功，邮件接收方：{}", toMail.getToMails());
            return true;
        } catch (MailException e) {
            log.error("邮件发送失败，邮件接收方：{}", toMail.getToMails());
            e.printStackTrace();
            return false;
        }
    }


}
