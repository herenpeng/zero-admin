package com.zero.mail.listener;

import com.zero.auth.entity.LoginLog;
import com.zero.auth.entity.User;
import com.zero.auth.entity.UserInfo;
import com.zero.auth.mapper.LoginLogMapper;
import com.zero.auth.mapper.UserInfoMapper;
import com.zero.auth.mapper.UserMapper;
import com.zero.common.constant.StringConst;
import com.zero.common.util.FreeMarkerUtils;
import com.zero.mail.domain.ToMail;
import com.zero.mail.template.login.LoginMailParams;
import com.zero.mail.template.login.LoginMailProperties;
import com.zero.mail.util.MailUtils;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.amqp.core.ExchangeTypes;
import org.springframework.amqp.rabbit.annotation.Exchange;
import org.springframework.amqp.rabbit.annotation.Queue;
import org.springframework.amqp.rabbit.annotation.QueueBinding;
import org.springframework.amqp.rabbit.annotation.RabbitListener;
import org.springframework.stereotype.Component;
import org.springframework.util.ObjectUtils;

/**
 * 项目的邮件相关的amqp消息监听者
 *
 * @author herenpeng
 * @since 2021-05-17 23:13
 */
@Slf4j
@RequiredArgsConstructor
@Component
public class AppMailAmqpListener {

    private final UserMapper userMapper;

    private final UserInfoMapper userInfoMapper;

    private final LoginLogMapper loginLogMapper;

    private final LoginMailProperties loginMailProperties;

    private final FreeMarkerUtils freeMarkerUtils;

    private final MailUtils mailUtils;

    @RabbitListener(bindings = @QueueBinding(
            value = @Queue(value = "zero-admin_login_mail_send_exchange_queue", durable = "false"),
            exchange = @Exchange(
                    value = "amq.topic",
                    ignoreDeclarationExceptions = "true",
                    durable = "true",
                    type = ExchangeTypes.TOPIC
            ),
            key = {"zero-admin.login.mail.send"}))
    public void loginMailSendListen(Integer loginLoginId) {
        log.info("[消息队列功能]监听用户登录日志消息，准备发送登录邮件，登录日志主键：{}", loginLoginId);
        try {
            LoginLog loginLog = loginLogMapper.selectById(loginLoginId);
            if (!ObjectUtils.isEmpty(loginLog)) {
                UserInfo userInfo = userInfoMapper.selectById(loginLog.getUserId());
                if (StringUtils.isNotBlank(userInfo.getMail())) {
                    User user = userMapper.selectById(userInfo.getId());
                    log.info("[邮件发送功能]发送用户{}登录邮件", user.getUsername());
                    ToMail toMail = new ToMail();
                    // 设置邮箱接收者的邮箱账号
                    toMail.setToMails(new String[]{userInfo.getMail()});
                    // 设置发送邮件的主题信息
                    toMail.setSubject(loginMailProperties.getSubject());
                    // 准备邮件模板参数
                    LoginMailParams loginMailParams = new LoginMailParams();
                    loginMailParams.setUsername(user.getUsername());
                    loginMailParams.setLoginTime(loginLog.getLoginTime());
                    loginMailParams.setLoginAddress(loginLog.getCountry() + StringConst.SPACE + loginLog.getRegion() + StringConst.SPACE + loginLog.getCity());
                    loginMailParams.setLoginIp(loginLog.getIp());
                    // 通过邮件模板参数和属性，获取模板内容字符串
                    String content = freeMarkerUtils.getTemplateContent(loginMailParams, loginMailProperties.getPath(), loginMailProperties.getFile());
                    toMail.setContent(content);
                    // 发送邮件
                    mailUtils.sendTemplateMail(toMail);
                }
            }
        } catch (Exception e) {
            log.error("[消息队列功能]监听用户登录日志消息，发送登录邮件失败，登录日志主键：{}", loginLoginId);
            e.printStackTrace();
        }
    }

}
