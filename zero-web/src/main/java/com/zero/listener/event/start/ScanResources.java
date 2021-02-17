package com.zero.listener.event.start;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.zero.auth.entity.Resources;
import com.zero.auth.entity.ResourcesRole;
import com.zero.auth.entity.Role;
import com.zero.auth.mapper.ResourcesMapper;
import com.zero.auth.mapper.ResourcesRoleMapper;
import com.zero.auth.mapper.RoleMapper;
import com.zero.auth.properties.RoleProperties;
import com.zero.common.http.constant.HttpConst;
import com.zero.common.http.constant.MethodTypeConst;
import com.zero.common.listener.annotation.EventSort;
import com.zero.common.listener.event.StartEvent;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.ObjectUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.aop.framework.AdvisedSupport;
import org.springframework.aop.support.AopUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.*;
import springfox.documentation.annotations.ApiIgnore;

import java.lang.reflect.Field;
import java.lang.reflect.Method;

/**
 * 系统启动需要执行的事件
 * 所有的事件需要被Spring容器管理，否则无法生效
 *
 * @author herenpeng
 * @since 2020-10-16 20:41
 */
@Slf4j
@EventSort
@Component
public class ScanResources implements StartEvent {

    /**
     * 匹配的正则表达式，例如{id}
     */
    public static final String REGEX = "\\{[A-Za-z]+\\}";

    /**
     * 替换正则表达式内的内容，形成新的适用于正则表达式
     */
    public static final String REPLACE = "[0-9]+";

    /**
     * 正则匹配开始标志
     */
    public static final String REGEX_START = "^";

    /**
     * 正则匹配结束标志
     */
    public static final String REGEX_END = "$";

    @Autowired
    private ConfigurableApplicationContext run;

    @Autowired
    private RoleMapper roleMapper;

    @Autowired
    private RoleProperties roleProperties;

    @Autowired
    private ResourcesMapper resourcesMapper;

    @Autowired
    private ResourcesRoleMapper resourcesRoleMapper;

    @Override
    public void doEvent() throws Exception {
        scanResources(run);
    }

    /**
     * 扫描系统资源
     *
     * @param run
     */
    private void scanResources(ConfigurableApplicationContext run) {
        // 获取@RestController注解的类名集合
        String[] restControllerBeanNameList = run.getBeanNamesForAnnotation(RestController.class);
        Role rootRole = roleMapper.getByName(roleProperties.getRootName());
        // 获取类对象名称
        for (String beanName : restControllerBeanNameList) {
            Object bean = run.getBean(beanName);
            // 如果ControllerBean上有@ApiIgnore注解，不将该ControllerBean作为系统资源扫描
            ApiIgnore apiIgnore = bean.getClass().getAnnotation(ApiIgnore.class);
            if (ObjectUtils.allNotNull(apiIgnore)) {
                continue;
            }
            Object target = getTarget(bean);
            Class<?> beanClass = target.getClass();
            // 获取类路径
            String beanPath = getBeanPath(beanClass);
            Method[] methods = beanClass.getMethods();
            for (Method method : methods) {
                insertResources(method, beanPath, rootRole);
            }
        }
    }

    /**
     * 获取类上的@RequestMapping注解路径
     *
     * @param beanClass Controller类的字节码对象
     * @return 类上的@RequestMapping注解的路径
     */
    private String getBeanPath(Class<?> beanClass) {
        // 类路径
        String beanPath = "";
        // 获取类上的@RequestMapping注解
        RequestMapping beanRequestMapping = beanClass.getAnnotation(RequestMapping.class);
        if (ObjectUtils.allNotNull(beanRequestMapping)) {
            String[] value = beanRequestMapping.value();
            if (value.length > 0) {
                beanPath = value[0];
            }
        }
        return beanPath;
    }


    /**
     * 插入Resources对象
     *
     * @param method   方法
     * @param beanPath Controller上的路径
     * @param rootRole root角色
     */
    private void insertResources(Method method, String beanPath, Role rootRole) {
        // 获取方法上的@PutMapping,@GetMapping,@PostMapping,@DeleteMapping注解，
        GetMapping getMapping = method.getAnnotation(GetMapping.class);
        PostMapping postMapping = method.getAnnotation(PostMapping.class);
        PutMapping putMapping = method.getAnnotation(PutMapping.class);
        DeleteMapping deleteMapping = method.getAnnotation(DeleteMapping.class);
        if (!ObjectUtils.anyNotNull(getMapping, postMapping, putMapping, deleteMapping)) {
            return;
        }
        // 方法路径
        String methodPath = "";
        // 方法类型
        String methodType = null;
        // 资源描述
        String description = null;
        String[] value;
        if (ObjectUtils.allNotNull(getMapping)) {
            methodType = MethodTypeConst.GET;
            value = getMapping.value();
            if (value.length > 0) {
                methodPath = value[0];
            }
        } else if (ObjectUtils.allNotNull(postMapping)) {
            methodType = MethodTypeConst.POST;
            value = postMapping.value();
            if (value.length > 0) {
                methodPath = value[0];
            }
        } else if (ObjectUtils.allNotNull(putMapping)) {
            methodType = MethodTypeConst.PUT;
            value = putMapping.value();
            if (value.length > 0) {
                methodPath = value[0];
            }
        } else if (ObjectUtils.allNotNull(deleteMapping)) {
            methodType = MethodTypeConst.DELETE;
            value = deleteMapping.value();
            if (value.length > 0) {
                methodPath = value[0];
            }
        }
        ApiOperation apiOperation = method.getAnnotation(ApiOperation.class);
        if (ObjectUtils.allNotNull(apiOperation)) {
            description = apiOperation.value();
        }
        // 通过方法的uri，regex和方法类型查找对应的资源记录
        Resources resources = new Resources();
        resources.setUri(splicingUri(beanPath, methodPath));
        resources.setRegex(splicingRegex(beanPath, methodPath));
        resources.setMethodType(methodType);
        // 先在数据库里面进行查找
        Resources queryResources = resourcesMapper.selectOne(new QueryWrapper<>(resources));
        // 创建一个资源关系对象
        ResourcesRole resourcesRole = new ResourcesRole();
        // 如果有对应的路径和方法，不插入，而是进行更新
        if (ObjectUtils.allNotNull(queryResources)) {
            queryResources.setDescription(description);
            resourcesMapper.updateById(queryResources);
            resourcesRole.setResourcesId(queryResources.getId());
        } else {
            // 数据库中不存在对应的资源记录，插入一条新的资源记录
            resources.setDescription(description);
            resourcesMapper.insert(resources);
            resourcesRole.setResourcesId(resources.getId());
        }
        // 维护root用户的权限，将资源权限分配给root用户
        resourcesRole.setRoleId(rootRole.getId());
        ResourcesRole queryResourcesRole = resourcesRoleMapper.selectOne(new QueryWrapper<>(resourcesRole));
        // 如果root用户不存在该权限，则新增该权限，否则不做处理
        if (!ObjectUtils.allNotNull(queryResourcesRole)) {
            resourcesRoleMapper.insert(resourcesRole);
        }
    }

    /**
     * 获取SpringAOP代理类的原始类
     *
     * @param beanInstance 代理类实例
     * @return 原始类实例
     */
    private Object getTarget(Object beanInstance) {
        if (!AopUtils.isAopProxy(beanInstance)) {
            return beanInstance;
        } else if (AopUtils.isCglibProxy(beanInstance)) {
            try {
                Field field = beanInstance.getClass().getDeclaredField("CGLIB$CALLBACK_0");
                field.setAccessible(true);
                Object dynamicAdvisedInterceptor = field.get(beanInstance);
                Field advised = dynamicAdvisedInterceptor.getClass().getDeclaredField("advised");
                advised.setAccessible(true);
                Object target = ((AdvisedSupport) advised.get(dynamicAdvisedInterceptor)).getTargetSource().getTarget();
                return target;
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


    /**
     * 拼接对应regex表达式
     *
     * @param beanPath   Controller上的路径
     * @param methodPath 方法上面的路径
     * @return 对应regex表达式
     */
    private String splicingRegex(String beanPath, String methodPath) {
        String uri = splicingUri(beanPath, methodPath);
        return REGEX_START + uri.replaceAll(REGEX, REPLACE) + REGEX_END;
    }

    /**
     * 拼接路径
     *
     * @param beanPath   类路径
     * @param methodPath 方法路径
     * @return 返回拼接之后的路径
     */
    private String splicingUri(String beanPath, String methodPath) {
        if (StringUtils.isNoneBlank(beanPath) && !beanPath.startsWith(HttpConst.PATH_SEPARATOR)) {
            beanPath = HttpConst.PATH_SEPARATOR + beanPath;
        }
        if (StringUtils.isNoneBlank(methodPath) && !methodPath.startsWith(HttpConst.PATH_SEPARATOR)) {
            methodPath = HttpConst.PATH_SEPARATOR + methodPath;
        }
        return beanPath + methodPath;
    }

}
