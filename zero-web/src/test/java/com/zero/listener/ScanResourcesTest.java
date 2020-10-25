package com.zero.listener;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.zero.MyApplication;
import com.zero.sys.domain.Resources;
import com.zero.sys.mapper.ResourcesMapper;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.List;

/**
 * @author herenpeng
 * @since 2020-10-22 11:38
 */
@SpringBootTest(classes = {MyApplication.class})
@RunWith(SpringRunner.class)
public class ScanResourcesTest {


    @Autowired
    private ResourcesMapper resourcesMapper;

    @Test
    public void test01() {
        Resources resources = new Resources();
        resources.setUri(null);
        resources.setMethodType("DELETE");

        QueryWrapper<Resources> queryWrapper = new QueryWrapper<>(resources);
        List<Resources> resourcesList = resourcesMapper.selectList(queryWrapper);
        for (Resources res : resourcesList) {
            System.out.println(res);
        }

    }


}
