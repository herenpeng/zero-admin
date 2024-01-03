package com.zero.sys.controller;

import com.zero.common.annotation.LogOperation;
import com.zero.common.http.domain.WeatherInfo;
import com.zero.common.domain.ResponseEntity;
import com.zero.sys.service.IndexService;
import com.zero.sys.vo.LoginMap;
import com.zero.sys.vo.PanelGroup;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.servlet.http.HttpServletRequest;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * 系统首页的操作接口
 *
 * @author herenpeng
 * @since 2021-04-27 21:21
 */
@Tag(description = "系统首页操作接口", name = "IndexController")
@RequiredArgsConstructor
@RestController
@RequestMapping("index")
public class IndexController {

    private final IndexService indexService;

    @LogOperation
    @Operation(description = "获取当前城市的天气预报信息")
    @GetMapping("weather")
    public ResponseEntity<WeatherInfo.Data> weather(HttpServletRequest request) throws Exception {
        WeatherInfo.Data data = indexService.weather(request);
        return ResponseEntity.ok(data);
    }

    @LogOperation
    @Operation(description = "获取系统首页的展示数据")
    @GetMapping("panel/group")
    public ResponseEntity<PanelGroup> panelGroup() throws Exception {
        PanelGroup panelGroup = indexService.panelGroup();
        return ResponseEntity.ok(panelGroup);
    }

    @LogOperation
    @Operation(description = "获取系统首页的用户登录地图数据")
    @GetMapping("login/map")
    public ResponseEntity<List<LoginMap>> loginMap() throws Exception {
        List<LoginMap> list = indexService.loginMap();
        return ResponseEntity.ok(list);
    }

}