package com.zero.sys.server.controller;

import com.zero.common.response.domain.ResponseData;
import com.zero.sys.server.domain.Server;
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
    public ResponseData getCpuInfo() {

        return ResponseData.ok();
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
