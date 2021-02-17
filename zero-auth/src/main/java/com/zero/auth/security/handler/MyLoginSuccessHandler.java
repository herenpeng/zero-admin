package com.zero.auth.security.handler;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.zero.auth.entity.LoginLog;
import com.zero.auth.entity.User;
import com.zero.auth.mapper.LoginLogMapper;
import com.zero.auth.security.jwt.properties.JwtProperties;
import com.zero.auth.security.jwt.util.JwtUtils;
import com.zero.auth.security.userdetails.MyUserDetails;
import com.zero.auth.util.ResponseUtils;
import com.zero.common.constant.StringConst;
import com.zero.common.http.domain.IpInfo;
import com.zero.common.http.util.IpUtils;
import com.zero.common.response.domain.ResponseData;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Date;
import java.util.UUID;
import java.util.concurrent.TimeUnit;

/**
 * 登录成功的处理器
 *
 * @author herenpeng
 * @since 2020-09-13 15:27
 */
@Component
public class MyLoginSuccessHandler implements AuthenticationSuccessHandler {

    @Autowired
    private ObjectMapper objectMapper;

    @Autowired
    private RedisTemplate redisTemplate;

    @Autowired
    private JwtProperties jwtProperties;

    @Autowired
    private JwtUtils jwtUtils;

    @Autowired
    private ResponseUtils responseUtils;

    @Autowired
    private IpUtils ipUtils;

    @Autowired
    private LoginLogMapper loginLogMapper;


    @Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication) throws IOException, ServletException {
        MyUserDetails myUserDetails = (MyUserDetails) authentication.getPrincipal();
        // 不应该把密码放入JWT的载荷中
        User user = myUserDetails.getUser();
        String tokenId = UUID.randomUUID().toString();
        String subject = objectMapper.writeValueAsString(user);
        // 创建JWT
        String jwt = jwtUtils.createJWT(tokenId, subject);
        // 将jwt存放入redis中
        String tokenRedisKey = jwtProperties.getKey() + StringConst.COLON + tokenId;
        Long tokenRedisTtl = jwtProperties.getTtl() / 1000;
        redisTemplate.opsForValue().set(tokenRedisKey, jwt, tokenRedisTtl, TimeUnit.SECONDS);

        // 记录登录日志
        loginLog(request, user.getId(), tokenId);

        ResponseData<String> responseData = ResponseData.ok(jwt);
        responseUtils.responseJson(response, responseData);
    }


    /**
     * 记录登录日志
     *
     * @param request HttpServletRequest对象
     * @param userId  登录用户主键
     * @param tokenId tokenId
     */
    private void loginLog(HttpServletRequest request, Integer userId, String tokenId) {
        // 记录登录日志
        String ip = ipUtils.getIpAddr(request);
        LoginLog loginLog = new LoginLog();
        loginLog.setUserId(userId);
        loginLog.setIp(ip);
        loginLog.setTokenId(tokenId);
        IpInfo.Data data = ipUtils.getIpInfo(ip).getData();
        loginLog.setCountry(data.getCountry());
        loginLog.setRegion(data.getRegion());
        loginLog.setCity(data.getCity());
        loginLog.setIsp(data.getIsp());
        // 登录时间
        Date loginTime = new Date();
        loginLog.setLoginTime(loginTime);
        // 默认登录时间为登录时间+token失效时间，在用户主动登出时，需要将登出时间关闭
        long logoutTime = loginTime.getTime() + jwtProperties.getTtl();
        Date defaultLogoutTime = new Date(logoutTime);
        loginLog.setLogoutTime(defaultLogoutTime);
        loginLogMapper.insert(loginLog);
    }


}
