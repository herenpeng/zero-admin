package com.zero.sys.websocket;

import com.zero.common.websocket.WebSocketController;
import com.zero.common.websocket.WebSocketMethod;
import com.zero.common.websocket.WebSocketCmd;
import com.zero.common.websocket.AppWebSocket;
import com.zero.sys.kit.OshiKit;
import com.zero.sys.pojo.vo.ServerChart;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.scheduling.annotation.Scheduled;

/**
 * @author herenpeng
 * @since 2020-10-18 11:32
 */
@Slf4j
@RequiredArgsConstructor
@WebSocketController
public class ServerWebSocket {

    private final AppWebSocket appWebSocket;


    @WebSocketMethod(WebSocketCmd.SERVER)
    public void server(String message) {
        log.info("{}", message);
    }


    @Scheduled(fixedDelay = 1000)
    public void ServerChartTask() throws Exception {
        if (appWebSocket.isEmpty()) {
            return;
        }
        ServerChart serverChart = OshiKit.getServerChart();
        appWebSocket.sendMessageAll(WebSocketCmd.SERVER, serverChart);
    }


}
