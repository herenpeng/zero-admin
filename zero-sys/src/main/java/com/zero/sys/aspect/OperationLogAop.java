package com.zero.sys.aspect;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.zero.auth.kit.TokenKit;
import com.zero.common.annotation.AppLog;
import com.zero.common.constant.AppConst;
import com.zero.common.http.util.IpUtils;
import com.zero.common.kit.JsonKit;
import com.zero.sys.entity.OperationLog;
import com.zero.sys.mapper.OperationLogMapper;
import io.swagger.v3.oas.annotations.Operation;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.http.HttpServletRequest;
import lombok.RequiredArgsConstructor;
import org.apache.commons.lang3.StringUtils;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.aspectj.lang.reflect.MethodSignature;
import org.springframework.stereotype.Component;

import java.lang.reflect.Method;
import java.util.Date;

/**
 * AOP记录日志
 *
 * @author herenpeng
 * @since 2020-10-27 23:21
 */
@RequiredArgsConstructor
@Aspect
@Component
public class OperationLogAop {

    private final HttpServletRequest request;

    private final TokenKit tokenKit;

    private final IpUtils ipUtils;

    private final JsonKit jsonKit;

    private final OperationLogMapper operationLogMapper;

    @Pointcut("@annotation(com.zero.common.annotation.AppLog)")
    public void operationLogAop() {
    }

    @Around("operationLogAop()")
    public Object around(ProceedingJoinPoint joinPoint) throws Throwable {
        Object proceed = null;
        OperationLog operationLog = new OperationLog();
        operationLog.setAccessTime(new Date());
        try {
            setLog(operationLog, joinPoint);
            proceed = joinPoint.proceed();
            // 设置执行结果为成功
            operationLog.setResult(true);
        } catch (Exception e) {
            // 设置执行结果为失败
            operationLog.setResult(false);
            operationLog.setExceptionName(e.getClass().getName());
            operationLog.setExceptionMessage(e.getMessage());
        } finally {
            operationLogMapper.insert(operationLog);
        }
        return proceed;
    }

    /**
     * 封装日志记录
     *
     * @param joinPoint AOP切入点
     * @throws JsonProcessingException Json处理异常
     */
    private void setLog(OperationLog log, JoinPoint joinPoint) throws JsonProcessingException {
        // 设置方法的执行时间
        log.setExecutionTime(System.currentTimeMillis() - log.getAccessTime().getTime());
        // 设置操作用户主键
        Integer userId = tokenKit.getUserId(request);
        log.setOperationUserId(userId);
        // 获取用户请求的真实地址
        log.setIp(ipUtils.getIpAddr(request));
        log.setUri(request.getRequestURI());
        // 设置请求方法类型
        log.setMethodType(request.getMethod().toUpperCase());
        // 设置方法名称
        log.setMethod(joinPoint.getTarget().getClass() + AppConst.POINT + joinPoint.getSignature().getName());
        // 设置请求参数
        Object[] args = joinPoint.getArgs();
        // 忽略一些特殊参数
        ignoreArgs(args);
        log.setRequestArgs(jsonKit.toJson(args));
        // 设置方法描述信息
        MethodSignature methodSignature = (MethodSignature) joinPoint.getSignature();
        Method method = methodSignature.getMethod();
        AppLog appLog = method.getAnnotation(AppLog.class);
        if (appLog != null && StringUtils.isNotBlank(appLog.value())) {
            log.setDescription(appLog.value());
        } else {
            Operation apiOperation = method.getAnnotation(Operation.class);
            if (apiOperation != null) {
                log.setDescription(apiOperation.description());
            }
        }
    }

    /**
     * 清楚请求参数里面的特殊参数
     *
     * @param args 参数数组
     */
    private void ignoreArgs(Object[] args) {
        for (int i = 0; i < args.length; i++) {
            if (args[i] instanceof ServletRequest) {
                args[i] = null;
            }
            if (args[i] instanceof ServletResponse) {
                args[i] = null;
            }
        }
    }

}