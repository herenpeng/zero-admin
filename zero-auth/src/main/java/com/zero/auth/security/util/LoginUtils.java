package com.zero.auth.security.util;

import com.zero.auth.entity.LoginLog;
import com.zero.auth.entity.User;
import com.zero.auth.security.jwt.properties.JwtProperties;
import com.zero.auth.security.jwt.util.JwtUtils;
import com.zero.auth.service.LoginLogService;
import com.zero.common.constant.StringConst;
import com.zero.common.util.JsonUtils;
import com.zero.common.util.RedisUtils;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.amqp.AmqpException;
import org.springframework.amqp.core.AmqpTemplate;
import org.springframework.stereotype.Component;
import org.springframework.util.ObjectUtils;

import javax.servlet.http.HttpServletRequest;
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

    private final AmqpTemplate amqpTemplate;

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
        // sendMail(loginLog);
        return jwt;
    }


    public void sendMail(LoginLog loginLog) {
        if (!ObjectUtils.isEmpty(loginLog) && !ObjectUtils.isEmpty(loginLog.getId())) {
            try {
                // 发送 rabbitMq 消息，发送登录邮件日志
                amqpTemplate.convertAndSend("amq.topic", "zero-admin.login.mail.send", loginLog.getId());
            } catch (AmqpException e) {
                e.printStackTrace();
                log.info("[消息队列功能]发送用户登录日志消息失败，登录日志主键：{}", loginLog.getId());
            }
        }
    }


}
