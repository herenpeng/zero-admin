package com.zero.common.listener.event;

/**
 * 系统事件接口，所有的系统事件都需要实现这个接口，才能够运行
 *
 * @author herenpeng
 * @since 2020-10-16 21:33
 */
public interface Event {

    /**
     * 执行事件
     *
     * @throws Exception 抛出异常，实现类可以抛出Exception或者范围更小的异常
     */
    void doEvent() throws Exception;

}
