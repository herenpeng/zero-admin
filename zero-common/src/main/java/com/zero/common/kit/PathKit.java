package com.zero.common.kit;

import com.zero.common.constant.AppConst;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;

@Slf4j
public class PathKit {


    /**
     * 获取类上的@RequestMapping注解路径
     *
     * @param beanClass Controller类的字节码对象
     * @return 类上的@RequestMapping注解的路径
     */
    public static String getBeanPath(Class<?> beanClass) {
        // 获取类上的@RequestMapping注解
        RequestMapping requestMapping = beanClass.getAnnotation(RequestMapping.class);
        if (requestMapping != null) {
            String[] value = requestMapping.value();
            if (value.length > 0) {
                return value[0];
            }
        }
        return "";
    }

    /**
     * 拼接路径
     *
     * @param beanPath   类路径
     * @param methodPath 方法路径
     * @return 返回拼接之后的路径
     */
    public static String splicingUri(String beanPath, String methodPath) {
        if (StringUtils.isNotBlank(beanPath) && !beanPath.startsWith(AppConst.PATH_SEPARATOR)) {
            beanPath = AppConst.PATH_SEPARATOR + beanPath;
        }
        if (StringUtils.isNotBlank(methodPath) && !methodPath.startsWith(AppConst.PATH_SEPARATOR)) {
            methodPath = AppConst.PATH_SEPARATOR + methodPath;
        }
        return beanPath + methodPath;
    }

}
