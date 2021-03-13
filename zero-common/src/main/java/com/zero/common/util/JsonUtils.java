package com.zero.common.util;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.util.ObjectUtils;

import java.util.Map;

/**
 * @author herenpeng
 * @since 2021-03-13 23:51
 */
@Slf4j
@Component
public class JsonUtils {

    @Autowired
    private ObjectMapper objectMapper;

    /**
     * 将对象格式化为 JSON 格式的字符串
     *
     * @param object 对象
     * @return JSON 格式的字符串
     */
    public String toJson(Object object) {
        if (ObjectUtils.isEmpty(object)) {
            log.info("[Json工具类]对象{}为空", object);
            return null;
        }
        if (object instanceof String) {
            return object.toString();
        }
        try {
            return objectMapper.writeValueAsString(object);
        } catch (JsonProcessingException e) {
            log.error("[Json工具类]将对象{}格式化为JSON格式的字符串失败", object);
            e.printStackTrace();
        }
        return null;
    }

    /**
     * 将 JSON 格式的字符串转换为 Java 对象
     *
     * @param json      JSON 格式的字符串
     * @param classType Java 字节码对象
     * @param <T>       Java 对象的泛型
     * @return Java 对象
     */
    public <T> T toObject(String json, Class<T> classType) {
        if (StringUtils.isBlank(json)) {
            log.info("[Json工具类]JSON字符串{}为空", json);
            return null;
        }
        try {
            return objectMapper.readValue(json, classType);
        } catch (JsonProcessingException e) {
            log.error("[Json工具类]将JSON格式的字符串{}格式化为{}类型的Java对象失败", json, classType);
            e.printStackTrace();
        }
        return null;
    }

    /**
     * 将 JSON 格式的字符串转换为 Map 类型的对象
     *
     * @param json JSON 格式的字符串
     * @return Map 类型的对象
     */
    public Map toMap(String json) {
        if (StringUtils.isBlank(json)) {
            log.info("[Json工具类]JSON字符串{}为空", json);
            return null;
        }
        try {
            return objectMapper.readValue(json, Map.class);
        } catch (JsonProcessingException e) {
            log.error("[Json工具类]将JSON格式的字符串{}格式化为Map类型的Java对象失败", json);
            e.printStackTrace();
        }
        return null;
    }

    /**
     * 将一个 Java 对象转换为 Map 类型的对象
     *
     * @param object Java 对象
     * @return Map 类型的对象
     */
    public Map toMap(Object object) {
        if (ObjectUtils.isEmpty(object)) {
            log.info("[Json工具类]对象{}为空", object);
            return null;
        }
        String json = toJson(object);
        return toMap(json);
    }


}
