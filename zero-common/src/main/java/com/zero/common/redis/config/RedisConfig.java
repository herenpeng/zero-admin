package com.zero.common.redis.config;

import org.springframework.cache.annotation.CachingConfigurerSupport;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.redis.connection.RedisConnectionFactory;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.serializer.StringRedisSerializer;

/**
 * Redis配置类
 *
 * @author herenpeng
 * @since 2020-11-05 23:53
 */
@Configuration
public class RedisConfig extends CachingConfigurerSupport {

    @Bean
    public RedisTemplate<String, Object> redisTemplate(RedisConnectionFactory factory) {
        RedisTemplate<String, Object> redisTemplate = new RedisTemplate<String, Object>();
        redisTemplate.setConnectionFactory(factory);

        // 在这里，改用StringRedisSerializer序列化方式
        // a、setKeySerializer：对redis的key值 设置序列化方式
        // b、setValueSerializer：对redis的value值 设置序列化方式
        // (若配置则只能接受String类型，其他类型需转为String类型)
        StringRedisSerializer stringRedisSerializer = new StringRedisSerializer();

        // String
        redisTemplate.setKeySerializer(stringRedisSerializer);
        redisTemplate.setValueSerializer(stringRedisSerializer);
        // Hash
        redisTemplate.setHashKeySerializer(stringRedisSerializer);
        redisTemplate.setHashValueSerializer(stringRedisSerializer);

        return redisTemplate;
    }

}
