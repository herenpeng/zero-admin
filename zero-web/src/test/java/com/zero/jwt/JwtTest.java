package com.zero.jwt;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.zero.MyApplication;
import com.zero.common.jwt.peoperty.JwtProperties;
import com.zero.sys.security.jwt.util.JwtUtils;
import io.jsonwebtoken.Claims;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import javax.crypto.BadPaddingException;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;
import javax.crypto.ShortBufferException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.util.HashMap;
import java.util.Map;

/**
 * @author herenpeng
 * @since 2020-09-28 20:59
 */
@SpringBootTest(classes = {MyApplication.class})
@RunWith(SpringRunner.class)
public class JwtTest {

    @Autowired
    private JwtProperties jwtProperties;

    @Autowired
    private JwtUtils jwtUtils;


    @Test
    public void test01() throws JsonProcessingException, InvalidKeyException, BadPaddingException, ShortBufferException, IllegalBlockSizeException, NoSuchPaddingException, NoSuchAlgorithmException {
        Map map = new HashMap<>();
        map.put("username", "张三");
        map.put("role", "admin");
        String subject = new ObjectMapper().writeValueAsString(map);
        try {
            String jwt = jwtUtils.createJWT("ID_123456", "Anson", subject, jwtProperties.getTtl(),null);
            System.out.println("JWT：" + jwt);
            System.out.println("解密========================");
            Claims c = jwtUtils.parseJWT(jwt);
            System.out.println(c.getId());
            System.out.println(c.getIssuedAt());
            System.out.println(c.getSubject());
            System.out.println(c.getIssuer());
            // System.out.println(c.get("uid", String.class));
            // System.out.println(c.get("user_name", String.class));

        } catch (Exception e) {
            e.printStackTrace();
        }

    }

}
