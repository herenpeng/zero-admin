package com.zero.common.kit;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import jakarta.servlet.http.HttpServletRequest;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Component;
import org.springframework.util.ObjectUtils;

import java.io.IOException;
import java.io.InputStream;
import java.util.Map;

/**
 * 系统封装的Json工具类
 *
 * @author herenpeng
 * @since 2021-03-13 23:51
 */
@Slf4j
@RequiredArgsConstructor
@Component
public class JsonKit {

    private final ObjectMapper objectMapper;

    /**
     * 将对象格式化为 JSON 格式的字符串
     *
     * @param object 对象
     * @return JSON 格式的字符串
     */
    public String toJson(final Object object) {
        if (object == null) {
            log.debug("[Json工具类]对象{}为空", object);
            return null;
        }
        if (object.getClass() == String.class) {
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
    public <T> T toObject(final String json, final Class<T> classType) {
        if (StringUtils.isBlank(json)) {
            log.debug("[Json工具类]JSON字符串{}为空", json);
            return null;
        }
        try {
            return objectMapper.readValue(json, classType);
        } catch (JsonProcessingException e) {
            log.error("[Json工具类]将JSON格式的字符串{}格式化为{}类型的Java对象失败，{}", json, classType, e.getMessage());
        }
        return null;
    }


    public <T> T toObject(final String json, final TypeReference<T> tTypeReference) {
        if (StringUtils.isBlank(json)) {
            log.debug("[Json工具类]JSON字符串{}为空", json);
            return null;
        }
        try {
            return objectMapper.readValue(json, tTypeReference);
        } catch (JsonProcessingException e) {
            log.error("[Json工具类]将JSON格式的字符串{}格式化为{}类型的Java对象失败，{}", json, tTypeReference, e.getMessage());
        }
        return null;
    }

    /**
     * 将指定输入流解析为指定类型 Java 对象
     *
     * @param request   HttpServletRequest对象
     * @param classType Java 字节码对象
     * @return Java 对象的泛型
     */
    public <T> T toObject(final HttpServletRequest request, final Class<T> classType) {
        try {
            return objectMapper.readValue(request.getInputStream(), classType);
        } catch (IOException e) {
            log.error("[Json工具类]将输入流{}格式化为{}类型的Java对象失败", request, classType);
            e.printStackTrace();
        }
        return null;
    }

    /**
     * 将指定输入流解析为指定类型 Java 对象
     *
     * @param inputStream 输入流对象
     * @param classType   Java 字节码对象
     * @return Java 对象的泛型
     */
    public <T> T toObject(final InputStream inputStream, final Class<T> classType) {
        try {
            return objectMapper.readValue(inputStream, classType);
        } catch (IOException e) {
            log.error("[Json工具类]将输入流{}格式化为{}类型的Java对象失败", inputStream, classType);
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
    public <K, V> Map<K, V> toMap(final String json) {
        if (StringUtils.isBlank(json)) {
            log.debug("[Json工具类]JSON字符串{}为空", json);
            return null;
        }
        try {
            return objectMapper.readValue(json, new TypeReference<>() {});
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
    public <K, V> Map<K, V> toMap(final Object object) {
        if (ObjectUtils.isEmpty(object)) {
            log.debug("[Json工具类]对象{}为空", object);
            return null;
        }
        String json = toJson(object);
        return toMap(json);
    }

}
