package com.zero.auth.aspect;

import com.zero.auth.annotation.RoleId;
import com.zero.auth.annotation.UserId;
import lombok.RequiredArgsConstructor;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.aspectj.lang.reflect.MethodSignature;
import org.springframework.stereotype.Component;
import org.springframework.util.ObjectUtils;

/**
 * @author herenpeng
 * @since 2021-04-29 23:07
 */
@RequiredArgsConstructor
@Aspect
@Component
public class VerifyRootAop {

    @Pointcut("@annotation(com.zero.auth.annotation.VerifyRoot)")
    public void verifyRootAop() {
    }

    // @Before("verifyRootAop()")
    public void doBefore(JoinPoint joinPoint) {
        Object[] args = joinPoint.getArgs();
        MethodSignature methodSignature = (MethodSignature) joinPoint.getSignature();
        Class[] parameterTypes = methodSignature.getParameterTypes();
        for (Class<?> parameterClass : parameterTypes) {
            UserId userIdAnnotation = parameterClass.getAnnotation(UserId.class);
            if (!ObjectUtils.isEmpty(userIdAnnotation)) {
                // Integer userId = Integer.valueOf(arg.toString());
                // System.out.println(userId);
            }
            RoleId roleIdAnnotation = parameterClass.getAnnotation(RoleId.class);
            if (!ObjectUtils.isEmpty(roleIdAnnotation)) {
                // Integer roleId = Integer.valueOf(arg.toString());
                // System.out.println(roleId);
            }
        }

        for (Object arg : args) {
            UserId userIdAnnotation = arg.getClass().getAnnotation(UserId.class);
            if (!ObjectUtils.isEmpty(userIdAnnotation)) {
                Integer userId = Integer.valueOf(arg.toString());
                System.out.println(userId);
            }
            RoleId roleIdAnnotation = arg.getClass().getAnnotation(RoleId.class);
            if (!ObjectUtils.isEmpty(roleIdAnnotation)) {
                Integer roleId = Integer.valueOf(arg.toString());
                System.out.println(roleId);
            }
        }
    }


}
