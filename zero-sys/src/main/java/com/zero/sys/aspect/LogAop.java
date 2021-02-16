package com.zero.sys.aspect;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.zero.common.annotation.LogOperation;
import com.zero.common.constant.StringConst;
import com.zero.sys.entity.Log;
import com.zero.sys.mapper.LogMapper;
import com.zero.auth.security.jwt.util.JwtUtils;
import io.swagger.annotations.ApiOperation;
import org.apache.commons.lang3.ObjectUtils;
import org.apache.commons.lang3.StringUtils;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.*;
import org.aspectj.lang.reflect.MethodSignature;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpServletRequest;
import java.lang.reflect.Method;
import java.util.Date;

/**
 * AOP记录日志
 *
 * @author herenpeng
 * @since 2020-10-27 23:21
 */
@Aspect
@Component
public class LogAop {

    @Autowired
    private HttpServletRequest request;

    @Autowired
    private JwtUtils jwtUtils;

    @Autowired
    private LogMapper logMapper;

    private Log log;

    @Pointcut("@annotation(com.zero.common.annotation.LogOperation)")
    public void logOperationAop() {
    }

    @Before("logOperationAop()")
    public void doBefore() {
        // 创建一个日志记录
        log = new Log();
        // 设置日志的访问时间
        log.setAccessTime(new Date());
    }

    @AfterReturning("logOperationAop()")
    public void doAfterReturning(JoinPoint joinPoint) throws JsonProcessingException {
        setLog(joinPoint);
        // 设置执行结果为成功
        log.setResult(true);
    }


    @AfterThrowing(value = "logOperationAop()", throwing = "e")
    public void doAfterThrowing(JoinPoint joinPoint, Exception e) throws JsonProcessingException {
        setLog(joinPoint);

        // 设置执行结果为失败
        log.setResult(false);
        log.setExceptionName(e.getClass().getName());
        log.setExceptionMessage(e.getMessage());
    }


    @After("logOperationAop()")
    public void doAfter() {
        // 将日志记录插入数据库中
        logMapper.insert(log);
    }


    /**
     * 封装日志记录
     *
     * @param joinPoint AOP切入点
     * @throws JsonProcessingException Json处理异常
     */
    private void setLog(JoinPoint joinPoint) throws JsonProcessingException {
        Integer userId = jwtUtils.getUserId(request);
        log.setOperationUserId(userId);
        log.setIp(getIpAddr(request));
        log.setUri(request.getRequestURI());
        log.setMethodType(request.getMethod().toUpperCase());
        log.setMethod(joinPoint.getTarget().getClass() + StringConst.POINT + joinPoint.getSignature().getName());
        log.setExecutionTime(System.currentTimeMillis() - log.getAccessTime().getTime());

        MethodSignature methodSignature = (MethodSignature) joinPoint.getSignature();
        Method method = methodSignature.getMethod();
        LogOperation logOperation = method.getAnnotation(LogOperation.class);
        if (ObjectUtils.allNotNull(logOperation) && StringUtils.isNotBlank(logOperation.value())) {
            log.setDescription(logOperation.value());
        } else {
            ApiOperation apiOperation = method.getAnnotation(ApiOperation.class);
            if (ObjectUtils.allNotNull(apiOperation)) {
                log.setDescription(apiOperation.value());
            }
        }
    }

    /**
     * 获取访问用户的真实地址，因为如果使用了nginx反向代理，无法获取访问用户的真实地址
     *
     * @param request HttpServletRequest对象
     * @return 真实ip地址
     */
    private String getIpAddr(HttpServletRequest request) {
        String ip = request.getHeader("X-Forwarded-For");
        if (checkIp(ip)) {
            ip = request.getHeader("Proxy-Client-IP");
        }
        if (checkIp(ip)) {
            ip = request.getHeader("WL-Proxy-Client-IP");
        }
        if (checkIp(ip)) {
            ip = request.getRemoteAddr();
        }
        return ip;
    }

    /**
     * 判断ip是否有效
     *
     * @param ip ip地址
     * @return ip是否有效，布尔值
     */
    private boolean checkIp(String ip) {
        return StringUtils.isBlank(ip) || "unknown".equalsIgnoreCase(ip);
    }


}
