package com.zero.common.websocket;

import com.zero.common.enums.WebSocketEventEnum;
import com.zero.common.kit.JsonKit;
import jakarta.websocket.*;
import jakarta.websocket.server.ServerEndpoint;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import java.util.function.Consumer;

@Slf4j
@RequiredArgsConstructor
@Component
@ServerEndpoint(value = "/websocket")
public class AppWebSocket {

    @Autowired
    private JsonKit jsonKit;

    private static final String KEY = "@";
    private static final Map<Integer, Consumer<String>> webSocketEventMap = new ConcurrentHashMap<>();

    private static final Map<String, Session> webSocketSessions = new ConcurrentHashMap<>();


    public void register(WebSocketEventEnum eventEnum, Consumer<String> consumer) {
        webSocketEventMap.put(eventEnum.getValue(), consumer);
    }

    /**
     * WebSocket链接建立后触发的方法
     */
    @OnOpen
    public void onOpen(Session session) throws Exception {
        log.info("[WebSocket链接]建立链接，sessionId:{}", session.getId());
        webSocketSessions.put(session.getId(), session);
    }

    /**
     * 连接关闭后触发的方法
     */
    @OnClose
    public void onClose(Session session) {
        // 将对应的客户端删除
        log.debug("[WebSocket链接]断开链接，sessionId:{}", session.getId());
        webSocketSessions.remove(session.getId());
    }

    /**
     * 接收到客户端消息时触发的方法
     */
    @OnMessage
    public <T> void onMessage(String message, Session session) throws Exception {
        log.debug("[WebSocket链接]接收消息，sessionId:{}，message:{}", session.getId(), message);
        int index = message.indexOf(KEY);
        if (index < 0) {
            return;
        }
        try {
            int event = Integer.parseInt(message.substring(0, index));
            String data = message.substring(index + 1);
            Consumer<String> consumer = webSocketEventMap.get(event);
            if (consumer != null) {
                consumer.accept(data);
            }
        } catch (Exception e) {
            log.error("[WebSocket链接]接收消息，消息处理错误，sessionId:{}，message:{}，errorMessage:{}", session.getId(), message, e.getMessage());
        }
    }

    /**
     * 发生错误时触发的方法
     */
    @OnError
    public void onError(Session session, Throwable error) {
        log.error("[WebSocket链接]系统建立WebSocket链接发生错误，sessionId:{}，errorMessage:{}", session.getId(), error.getMessage());
    }


    public boolean isEmpty() {
        return webSocketSessions.isEmpty();
    }

    /**
     * 给单个客户端发送消息
     *
     * @param event     事件Id
     * @param data      消息内容
     * @param sessionId 指定发送客户端链接id
     */
    public <T> void sendMessageSingle(int event, T data, String sessionId) {
        Session session = webSocketSessions.get(sessionId);
        if (session != null && session.isOpen()) {
            String message = buildMessage(event, data);
            session.getAsyncRemote().sendText(message);
        }
    }

    /**
     * 给所有客户端发送消息
     *
     * @param event 事件Id
     * @param data  消息内容
     */
    public <T> void sendMessageAll(int event, T data) {
        String message = buildMessage(event, data);
        for (Map.Entry<String, Session> entry : webSocketSessions.entrySet()) {
            Session session = entry.getValue();
            if (session != null && session.isOpen()) {
                session.getAsyncRemote().sendText(message);
            }
        }
    }


    private <T> String buildMessage(int event, T data) {
        return event + KEY + jsonKit.toJson(data);
    }

}
