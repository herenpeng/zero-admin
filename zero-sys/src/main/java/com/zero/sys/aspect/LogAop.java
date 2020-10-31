package com.zero.sys.aspect;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.zero.common.annotation.LogOperation;
import com.zero.common.request.util.RequestUtils;
import com.zero.sys.domain.Log;
import com.zero.sys.mapper.LogMapper;
import com.zero.sys.security.jwt.util.JwtUtils;
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
    private RequestUtils requestUtils;

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
        log = new Log();
        log.setAccessTime(new Date());
    }

    @AfterReturning("logOperationAop()")
    public void doAfterReturning(JoinPoint joinPoint) throws JsonProcessingException {
        String token = requestUtils.getToken(request);
        String username = jwtUtils.getUsername(token);
        log.setUsername(username);
        log.setIp(request.getRemoteAddr());
        log.setUri(request.getRequestURI());
        log.setMethodType(request.getMethod().toUpperCase());
        log.setMethod(joinPoint.getTarget().getClass() + "." + joinPoint.getSignature().getName());
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



    @After("logOperationAop()")
    public void doAfter() {
        logMapper.insert(log);
    }


    @AfterThrowing(value = "logOperationAop()", throwing = "e")
    public void doAfterThrowing(Exception e) {
        log.setExceptionName(e.getClass().getName());
        log.setExceptionMessage(e.getMessage());
        logMapper.insert(log);
    }


}
