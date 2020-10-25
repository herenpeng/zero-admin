package com.zero.jwt;

import com.fasterxml.jackson.core.JsonProcessingException;
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
        String token = "eyJhbGciOiJIUzI1NiJ9.eyJqdGkiOiJkOGRiZmNjNi00MzA5LTQzNGYtODhiYS04MGY4NTgzOWFkNzciLCJpYXQiOjE2MDM2MjY0MjYsImlzcyI6Imh0dHBzOi8vd3d3Lnplcm8uY29tIiwic3ViIjoie1wiaWRcIjoyLFwiY3JlYXRlVGltZVwiOm51bGwsXCJ1cGRhdGVUaW1lXCI6bnVsbCxcImRlbGV0ZWRcIjpudWxsLFwidXNlcm5hbWVcIjpcIuWkqeW4nVwiLFwicGFzc3dvcmRcIjpcIiQyYSQxMCRCcjVSdzFqVjdkNk5mU0d3QXBIcDB1SkdUb1lFanN0aVRFdk1PcjM3VUZFTWZ3cU5xeG54LlwiLFwiZW5hYmxlZFwiOnRydWUsXCJsb2NrZWRcIjpmYWxzZSxcImFjY291bnRFeHBpcmVcIjpmYWxzZSxcInBhc3N3b3JkRXhwaXJlXCI6ZmFsc2UsXCJyb2xlc1wiOlt7XCJpZFwiOjIsXCJjcmVhdGVUaW1lXCI6bnVsbCxcInVwZGF0ZVRpbWVcIjpudWxsLFwiZGVsZXRlZFwiOm51bGwsXCJuYW1lXCI6XCJ1c2VyXCIsXCJkZXNjcmlwdGlvblwiOlwi5pmu6YCa55So5oi35p2D6ZmQXCJ9LHtcImlkXCI6MyxcImNyZWF0ZVRpbWVcIjpudWxsLFwidXBkYXRlVGltZVwiOm51bGwsXCJkZWxldGVkXCI6bnVsbCxcIm5hbWVcIjpcImFkbWluXCIsXCJkZXNjcmlwdGlvblwiOlwiYWRtaW7mnYPpmZDvvIznrqHnkIblkZjmnYPpmZBcIn1dfSIsImV4cCI6MTYwMzYzMDAyNn0.a5NTLQjQkcJX3qslBW4RTnT7JNB-T4PdsPgkAg8pPFA";
        Claims claims = jwtUtils.parseJWT(token);
        String subject = claims.getSubject();
        System.out.println(subject);
    }

}
