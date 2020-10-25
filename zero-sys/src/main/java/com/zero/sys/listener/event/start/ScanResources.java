package com.zero.sys.listener.event.start;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.zero.common.listener.event.StartEvent;
import com.zero.sys.domain.Resources;
import com.zero.sys.mapper.ResourcesMapper;
import io.swagger.annotations.ApiOperation;
import org.apache.commons.lang3.ObjectUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
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
@Component
public class ScanResources implements StartEvent {

    /**
     * 请求路径前面的斜杠
     */
    public static final String PATH_PREFIX = "/";

    /**
     * 匹配的正则表达式
     */
    public static final String REGEX = "\\{[A-Za-z0-9]+\\}";

    /**
     * 替换正则表达式内的内容，形成新的适用于正则表达式
     */
    public static final String REPLACE = "[A-Za-z0-9]+";

    public static final String REGEX_START = "^";
    public static final String REGEX_END = "$";

    @Autowired
    ConfigurableApplicationContext run;

    @Autowired
    private ResourcesMapper resourcesMapper;

    @Override
    public void doEvent() throws Exception {
        scanResources(run);
    }

    private void scanResources(ConfigurableApplicationContext run) {
        // 获取@RestController注解的类名集合
        String[] restControllerBeanNameList = run.getBeanNamesForAnnotation(RestController.class);

        // 获取类对象名称
        for (String beanName : restControllerBeanNameList) {
            Object bean = run.getBean(beanName);
            Class<?> beanClass = bean.getClass();

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

            Method[] methods = beanClass.getMethods();
            for (Method method : methods) {
                // 方法路径
                String methodPath = "";
                // 方法类型
                String methodType = null;
                // 资源描述
                String description = null;
                // 获取方法上的@PutMapping,@GetMapping,@PostMapping,@DeleteMapping注解，
                GetMapping getMapping = method.getAnnotation(GetMapping.class);
                PostMapping postMapping = method.getAnnotation(PostMapping.class);
                PutMapping putMapping = method.getAnnotation(PutMapping.class);
                DeleteMapping deleteMapping = method.getAnnotation(DeleteMapping.class);
                if (!ObjectUtils.anyNotNull(getMapping, postMapping, putMapping, deleteMapping)) {
                    continue;
                }
                String[] value = null;
                if (ObjectUtils.allNotNull(getMapping)) {
                    methodType = "GET";
                    value = getMapping.value();
                    if (value.length > 0) {
                        methodPath = value[0];
                    }
                } else if (ObjectUtils.allNotNull(postMapping)) {
                    methodType = "POST";
                    value = postMapping.value();
                    if (value.length > 0) {
                        methodPath = value[0];
                    }
                } else if (ObjectUtils.allNotNull(putMapping)) {
                    methodType = "PUT";
                    value = putMapping.value();
                    if (value.length > 0) {
                        methodPath = value[0];
                    }
                } else if (ObjectUtils.allNotNull(deleteMapping)) {
                    methodType = "DELETE";
                    value = deleteMapping.value();
                    if (value.length > 0) {
                        methodPath = value[0];
                    }
                }

                ApiOperation apiOperation = method.getAnnotation(ApiOperation.class);
                if (ObjectUtils.allNotNull(apiOperation)) {
                    description = apiOperation.value();
                }
                Resources resources = new Resources();
                resources.setUri(splicingUri(beanPath, methodPath));
                resources.setRegex(splicingRegex(beanPath, methodPath));
                resources.setMethodType(methodType);

                // 先在数据库里面进行查找，如果有对应的路径和方法，我们不插入，而是进行更新
                QueryWrapper<Resources> queryWrapper = new QueryWrapper<>(resources);
                Resources res = resourcesMapper.selectOne(queryWrapper);
                if (ObjectUtils.allNotNull(res)) {
                    res.setDescription(description);
                    resourcesMapper.updateById(res);
                } else {
                    resources.setDescription(description);
                    resourcesMapper.insert(resources);
                }
            }
        }
    }

    private String splicingRegex(String beanPath, String methodPath) {
        String uri = splicingUri(beanPath, methodPath);
        String regex = REGEX_START + uri.replaceAll(REGEX, REPLACE) + REGEX_END;
        return regex;
    }

    /**
     * 拼接路径
     *
     * @param beanPath   类路径
     * @param methodPath 方法路径
     * @return 返回拼接之后的路径
     */
    private String splicingUri(String beanPath, String methodPath) {
        if (StringUtils.isNoneBlank(beanPath) && !beanPath.startsWith(PATH_PREFIX)) {
            beanPath = PATH_PREFIX + beanPath;
        }
        if (StringUtils.isNoneBlank(methodPath) && !methodPath.startsWith(PATH_PREFIX)) {
            methodPath = PATH_PREFIX + methodPath;
        }
        return beanPath + methodPath;
    }

}
