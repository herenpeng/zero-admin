package com.test;

import com.zero.MyApplication;
import com.zero.common.http.domain.IpInfo;
import com.zero.common.http.util.IpUtils;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.stereotype.Component;
import org.springframework.test.context.junit4.SpringRunner;

/**
 * @author herenpeng
 * @since 2021-02-16 9:57
 */
@Component
@RunWith(SpringRunner.class)
@SpringBootTest(classes = MyApplication.class, webEnvironment = SpringBootTest.WebEnvironment.RANDOM_PORT)
public class IpTest {

    @Autowired
    private IpUtils ipUtils;

    @Test
    public void test01() {
        IpInfo ipInfo = ipUtils.getIpInfo("47.114.99.214");
        IpInfo.Data data = ipInfo.getData();
        System.out.println(data);
        System.out.println(data.getCountry() + "\t" + data.getRegion() + "\t" + data.getCity() + "\t" + data.getIsp());
    }

}
