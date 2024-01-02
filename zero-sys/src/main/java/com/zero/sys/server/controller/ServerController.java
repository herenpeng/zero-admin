package com.zero.sys.server.controller;

import com.zero.common.domain.ResponseEntity;
import com.zero.sys.server.util.OshiUtils;
import com.zero.sys.server.vo.*;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 该接口是使用异步轮询请求的方法请求后台数据，因为该方式性能较差，
 * 所以本系统使用的是WebSocket连接，具体参考ServerWebSocket的WebSocket接口
 * 但是如果浏览器不支持WebSocket连接，那么前端就会使用异步轮询请求该接口，以保证系统功能的正常运行
 *
 * @author herenpeng
 * @since 2020-10-12 8:27
 */
@Tag(description = "系统信息操作接口", name = "ServerController")
@RestController
@RequestMapping("server")
public class ServerController {

    @Operation(description = "获取系统服务器的CPU，内存，JVM饼图信息")
    @GetMapping("piechart")
    public ResponseEntity<ServerPieChart> getServerPirChartInfo() throws Exception {
        Cpu cpu = OshiUtils.getCpuInfo();
        Mem mem = OshiUtils.getMemInfo();
        Jvm jvm = OshiUtils.getJvmInfo();
        ServerPieChart serverPieChart = new ServerPieChart(cpu, mem, jvm);
        return ResponseEntity.ok(serverPieChart);
    }

    @Operation(description = "获取系统服务器的监控信息")
    @GetMapping("info")
    public ResponseEntity<Server> getInfo() throws Exception {
        Server server = new Server();
        server.copyTo();
        return ResponseEntity.ok(server);
    }


}
