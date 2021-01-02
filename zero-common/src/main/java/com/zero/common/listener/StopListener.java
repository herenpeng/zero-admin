package com.zero.common.listener;

import com.zero.common.listener.config.ListenerConfig;
import com.zero.common.listener.event.StopEvent;
import com.zero.common.listener.util.EventHelper;
import lombok.SneakyThrows;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.BeansException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.context.ApplicationListener;
import org.springframework.context.event.ContextClosedEvent;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Map;

/**
 * 系统停止事件监听器
 *
 * @author herenpeng
 * @since 2020-10-16 20:35
 */
@Slf4j
@Component
public class StopListener implements ApplicationListener<ContextClosedEvent>, ApplicationContextAware {

    private ApplicationContext applicationContext;

    @Autowired
    private ListenerConfig listenerConfig;

    @Autowired
    private EventHelper<StopEvent> eventHelper;

    @SneakyThrows
    @Override
    public void onApplicationEvent(ContextClosedEvent contextClosedEvent) {
        log.info("[系统停止]系统停止中……");
        // 如果系统不执行系统停止事件，我们直接return方法，不继续执行下面的代码
        if (!listenerConfig.isExecutionStop()) {
            log.info("[系统停止事件]系统停止事件未开启");
            return;
        }
        // 获取所有停止事件的实现类（被Spring容器管理的实现类）
        Map<String, StopEvent> stopEventMap = applicationContext.getBeansOfType(StopEvent.class);
        List<StopEvent> eventList = eventHelper.sortAsc(stopEventMap);
        for (StopEvent stopEvent : eventList) {
            try {
                // 只捕获一件启动事件的异常，如果该事件发生异常，记录异常日志后，其他事件仍然可以继续执行
                stopEvent.doEvent();
            } catch (Exception e) {
                // 记录异常日志
                log.error("[系统停止事件]{}系统停止事件执行异常", stopEvent);
                e.printStackTrace();
            }
        }
        log.info("[系统停止]系统停止完毕……");
    }

    @Override
    public void setApplicationContext(ApplicationContext applicationContext) throws BeansException {
        this.applicationContext = applicationContext;
    }
}
