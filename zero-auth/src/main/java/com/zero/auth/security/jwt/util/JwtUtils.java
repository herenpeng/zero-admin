package com.zero.auth.security.jwt.util;

import com.zero.auth.security.jwt.properties.JwtProperties;
import io.jsonwebtoken.Claims;
import io.jsonwebtoken.JwtBuilder;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.ObjectUtils;
import org.springframework.stereotype.Component;

import java.util.Date;
import java.util.Map;

/**
 * @author herenpeng
 * @since 2020-09-28 20:42
 */
@Slf4j
@RequiredArgsConstructor
@Component
public class JwtUtils {

    private final JwtProperties jwtProperties;

    private final RsaKit rsaKit;

    /**
     * 创建JWT
     *
     * @param id        JWT的ID
     * @param subject   JWT主体信息，一般以Json格式的数据存储
     * @param issuer    JWT签发者
     * @param ttlMillis JWT的有效时间，单位是毫秒
     * @param claims    创建payload的私有声明，也就是自定义的JWT信息
     * @return 返回JWT
     * @throws Exception 抛出异常
     */
    public String createJWT(String id, String subject, String issuer, Long ttlMillis, Map<String, Object> claims) {
        // 指定签名的时候使用的签名算法，也就是header那部分，jjwt已经将这部分内容封装好了。
        SignatureAlgorithm signatureAlgorithm = SignatureAlgorithm.RS256;

        // 下面就是在为payload添加各种标准声明和私有声明了,这里其实就是new一个JwtBuilder，设置jwt的body
        JwtBuilder builder = Jwts.builder();
        // 设置签名使用的签名算法和签名使用的秘钥
        builder.signWith(rsaKit.getPrivateKey(), signatureAlgorithm);
        // jti：设置JWT的ID，是JWT的唯一标识，根据业务需要，这个可以设置为一个不重复的值，主要用来作为一次性token,从而回避重放攻击
        builder.setId(id);
        // iat：JWT的签发时间，生成JWT的时间
        builder.setIssuedAt(new Date());
        // iss：jwt签发人
        builder.setIssuer(issuer);
        // sub：代表这个JWT的主体，即它的所有人，这个是一个json格式的字符串，可以存放用户信息的，作为什么用户的唯一标志
        builder.setSubject(subject);
        if (ObjectUtils.allNotNull(claims)) {
            // 如果有私有声明，一定要先设置这个自己创建的私有的声明，这个是给builder的claim赋值，一旦写在标准的声明赋值之后，就是覆盖了那些标准的声明的
            builder.setClaims(claims);
        }

        // exp：设置过期时间
        if (ttlMillis >= 0) {
            long expiredMillis = System.currentTimeMillis() + ttlMillis;
            Date expiredDate = new Date(expiredMillis);
            builder.setExpiration(expiredDate);
        }
        return builder.compact();
    }

    /**
     * 创建JWT，默认配置了issuer（JWT签发者）
     *
     * @param id        JWT的ID
     * @param subject   JWT主体信息，一般以Json格式的数据存储
     * @param ttlMillis JWT的有效时间，单位是毫秒
     * @param claims    创建payload的私有声明，也就是自定义的JWT信息
     * @return 返回JWT
     * @throws Exception 抛出异常
     */
    public String createJWT(String id, String subject, Long ttlMillis, Map<String, Object> claims) {
        return createJWT(id, subject, jwtProperties.getIssuer(), ttlMillis, claims);
    }

    /**
     * 创建JWT，默认配置了issuer（JWT签发者），ttlMillis（有效时间）
     *
     * @param id      JWT的ID
     * @param subject JWT主体信息，一般以Json格式的数据存储
     * @param claims  创建payload的私有声明，也就是自定义的JWT信息
     * @return 返回JWT
     * @throws Exception 抛出异常
     */
    public String createJWT(String id, String subject, Map<String, Object> claims) {
        return createJWT(id, subject, jwtProperties.getIssuer(), jwtProperties.getTtl(), claims);
    }

    /**
     * 创建JWT，默认配置了issuer（JWT签发者），ttlMillis（有效时间）,默认claims为null
     *
     * @param id      JWT的ID
     * @param subject JWT主体信息，一般以Json格式的数据存储
     * @return 返回JWT
     * @throws Exception 抛出异常
     */
    public String createJWT(String id, String subject) {
        return createJWT(id, subject, jwtProperties.getIssuer(), jwtProperties.getTtl(), null);
    }

    /**
     * 解密JWT，如果秘钥错误，或者JWT被修改过，会直接抛出异常信息
     *
     * @param jwt JWT字符串信息
     * @return 返回JWT载荷信息
     */
    public Claims parseJWT(String jwt) {
        // 得到DefaultJwtParser
        return Jwts.parserBuilder()
                // 设置签名的秘钥
                .setSigningKey(rsaKit.getPublicKey())
                .build()
                // 设置需要解析的jwt
                .parseClaimsJws(jwt).getBody();
    }


    /**
     * 判断jwt是否已经过期
     *
     * @param jwt JWT字符串信息
     * @return 如果jwt已经过期，返回true，否则返回false
     */
    public boolean isExpiration(String jwt) {
        Claims claims = parseJWT(jwt);
        return claims.getExpiration().before(new Date());
    }


}
