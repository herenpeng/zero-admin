package com.zero.listener.event.stop;

import com.zero.common.listener.annotation.EventSort;
import com.zero.common.listener.event.StopEvent;
import com.zero.sys.mapper.ResourcesMapper;
import com.zero.sys.mapper.ResourcesRoleMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

/**
 * 在系统停止的时候，进行资源销毁，一般用于开发环境
 *
 * @author herenpeng
 * @since 2020-10-18 9:22
 */
@EventSort
@Component
public class DestroyResources implements StopEvent {

    @Autowired
    private ResourcesMapper resourcesMapper;

    @Autowired
    private ResourcesRoleMapper resourcesRoleMapper;

    @Override
    public void doEvent() throws Exception {
        // 删除所有系统资源，物理删除
        resourcesMapper.deleteAll();
        // 删除所有系统资源和角色关系，物理删除
        resourcesRoleMapper.deleteAll();
    }

}
