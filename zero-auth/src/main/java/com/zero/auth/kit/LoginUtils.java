package com.zero.auth.kit;

import com.zero.auth.entity.LoginLog;
import com.zero.auth.entity.User;
import com.zero.auth.entity.UserInfo;
import com.zero.auth.mapper.LoginLogMapper;
import com.zero.auth.mapper.UserInfoMapper;
import com.zero.auth.mapper.UserMapper;
import com.zero.auth.properties.JwtProperties;
import com.zero.auth.service.LoginLogService;
import com.zero.common.constant.AppConst;
import com.zero.common.kit.FreeMarkerKit;
import com.zero.common.kit.JsonKit;
import com.zero.common.kit.RedisKit;
import com.zero.mail.domain.ToMail;
import com.zero.mail.template.login.LoginMailParams;
import com.zero.mail.template.login.LoginMailProperties;
import com.zero.mail.util.MailUtils;
import jakarta.servlet.http.HttpServletRequest;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Component;

import java.util.UUID;

/**
 * @author herenpeng
 * @since 2021-04-08 22:51
 */
@Slf4j
@RequiredArgsConstructor
@Component
public class LoginUtils {

    private final JsonKit jsonKit;

    private final JwtProperties jwtProperties;

    private final JwtKit jwtKit;

    private final RedisKit redisKit;

    private final LoginLogService loginLogService;

    private final UserMapper userMapper;

    private final UserInfoMapper userInfoMapper;

    private final LoginLogMapper loginLogMapper;

    private final LoginMailProperties loginMailProperties;

    private final MailUtils mailUtils;

    /**
     * 通过用户信息生成Jwt
     *
     * @param user    用户信息
     * @param request HttpServletRequest对象
     * @return Jwt字符串
     */
    public String generateJwt(User user, HttpServletRequest request) {
        user.setPassword(null);
        String tokenId = UUID.randomUUID().toString();
        String subject = jsonKit.toJson(user);
        // 创建JWT
        String jwt = jwtKit.createJWT(tokenId, subject);
        // 将jwt存放入redis中
        String tokenRedisKey = jwtProperties.getKey() + AppConst.COLON + tokenId;
        redisKit.set(tokenRedisKey, jwt, jwtProperties.getTtl());
        // 记录登录日志
        LoginLog loginLog = loginLogService.loginLog(request, user.getId(), tokenId);
        // sendLoginMail(loginLog);
        return jwt;
    }


    public void sendLoginMail(LoginLog loginLog) {
        try {
            UserInfo userInfo = userInfoMapper.selectById(loginLog.getUserId());
            // 用户信息中的邮箱地址不为空的情况下，才进行邮件发送，否则不进行登录邮件的发送
            if (StringUtils.isBlank(userInfo.getMail())) {
                return;
            }
            User user = userMapper.selectById(userInfo.getId());
            log.info("[用户登录]发送用户{}登录邮件", user.getUsername());
            ToMail toMail = new ToMail();
            // 设置邮箱接收者的邮箱账号
            toMail.setToMails(new String[]{userInfo.getMail()});
            // 设置发送邮件的主题信息
            toMail.setSubject(loginMailProperties.getSubject());
            // 准备邮件模板参数
            LoginMailParams loginMailParams = new LoginMailParams();
            loginMailParams.setUsername(user.getUsername());
            loginMailParams.setLoginTime(loginLog.getLoginTime());
            loginMailParams.setLoginAddress(loginLog.getCountry() + AppConst.SPACE + loginLog.getRegion() + AppConst.SPACE + loginLog.getCity());
            loginMailParams.setLoginIp(loginLog.getIp());
            // 通过邮件模板参数和属性，获取模板内容字符串
            String content = FreeMarkerKit.getTemplateContent(loginMailParams, loginMailProperties.getPath(), loginMailProperties.getFile());
            toMail.setContent(content);
            // 发送邮件
            mailUtils.sendTemplateMail(toMail);
        } catch (Exception e) {
            log.error("[邮件功能]发送登录邮件失败，登录日志主键：{}", loginLog.getId());
            e.printStackTrace();
        }
    }


}
