package com.zero.sys.aspect;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.zero.auth.security.util.SecurityUtils;
import com.zero.common.annotation.LogOperation;
import com.zero.common.constant.StringConst;
import com.zero.common.http.util.IpUtils;
import com.zero.common.util.JsonUtils;
import com.zero.sys.entity.Log;
import com.zero.sys.mapper.LogMapper;
import io.swagger.annotations.ApiOperation;
import lombok.RequiredArgsConstructor;
import org.apache.commons.lang3.ObjectUtils;
import org.apache.commons.lang3.StringUtils;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.*;
import org.aspectj.lang.reflect.MethodSignature;
import org.springframework.stereotype.Component;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import java.lang.reflect.Method;
import java.util.Date;
import java.util.LinkedList;

/**
 * AOP记录日志
 *
 * @author herenpeng
 * @since 2020-10-27 23:21
 */
@RequiredArgsConstructor
@Aspect
@Component
public class LogAop {

    private final HttpServletRequest request;

    private final SecurityUtils securityUtils;

    private final IpUtils ipUtils;

    private final JsonUtils jsonUtils;

    private final LogMapper logMapper;

    private static final ThreadLocal<LinkedList<Log>> logHolder = ThreadLocal.withInitial(LinkedList::new);

    @Pointcut("@annotation(com.zero.common.annotation.LogOperation)")
    public void logOperationAop() {
    }

    @Before("logOperationAop()")
    public void doBefore() {
        // 创建一个日志记录
        Log log = new Log();
        // 设置日志的访问时间
        log.setAccessTime(new Date());
        LinkedList<Log> logs = logHolder.get();
        logs.push(log);
    }

    @AfterReturning("logOperationAop()")
    public void doAfterReturning(JoinPoint joinPoint) throws JsonProcessingException {
        LinkedList<Log> logs = logHolder.get();
        Log log = logs.peekFirst();
        if (log != null) {
            setLog(log, joinPoint);
            // 设置执行结果为成功
            log.setResult(true);
        }
    }


    @AfterThrowing(value = "logOperationAop()", throwing = "e")
    public void doAfterThrowing(JoinPoint joinPoint, Exception e) throws JsonProcessingException {
        LinkedList<Log> logs = logHolder.get();
        Log log = logs.peekFirst();
        if (log != null) {
            setLog(log, joinPoint);
            // 设置执行结果为失败
            log.setResult(false);
            log.setExceptionName(e.getClass().getName());
            log.setExceptionMessage(e.getMessage());
        }
    }


    @After("logOperationAop()")
    public void doAfter() {
        // 将日志记录插入数据库中
        LinkedList<Log> logs = logHolder.get();
        Log log = logs.pollFirst();
        if (log != null) {
            logMapper.insert(log);
        }
    }


    /**
     * 封装日志记录
     *
     * @param joinPoint AOP切入点
     * @throws JsonProcessingException Json处理异常
     */
    private void setLog(Log log, JoinPoint joinPoint) throws JsonProcessingException {
        // 设置方法的执行时间
        log.setExecutionTime(System.currentTimeMillis() - log.getAccessTime().getTime());
        // 设置操作用户主键
        Integer userId = securityUtils.getUserId(request);
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
        // 忽略一些特殊参数
        ignoreArgs(args);
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
