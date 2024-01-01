package com.zero.auth.security.util;

import com.zero.auth.entity.LoginLog;
import com.zero.auth.entity.User;
import com.zero.auth.entity.UserInfo;
import com.zero.auth.mapper.LoginLogMapper;
import com.zero.auth.mapper.UserInfoMapper;
import com.zero.auth.mapper.UserMapper;
import com.zero.auth.security.jwt.properties.JwtProperties;
import com.zero.auth.security.jwt.util.JwtUtils;
import com.zero.auth.service.LoginLogService;
import com.zero.common.constant.StringConst;
import com.zero.common.util.FreeMarkerUtils;
import com.zero.common.util.JsonUtils;
import com.zero.common.util.RedisUtils;
import com.zero.mail.domain.ToMail;
import com.zero.mail.template.login.LoginMailParams;
import com.zero.mail.template.login.LoginMailProperties;
import com.zero.mail.util.MailUtils;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Component;

import jakarta.servlet.http.HttpServletRequest;
import java.util.UUID;

/**
 * @author herenpeng
 * @since 2021-04-08 22:51
 */
@Slf4j
@RequiredArgsConstructor
@Component
public class LoginUtils {

    private final JsonUtils jsonUtils;

    private final JwtProperties jwtProperties;

    private final JwtUtils jwtUtils;

    private final RedisUtils<String, Object> redisUtils;

    private final LoginLogService loginLogService;

    private final UserMapper userMapper;

    private final UserInfoMapper userInfoMapper;

    private final LoginLogMapper loginLogMapper;

    private final LoginMailProperties loginMailProperties;

    private final FreeMarkerUtils freeMarkerUtils;

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
        String subject = jsonUtils.toJson(user);
        // 创建JWT
        String jwt = jwtUtils.createJWT(tokenId, subject);
        // 将jwt存放入redis中
        String tokenRedisKey = jwtProperties.getKey() + StringConst.COLON + tokenId;
        redisUtils.set(tokenRedisKey, jwt, jwtProperties.getTtl());
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
            loginMailParams.setLoginAddress(loginLog.getCountry() + StringConst.SPACE + loginLog.getRegion() + StringConst.SPACE + loginLog.getCity());
            loginMailParams.setLoginIp(loginLog.getIp());
            // 通过邮件模板参数和属性，获取模板内容字符串
            String content = freeMarkerUtils.getTemplateContent(loginMailParams, loginMailProperties.getPath(), loginMailProperties.getFile());
            toMail.setContent(content);
            // 发送邮件
            mailUtils.sendTemplateMail(toMail);
        } catch (Exception e) {
            log.error("[邮件功能]发送登录邮件失败，登录日志主键：{}", loginLog.getId());
            e.printStackTrace();
        }
    }


}
