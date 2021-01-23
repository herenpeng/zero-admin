package com.zero.common.listener.util;

import com.zero.common.listener.annotation.EventSort;
import com.zero.common.listener.config.EventRegister;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

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
        List<T> eventList = new ArrayList<>();
        for (Map.Entry<String, T> eventEntry : eventMap.entrySet()) {
            boolean flag = eventRegister.checkSwitch(eventEntry.getKey());
            // 如果事件开启，将对应的事件放入集合中
            if (flag) {
                eventList.add(eventEntry.getValue());
            }
        }
        // 对集合进行升序排序
        sortAsc(eventList);
        return eventList;
    }


    /**
     * 冒泡排序
     *
     * @param eventList 系统事件集合
     */
    private void sortAsc(List<T> eventList) {
        for (int i = 0; i < eventList.size() - 1; i++) {
            for (int j = 0; j < eventList.size() - 1; j++) {
                T event1 = eventList.get(j + 1);
                int eventSort1 = event1.getClass().getAnnotation(EventSort.class).value();
                T event2 = eventList.get(j);
                int eventSort2 = event2.getClass().getAnnotation(EventSort.class).value();
                if (eventSort1 < eventSort2) {
                    T e = eventList.get(j + 1);
                    eventList.remove(j + 1);
                    eventList.add(j + 1, eventList.get(j));
                    eventList.remove(j);
                    eventList.add(j, e);
                }
            }
        }
    }


}
