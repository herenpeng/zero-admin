package com.zero.common.event;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.BeansException;
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
public class AppStopListener implements ApplicationListener<ContextClosedEvent>, ApplicationContextAware {

    private ApplicationContext applicationContext;

    @Override
    public void onApplicationEvent(ContextClosedEvent closedEvent) {
        log.info("[系统停止]系统停止中……");
        Map<String, AppEvent> eventMap = applicationContext.getBeansOfType(AppEvent.class);
        List<AppEvent> eventList = eventMap.values().stream().filter(event -> {
            AppStopEvent stopEvent = event.getClass().getAnnotation(AppStopEvent.class);
            return stopEvent != null && stopEvent.enable();
        }).sorted((event1, event2) -> {
            AppStopEvent stopEvent1 = event1.getClass().getAnnotation(AppStopEvent.class);
            AppStopEvent stopEvent2 = event2.getClass().getAnnotation(AppStopEvent.class);
            return stopEvent1.sort() - stopEvent2.sort();
        }).toList();
        for (AppEvent appEvent : eventList) {
            try {
                // 只捕获一件启动事件的异常，如果该事件发生异常，记录异常日志后，其他事件仍然可以继续执行
                appEvent.doEvent();
            } catch (Exception e) {
                // 记录异常日志
                log.error("[系统停止事件]{}系统停止事件执行异常", appEvent);
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
