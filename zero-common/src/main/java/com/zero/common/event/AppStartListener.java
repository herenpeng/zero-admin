package com.zero.common.event;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.BeansException;
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
public class AppStartListener implements ApplicationListener<ApplicationReadyEvent>, ApplicationContextAware {

    private ApplicationContext applicationContext;

    @Override
    public void onApplicationEvent(ApplicationReadyEvent readyEvent) {
        log.info("[系统启动]系统启动中……");
        Map<String, AppEvent> eventMap = applicationContext.getBeansOfType(AppEvent.class);
        List<AppEvent> eventList = eventMap.values().stream().filter(event -> {
            AppStartEvent startEvent = event.getClass().getAnnotation(AppStartEvent.class);
            return startEvent != null && startEvent.enable();
        }).sorted((event1, event2) -> {
            AppStartEvent startEvent1 = event1.getClass().getAnnotation(AppStartEvent.class);
            AppStartEvent startEvent2 = event2.getClass().getAnnotation(AppStartEvent.class);
            return startEvent1.sort() - startEvent2.sort();
        }).toList();
        for (AppEvent appEvent : eventList) {
            try {
                // 只捕获一件启动事件的异常，如果该事件发生异常，记录异常日志后，其他事件仍然可以继续执行
                appEvent.doEvent();
            } catch (Exception e) {
                // 记录异常日志
                log.error("[系统启动事件]{}系统启动事件执行异常", appEvent);
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
