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
        log = new Log();
        log.setAccessTime(new Date());
    }

    @AfterReturning("logOperationAop()")
    public void doAfterReturning(JoinPoint joinPoint) throws JsonProcessingException {
        setLog(joinPoint);
    }


    @AfterThrowing(value = "logOperationAop()", throwing = "e")
    public void doAfterThrowing(JoinPoint joinPoint, Exception e) throws JsonProcessingException {
        setLog(joinPoint);

        log.setExceptionName(e.getClass().getName());
        log.setExceptionMessage(e.getMessage());
    }


    @After("logOperationAop()")
    public void doAfter() {
        logMapper.insert(log);
    }


    /**
     * 封装日志记录
     *
     * @param joinPoint
     * @throws JsonProcessingException
     */
    private void setLog(JoinPoint joinPoint) throws JsonProcessingException {
        Integer userId = jwtUtils.getUserId(request);
        log.setOperationUserId(userId);
        log.setIp(request.getRemoteAddr());
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

}
