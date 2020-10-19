package com.zero.sys.server.websocket;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.zero.sys.server.domain.Cpu;
import com.zero.sys.server.domain.Jvm;
import com.zero.sys.server.domain.Mem;
import com.zero.sys.server.domain.ServerPieChart;
import com.zero.sys.server.util.OshiUtils;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.ObjectUtils;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import javax.websocket.*;
import javax.websocket.server.ServerEndpoint;
import java.io.IOException;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

/**
 * 注意：@ServerEndpoint注解中的路径，必须以/开头，否则在项目启动的时候，
 * 会报java.lang.IllegalStateException: Failed to register @ServerEndpoint class异常信息
 *
 * @author herenpeng
 * @since 2020-10-18 11:32
 */
@Slf4j
@Component
@EnableScheduling
@ServerEndpoint("/websocket/server/piechart")
public class ServerWebSocket {

    public static Map<String, Session> webSocketClients = new ConcurrentHashMap<>();

    private ObjectMapper objectMapper = new ObjectMapper();

    /**
     * WebSocket连接建立后触发的方法
     */
    @OnOpen
    public void onOpen(Session session) throws Exception {
        webSocketClients.put(session.getId(), session);
        sendServerPieChartInfo();
    }

    /**
     * 连接关闭后触发的方法
     */
    @OnClose
    public void onClose(Session session) {
        // 将对应的客户端删除
        webSocketClients.remove(session.getId());
    }

    /**
     * 接收到客户端消息时触发的方法
     */
    @OnMessage
    public void onMessage(String message, Session session) throws Exception {

    }

    /**
     * 发生错误时触发的方法
     */
    @OnError
    public void onError(Session session, Throwable error) {
        log.error("[WebSocket连接]系统建立WebSocket连接发生错误");
        error.printStackTrace();
    }

    /**
     * 给单个客户端发送消息
     *
     * @param message
     * @param sessionId
     * @throws IOException
     */
    public void sendMessageSingle(String message, String sessionId) throws IOException {
        Session session = webSocketClients.get(sessionId);
        if (ObjectUtils.allNotNull(session) || session.isOpen()) {
            session.getAsyncRemote().sendText(message);
        }
    }

    /**
     * 给所有客户端发送消息
     *
     * @param message
     * @throws IOException
     */
    public void sendMessageAll(String message) throws IOException {
        if (webSocketClients.size() > 0) {
            for (Map.Entry<String, Session> entry : webSocketClients.entrySet()) {
                Session session = entry.getValue();
                if (ObjectUtils.allNotNull(session) || session.isOpen()) {
                    session.getAsyncRemote().sendText(message);
                }
            }
        }
    }


    @Scheduled(fixedDelay = 1000)
    public void serverPieChartTask() throws Exception {
        if (webSocketClients.size() > 0) {
            sendServerPieChartInfo();
        }
    }

    /**
     * 推送服务器饼图信息到前台页面
     *
     * @throws Exception
     */
    private void sendServerPieChartInfo() throws Exception {
        Cpu cpu = OshiUtils.getCpuInfo();
        Mem mem = OshiUtils.getMenInfo();
        Jvm jvm = OshiUtils.getJvmInfo();
        ServerPieChart pieChart = new ServerPieChart(cpu, mem, jvm);
        sendMessageAll(objectMapper.writeValueAsString(pieChart));
    }

}
