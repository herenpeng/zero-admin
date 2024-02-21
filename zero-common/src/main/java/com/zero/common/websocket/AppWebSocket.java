package com.zero.common.websocket;

import com.zero.common.kit.JsonKit;
import com.zero.common.kit.MethodInvoke;
import jakarta.websocket.*;
import jakarta.websocket.server.PathParam;
import jakarta.websocket.server.ServerEndpoint;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.BeansException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.context.event.ApplicationReadyEvent;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.context.ApplicationListener;
import org.springframework.stereotype.Component;

import java.lang.reflect.Method;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

@Slf4j
@RequiredArgsConstructor
@Component
@ServerEndpoint(value = "/websocket/{token}")
public class AppWebSocket implements ApplicationListener<ApplicationReadyEvent>, ApplicationContextAware {
    private static final Map<Integer, MethodInvoke> webSocketMethodMap = new ConcurrentHashMap<>();

    private ApplicationContext applicationContext;

    @Override
    public void setApplicationContext(ApplicationContext applicationContext) throws BeansException {
        this.applicationContext = applicationContext;
    }

    @Override
    public void onApplicationEvent(ApplicationReadyEvent event) {
        Map<String, Object> map = applicationContext.getBeansWithAnnotation(WebSocketController.class);
        for (Object object : map.values()) {
            Method[] declaredMethods = object.getClass().getDeclaredMethods();
            for (Method method : declaredMethods) {
                WebSocketMethod webSocketMethod = method.getAnnotation(WebSocketMethod.class);
                if (webSocketMethod == null) {
                    continue;
                }
                int cmd = webSocketMethod.value();
                MethodInvoke methodInvoke = webSocketMethodMap.get(cmd);
                if (methodInvoke != null) {
                    throw new RuntimeException("WebSocket命令冲突，cmd：" + cmd + "，冲突方法：" + methodInvoke.getMethod() + " | " + method);
                }
                webSocketMethodMap.put(cmd, new MethodInvoke(method, object));
            }
        }
    }

    @Autowired
    private JsonKit jsonKit;

    private static final String KEY = "@";

    private static final Map<String, WebSocketSession> webSocketSessions = new ConcurrentHashMap<>();


    /**
     * WebSocket链接建立后触发的方法
     */
    @OnOpen
    public void onOpen(@PathParam("token") String token, Session session) throws Exception {
        log.info("[WebSocket链接]建立链接，sessionId:{}，token:{}", session.getId(), token);
        webSocketSessions.put(session.getId(), new WebSocketSession(token, session));
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
        if (index <= 0) {
            // 关键字符在首位也是错误的数据
            return;
        }
        try {
            int cmd = Integer.parseInt(message.substring(0, index));
            String data = message.substring(index + 1);
            MethodInvoke methodInvoke = webSocketMethodMap.get(cmd);
            if (methodInvoke != null) {
                Object object = methodInvoke.invoke(data);
                if (object != null) {
                    String response = buildMessage(cmd, object);
                    session.getAsyncRemote().sendText(response);
                }
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
     * @param cmd       cmdId
     * @param data      消息内容
     * @param sessionId 指定发送客户端链接id
     */
    public <T> void sendMessageSingle(int cmd, T data, String sessionId) {
        WebSocketSession webSocketSession = webSocketSessions.get(sessionId);
        if (webSocketSession == null) {
            return;
        }
        Session session = webSocketSession.session();
        if (session != null && session.isOpen()) {
            String message = buildMessage(cmd, data);
            session.getAsyncRemote().sendText(message);
        }
    }

    /**
     * 给所有客户端发送消息
     *
     * @param cmd  cmdId
     * @param data 消息内容
     */
    public <T> void sendMessageAll(int cmd, T data) {
        String message = buildMessage(cmd, data);
        for (Map.Entry<String, WebSocketSession> entry : webSocketSessions.entrySet()) {
            WebSocketSession webSocketSession = entry.getValue();
            Session session = webSocketSession.session();
            if (session != null && session.isOpen()) {
                session.getAsyncRemote().sendText(message);
            }
        }
    }


    private <T> String buildMessage(int cmd, T data) {
        return cmd + KEY + jsonKit.toJson(data);
    }


    private record WebSocketSession(String token, Session session) {
    }

}
