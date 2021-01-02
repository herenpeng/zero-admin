package com.zero.common.listener.util;

import com.zero.common.listener.annotation.EventSort;
import com.zero.common.listener.config.EventRegister;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.util.ObjectUtils;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * 系统事件助手，工具类
 *
 * @author herenpeng
 * @since 2021-01-02 21:33
 */
@Component
public class EventHelper<T> {

    @Autowired
    private EventRegister eventRegister;

    /**
     * 系统事件升序排序启动
     *
     * @param eventMap 系统事件Map
     * @return 通过@EventSort注解升序排序的系统事件
     * @throws NoSuchFieldException
     * @throws IllegalAccessException
     */
    public List<T> sortAsc(Map<String, T> eventMap) throws NoSuchFieldException, IllegalAccessException {
        int defaultSort = 5;
        int lastSort = defaultSort;
        List<T> eventList = new ArrayList<>();
        for (Map.Entry<String, T> eventEntry : eventMap.entrySet()) {
            boolean flag = eventRegister.checkSwitch(eventEntry.getKey());
            // 如果事件开启，我们执行对应的事件
            if (flag) {
                T event = eventEntry.getValue();
                EventSort eventSort = event.getClass().getAnnotation(EventSort.class);
                int sort;
                if (ObjectUtils.isEmpty(eventSort)) {
                    sort = defaultSort;
                } else {
                    sort = eventSort.value();
                }
                if (sort < lastSort) {
                    eventList.add(0, eventEntry.getValue());
                } else {
                    eventList.add(eventEntry.getValue());
                }
                lastSort = sort;
            }
        }
        return eventList;
    }

}
