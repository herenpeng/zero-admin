package com.zero.listener.event.start;

import com.zero.common.listener.annotation.EventSort;
import com.zero.common.listener.event.StartEvent;
import org.springframework.stereotype.Component;

/**
 * @author herenpeng
 * @since 2021-01-02 22:51
 */
@EventSort(1)
@Component
public class RootUser implements StartEvent {
    @Override
    public void doEvent() throws Exception {
        System.out.println("root用户生成中……");
    }
}
