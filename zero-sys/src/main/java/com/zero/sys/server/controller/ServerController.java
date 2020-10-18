package com.zero.sys.server.controller;

import com.zero.common.response.domain.ResponseData;
import com.zero.sys.server.domain.*;
import com.zero.sys.server.util.OshiUtils;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author herenpeng
 * @since 2020-10-12 8:27
 */
@Api(value = "系统信息操作接口", tags = "ServerController")
@RestController
@RequestMapping("server")
public class ServerController {

    @ApiOperation(value = "获取系统服务器的CPU，内存，JVM饼图信息")
    @GetMapping("piechart")
    public ResponseData<ServerPieChart> getServerPirChartInfo() throws Exception {
        Cpu cpu = OshiUtils.getCpuInfo();
        Mem mem = OshiUtils.getMenInfo();
        Jvm jvm = OshiUtils.getJvmInfo();
        ServerPieChart serverPieChart = new ServerPieChart(cpu, mem, jvm);
        return ResponseData.ok(serverPieChart);
    }


    @ApiOperation(value = "获取系统服务器的监控信息")
    @GetMapping("/info")
    public ResponseData<Server> getInfo() throws Exception {
        Server server = new Server();
        server.copyTo();
        return ResponseData.ok(server);
    }


}
