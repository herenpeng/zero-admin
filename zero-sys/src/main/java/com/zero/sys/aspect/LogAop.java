package com.zero.sys.aspect;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.zero.auth.security.jwt.util.JwtUtils;
import com.zero.common.annotation.LogOperation;
import com.zero.common.constant.StringConst;
import com.zero.common.http.util.IpUtils;
import com.zero.common.util.JsonUtils;
import com.zero.sys.entity.Log;
import com.zero.sys.mapper.LogMapper;
import io.swagger.annotations.ApiOperation;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.ObjectUtils;
import org.apache.commons.lang3.StringUtils;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.*;
import org.aspectj.lang.reflect.MethodSignature;
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
@Slf4j
@RequiredArgsConstructor
@Aspect
@Component
public class LogAop {

    private final HttpServletRequest request;

    private final JwtUtils jwtUtils;

    private final IpUtils ipUtils;

    private final JsonUtils jsonUtils;

    private final LogMapper logMapper;

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
        // 设置方法的执行时间
        log.setExecutionTime(System.currentTimeMillis() - log.getAccessTime().getTime());
        // 设置操作用户主键
        Integer userId = jwtUtils.getUserId(request);
        log.setOperationUserId(userId);
        // 获取用户请求的真实地址
        log.setIp(ipUtils.getIpAddr(request));
        log.setUri(request.getRequestURI());
        // 设置请求方法类型
        log.setMethodType(request.getMethod().toUpperCase());
        // 设置方法名称
        log.setMethod(joinPoint.getTarget().getClass() + StringConst.POINT + joinPoint.getSignature().getName());
        // 设置请求参数
        Object[] args = joinPoint.getArgs();
        log.setRequestArgs(jsonUtils.toJson(args));
        // 设置方法描述信息
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
