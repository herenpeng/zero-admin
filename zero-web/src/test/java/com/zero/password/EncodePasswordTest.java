package com.zero.password;

import com.zero.MyApplication;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.junit4.SpringRunner;

/**
 * 测试密码加密算法
 * @author herenpeng
 * @since 2020-09-13 18:45
 */
@SpringBootTest(classes = {MyApplication.class})
@RunWith(SpringRunner.class)
public class EncodePasswordTest {

    @Autowired
    private PasswordEncoder passwordEncoder;

    @Test
    public void test01() {
        // PasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
        String encode = passwordEncoder.encode("111111");
        System.out.println(encode);
    }


}
