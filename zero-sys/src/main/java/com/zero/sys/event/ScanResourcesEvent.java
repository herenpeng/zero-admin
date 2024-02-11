package com.zero.sys.event;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.zero.auth.entity.Resources;
import com.zero.auth.entity.ResourcesRole;
import com.zero.auth.entity.Role;
import com.zero.auth.mapper.ResourcesMapper;
import com.zero.auth.mapper.ResourcesRoleMapper;
import com.zero.auth.mapper.RoleMapper;
import com.zero.auth.properties.RootProperties;
import com.zero.common.constant.MethodTypeConst;
import com.zero.common.event.AppEvent;
import com.zero.common.event.AppStartEvent;
import com.zero.common.kit.PathKit;
import com.zero.common.kit.ProxyKit;
import io.swagger.v3.oas.annotations.Hidden;
import io.swagger.v3.oas.annotations.Operation;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.ObjectUtils;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.*;

import java.lang.reflect.Method;

/**
 * 系统启动需要执行的事件
 * 所有的事件需要被Spring容器管理，否则无法生效
 *
 * @author herenpeng
 * @since 2020-10-16 20:41
 */
@Slf4j
@RequiredArgsConstructor
@AppStartEvent(sort = 3, enable = true)
@Component
public class ScanResourcesEvent implements AppEvent {

    private final ConfigurableApplicationContext run;

    private final RoleMapper roleMapper;

    private final RootProperties rootProperties;

    private final ResourcesMapper resourcesMapper;

    private final ResourcesRoleMapper resourcesRoleMapper;

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
        String[] restControllers = run.getBeanNamesForAnnotation(RestController.class);
        Role rootRole = roleMapper.getByName(rootProperties.getUsername());
        // 获取类对象名称
        for (String beanName : restControllers) {
            Object bean = run.getBean(beanName);
            // 如果ControllerBean上有@Hidden注解，不将该ControllerBean作为系统资源扫描
            Hidden hidden = bean.getClass().getAnnotation(Hidden.class);
            if (hidden != null) {
                continue;
            }
            Object target = ProxyKit.getTarget(bean);
            Class<?> beanClass = target.getClass();
            // 获取类路径
            String beanPath = PathKit.getBeanPath(beanClass);
            Method[] methods = beanClass.getMethods();
            for (Method method : methods) {
                insertResources(method, beanPath, rootRole);
            }
        }
    }



    // 方法路径 方法类型
    private record ResourcesInfo(String methodPath, String methodType) {}

    private ResourcesInfo getResourcesInfo(Method method) {
        // 获取方法上的@PutMapping,@GetMapping,@PostMapping,@DeleteMapping注解，
        String[] value;
        GetMapping getMapping = method.getAnnotation(GetMapping.class);
        if (getMapping != null) {
            value = getMapping.value();
            return new ResourcesInfo(value.length > 0 ? value[0] : "", MethodTypeConst.GET);
        }
        PostMapping postMapping = method.getAnnotation(PostMapping.class);
        if (postMapping != null) {
            value = postMapping.value();
            return new ResourcesInfo(value.length > 0 ? value[0] : "", MethodTypeConst.POST);
        }
        PutMapping putMapping = method.getAnnotation(PutMapping.class);
        if (putMapping != null) {
            value = putMapping.value();
            return new ResourcesInfo(value.length > 0 ? value[0] : "", MethodTypeConst.PUT);
        }
        DeleteMapping deleteMapping = method.getAnnotation(DeleteMapping.class);
        if (deleteMapping != null) {
            value = deleteMapping.value();
            return new ResourcesInfo(value.length > 0 ? value[0] : "", MethodTypeConst.DELETE);
        }
        return null;
    }


    /**
     * 插入Resources对象
     *
     * @param method   方法
     * @param beanPath Controller上的路径
     * @param rootRole root角色
     */
    private void insertResources(Method method, String beanPath, Role rootRole) {
        // 资源描述
        String description = null;
        Operation operation = method.getAnnotation(Operation.class);
        if (operation != null) {
            if (operation.hidden()) {
                return;
            }
            description = operation.description();
        }
        ResourcesInfo resourcesInfo = getResourcesInfo(method);
        if (resourcesInfo == null) {
            return;
        }
        String methodType = resourcesInfo.methodType();
        String methodPath = resourcesInfo.methodPath();
        // 通过方法的uri和方法类型查找对应的资源记录
        Resources resources = new Resources();
        resources.setUri(PathKit.splicingUri(beanPath, methodPath));
        resources.setMethodType(methodType);
        // 先在数据库里面进行查找
        Resources queryResources = resourcesMapper.selectOne(new QueryWrapper<>(resources));
        // 创建一个资源关系对象
        ResourcesRole resourcesRole = new ResourcesRole();
        // 如果有对应的路径和方法，不插入，而是进行更新
        if (queryResources != null) {
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




}
