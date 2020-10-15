package com.zero.sys.server.controller;

import com.zero.common.response.domain.ResponseData;
import com.zero.sys.server.domain.Cpu;
import com.zero.sys.server.domain.Jvm;
import com.zero.sys.server.domain.Mem;
import com.zero.sys.server.domain.Server;
import com.zero.sys.server.util.OshiUtils;
import io.swagger.annotations.Api;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 系统信息控制器，用于处理系统信息（如CPU，内存，JVM使用情况等等）
 *
 * @author herenpeng
 * @since 2020-10-12 8:27
 */
@Api(value = "系统信息操作接口", tags = "ServerController")
@RestController
@RequestMapping("server")
public class ServerController {

    @GetMapping("/cpu")
    public ResponseData<Cpu> getCpuInfo() throws Exception {
        Cpu cpu = OshiUtils.getCpuInfo();
        return ResponseData.ok(cpu);
    }

    @GetMapping("/mem")
    public ResponseData<Mem> getMenInfo() throws Exception {
        Mem men = OshiUtils.getMenInfo();
        return ResponseData.ok(men);
    }

    @GetMapping("/jvm")
    public ResponseData<Jvm> getJvmInfo() throws Exception {
        Jvm jvm = OshiUtils.getJvmInfo();
        return ResponseData.ok(jvm);
    }


    /**
     * 获取服务器监控信息
     * @return
     * @throws Exception
     */
    @GetMapping("/info")
    public ResponseData<Server> getInfo() throws Exception {
        Server server = new Server();
        server.copyTo();
        return ResponseData.ok(server);
    }


}
