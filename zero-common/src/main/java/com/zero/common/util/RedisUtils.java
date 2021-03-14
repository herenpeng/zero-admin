package com.zero.common.util;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Component;

import java.util.concurrent.TimeUnit;

/**
 * 将RedisTemplate的方法封装为redis命令的工具类
 *
 * @author herenpeng
 * @since 2021-03-14 10:34
 */
@Slf4j
@Component
public class RedisUtils<String, Object> {

    @Autowired
    private RedisTemplate<String, Object> redisTemplate;

    /**
     * 通过key值获取对应的value值
     *
     * @param key key值
     * @return value值
     */
    public Object get(Object key) {
        return redisTemplate.opsForValue().get(key);
    }

    /**
     * 默认使用去毫秒作为有效时长单位
     *
     * @param key     key值
     * @param value   value值
     * @param timeout 有效时长
     */
    public void set(String key, Object value, long timeout) {
        redisTemplate.opsForValue().set(key, value, timeout, TimeUnit.MILLISECONDS);
    }

    /**
     * 设置有效时长的key，value值
     *
     * @param key     key值
     * @param value   value值
     * @param timeout 有效时长
     * @param unit    有效时长的单位枚举类
     */
    public void set(String key, Object value, long timeout, TimeUnit unit) {
        redisTemplate.opsForValue().set(key, value, timeout, unit);
    }

    /**
     * 删除key值
     *
     * @param key key值
     */
    public void del(String key) {
        redisTemplate.delete(key);
    }


}
