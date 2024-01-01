package com.zero.common.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.redis.cache.RedisCacheConfiguration;
import org.springframework.data.redis.cache.RedisCacheManager;
import org.springframework.data.redis.connection.RedisConnectionFactory;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.serializer.GenericJackson2JsonRedisSerializer;
import org.springframework.data.redis.serializer.RedisSerializationContext;
import org.springframework.data.redis.serializer.StringRedisSerializer;

/**
 * Redis配置类
 *
 * @author herenpeng
 * @since 2020-11-05 23:53
 */
@Configuration
public class RedisConfig {

    @Bean
    public RedisTemplate<String, Object> redisTemplate(RedisConnectionFactory factory) {
        RedisTemplate<String, Object> redisTemplate = new RedisTemplate<>();
        redisTemplate.setConnectionFactory(factory);
        // 设置StringRedisSerializer序列化方式
        StringRedisSerializer stringRedisSerializer = new StringRedisSerializer();

        // 对redis的key值 设置序列化方式
        redisTemplate.setKeySerializer(stringRedisSerializer);
        // 对redis的value值 设置序列化方式
        redisTemplate.setValueSerializer(stringRedisSerializer);
        // Hash
        redisTemplate.setHashKeySerializer(stringRedisSerializer);
        redisTemplate.setHashValueSerializer(stringRedisSerializer);
        return redisTemplate;
    }


    @Bean
    public RedisCacheManager cacheManager(RedisConnectionFactory redisConnectionFactory) {
        RedisCacheConfiguration config = RedisCacheConfiguration.defaultCacheConfig();
        config = config.serializeValuesWith(RedisSerializationContext
                .SerializationPair
                .fromSerializer(new GenericJackson2JsonRedisSerializer()));
        RedisCacheManager.RedisCacheManagerBuilder builder = RedisCacheManager
                .builder(redisConnectionFactory)
                .cacheDefaults(config);
        return builder.build();
    }

}
