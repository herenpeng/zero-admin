package com.zero.common.listener;

import com.zero.common.listener.config.ListenerConfig;
import com.zero.common.listener.event.StartEvent;
import com.zero.common.listener.util.EventHelper;
import lombok.SneakyThrows;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.BeansException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.context.event.ApplicationReadyEvent;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.context.ApplicationListener;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Map;

/**
 * 系统启动事件监听器
 *
 * @author herenpeng
 * @since 2020-10-16 20:34
 */
@Slf4j
@Component
public class StartListener implements ApplicationListener<ApplicationReadyEvent>, ApplicationContextAware {

    private ApplicationContext applicationContext;

    @Autowired
    private ListenerConfig listenerConfig;

    @Autowired
    private EventHelper<StartEvent> eventHelper;

    @SneakyThrows
    @Override
    public void onApplicationEvent(ApplicationReadyEvent applicationReadyEvent) {
        log.info("[系统启动]系统启动中……");
        // 如果系统不执行系统启动事件，我们直接return方法，不继续执行下面的代码
        if (!listenerConfig.isExecutionStart()) {
            log.info("[系统启动事件]系统启动事件未开启");
            return;
        }
        // 获取所有启动事件的实现类（被Spring容器管理的实现类）
        Map<String, StartEvent> startEventMap = applicationContext.getBeansOfType(StartEvent.class);
        List<StartEvent> eventList = eventHelper.sortAsc(startEventMap);
        for (StartEvent startEvent : eventList) {
            try {
                // 只捕获一件启动事件的异常，如果该事件发生异常，记录异常日志后，其他事件仍然可以继续执行
                startEvent.doEvent();
            } catch (Exception e) {
                // 记录异常日志
                log.error("[系统启动事件]{}系统启动事件执行异常", startEvent);
                e.printStackTrace();
            }
        }
        log.info("[系统启动]系统启动完毕……");
    }

    @Override
    public void setApplicationContext(ApplicationContext applicationContext) throws BeansException {
        this.applicationContext = applicationContext;
    }
}
