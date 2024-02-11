package com.zero.common.kit;

import lombok.extern.slf4j.Slf4j;
import org.springframework.aop.framework.AdvisedSupport;
import org.springframework.aop.support.AopUtils;

import java.lang.reflect.Field;

@Slf4j
public class ProxyKit {

    /**
     * 获取SpringAOP代理类的原始类
     *
     * @param beanInstance 代理类实例
     * @return 原始类实例
     */
    public static Object getTarget(Object beanInstance) {
        if (!AopUtils.isAopProxy(beanInstance)) {
            return beanInstance;
        } else if (AopUtils.isCglibProxy(beanInstance)) {
            try {
                Field field = beanInstance.getClass().getDeclaredField("CGLIB$CALLBACK_0");
                field.setAccessible(true);
                Object dynamicAdvisedInterceptor = field.get(beanInstance);
                Field advised = dynamicAdvisedInterceptor.getClass().getDeclaredField("advised");
                advised.setAccessible(true);
                return  ((AdvisedSupport) advised.get(dynamicAdvisedInterceptor)).getTargetSource().getTarget();
            } catch (NoSuchFieldException e) {
                log.error("[AOP动态代理]获取动态代理的原目标发生异常，无法获取CGLIB$CALLBACK_0属性");
                e.printStackTrace();
            } catch (IllegalAccessException e) {
                log.error("[AOP动态代理]获取动态代理的原目标发生异常，反射非法访问属性");
                e.printStackTrace();
            } catch (Exception e) {
                log.error("[AOP动态代理]获取动态代理的原目标发生异常，获取原目标对象异常");
                e.printStackTrace();
            }
        }
        return null;
    }


}

