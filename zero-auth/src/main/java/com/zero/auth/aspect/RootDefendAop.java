package com.zero.auth.aspect;

import com.zero.auth.annotation.RootDefend;
import com.zero.auth.entity.Role;
import com.zero.auth.entity.User;
import com.zero.auth.mapper.RoleMapper;
import com.zero.auth.mapper.UserMapper;
import com.zero.auth.properties.RootProperties;
import com.zero.common.exception.AppException;
import com.zero.common.exception.AppExceptionEnum;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.aspectj.lang.reflect.MethodSignature;
import org.springframework.core.DefaultParameterNameDiscoverer;
import org.springframework.expression.EvaluationContext;
import org.springframework.expression.Expression;
import org.springframework.expression.ExpressionParser;
import org.springframework.expression.spel.standard.SpelExpressionParser;
import org.springframework.expression.spel.support.StandardEvaluationContext;
import org.springframework.stereotype.Component;

import java.lang.reflect.Method;
import java.util.function.Consumer;

/**
 * @author herenpeng
 * @since 2021-04-29 23:07
 */
@Slf4j
@RequiredArgsConstructor
@Aspect
@Component
public class RootDefendAop {

    private final RootProperties rootProperties;
    private final UserMapper userMapper;
    private final RoleMapper roleMapper;

    private final ExpressionParser parser = new SpelExpressionParser();
    private final DefaultParameterNameDiscoverer discoverer = new DefaultParameterNameDiscoverer();

    @Pointcut("@annotation(com.zero.auth.annotation.RootDefend)")
    public void rootDefendAop() {
    }

    @Before("rootDefendAop()")
    public void doBefore(JoinPoint joinPoint) {
        MethodSignature methodSignature = (MethodSignature) joinPoint.getSignature();
        Method method = methodSignature.getMethod();
        RootDefend rootDefend = method.getAnnotation(RootDefend.class);
        Object[] args = joinPoint.getArgs();
        EvaluationContext context = bindParam(method, args);
        //获取表达式
        checkRootDefend(rootDefend.userId(), context, this::checkRootUser);
        checkRootDefend(rootDefend.roleId(), context, this::checkRootRole);
    }


    private void checkRootDefend(String el, EvaluationContext context, Consumer<String> consumer) {
        if (StringUtils.isNotBlank(el)) {
            Expression expression = parser.parseExpression(el);
            Object value = expression.getValue(context);
            if (value != null) {
                consumer.accept(value.toString());
            }
        }
    }


    /**
     * 校验Root用户的权限，不允许所有用户对该Root账号进行修改，删除，增删角色等等操作
     *
     * @param userId 用户主键
     */
    private void checkRootUser(String userId) {
        User user = userMapper.selectById(Integer.parseInt(userId));
        if (StringUtils.equals(rootProperties.getUsername(), user.getUsername())) {
            log.error("[root保护机制]禁止修改root用户账号");
            throw new AppException(AppExceptionEnum.INSUFFICIENT_AUTHENTICATION);
        }
    }

    /**
     * 校验Root角色的权限，不允许所有用户对该Root角色进行修改，删除等等操作
     *
     * @param roleId 角色主键
     */
    private void checkRootRole(String roleId) {
        Role role = roleMapper.selectById(Integer.parseInt(roleId));
        if (StringUtils.equals(rootProperties.getRoleName(), role.getName())) {
            log.error("[root保护机制]禁止修改root用户角色");
            throw new AppException(AppExceptionEnum.INSUFFICIENT_AUTHENTICATION);
        }
    }

    /**
     * 将方法的参数名和参数值绑定
     *
     * @param method 方法，根据方法获取参数名
     * @param args   方法的参数值
     */
    private EvaluationContext bindParam(Method method, Object[] args) {
        // 将参数名与参数值对应起来
        EvaluationContext context = new StandardEvaluationContext();
        // 获取方法的参数名
        String[] params = discoverer.getParameterNames(method);
        if (params == null || params.length == 0) {
            return context;
        }
        for (int len = 0; len < params.length; len++) {
            context.setVariable(params[len], args[len]);
        }
        return context;
    }


}
