package com.zero.sys.websocket;

import com.zero.common.enums.WebSocketEventEnum;
import com.zero.common.websocket.AppWebSocket;
import com.zero.sys.kit.OshiKit;
import com.zero.sys.vo.Cpu;
import com.zero.sys.vo.Jvm;
import com.zero.sys.vo.Mem;
import com.zero.sys.vo.ServerPieChart;
import jakarta.annotation.PostConstruct;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

/**
 * @author herenpeng
 * @since 2020-10-18 11:32
 */
@Slf4j
@RequiredArgsConstructor
@Component
public class ServerWebSocket {

    private final AppWebSocket appWebSocket;

    @PostConstruct
    public void init() {
        // 注册接收到消息后的处理事件
        appWebSocket.register(WebSocketEventEnum.SERVER, (message) -> {
            log.info("{}", message);
        });
    }

    @Scheduled(fixedDelay = 1000)
    public void serverPieChartTask() throws Exception {
        if (appWebSocket.isEmpty()) {
            return;
        }
        sendServerPieChartInfo();
    }

    /**
     * 推送服务器饼图信息到前台页面
     */
    private void sendServerPieChartInfo() {
        Cpu cpu = OshiKit.getCpuInfo();
        Mem mem = OshiKit.getMemInfo();
        Jvm jvm = OshiKit.getJvmInfo();
        ServerPieChart pieChart = new ServerPieChart(cpu, mem, jvm);
        appWebSocket.sendMessageAll(WebSocketEventEnum.SERVER.getValue(), pieChart);
    }


}
