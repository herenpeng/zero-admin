package com.zero.sys.event;

import com.zero.auth.mapper.ResourcesMapper;
import com.zero.auth.mapper.ResourcesRoleMapper;
import com.zero.common.event.AppEvent;
import com.zero.common.event.AppStopEvent;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;

/**
 * 在系统停止的时候，进行资源销毁，一般用于开发环境
 *
 * @author herenpeng
 * @since 2020-10-18 9:22
 */
@Slf4j
@RequiredArgsConstructor
@AppStopEvent
@Component
public class DestroyResourcesEvent implements AppEvent {

    private final ResourcesMapper resourcesMapper;

    private final ResourcesRoleMapper resourcesRoleMapper;

    @Override
    public void doEvent() throws Exception {
        // 删除所有系统资源，物理删除
        resourcesMapper.deleteAll();
        // 删除所有系统资源和角色关系，物理删除
        resourcesRoleMapper.deleteAll();
    }

}
