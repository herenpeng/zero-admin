package com.zero.sys.listener.event.stop;

import com.zero.common.listener.event.StopEvent;
import com.zero.sys.mapper.ResourcesMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

/**
 * 在系统停止的时候，进行资源销毁，一般用户开发环境
 *
 * @author herenpeng
 * @since 2020-10-18 9:22
 */
@Component
public class DestroyResources implements StopEvent {

    @Autowired
    private ResourcesMapper resourcesMapper;

    @Override
    public void doEvent() throws Exception {
        resourcesMapper.deleteAll();
    }

}
