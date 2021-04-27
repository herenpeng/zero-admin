package com.zero.sys.controller;

import com.zero.common.annotation.LogOperation;
import com.zero.common.http.domain.WeatherInfo;
import com.zero.common.response.domain.ResponseData;
import com.zero.sys.service.IndexService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;

/**
 * 系统首页的操作接口
 *
 * @author herenpeng
 * @since 2021-04-27 21:21
 */
@Api(value = "系统首页操作接口", tags = "IndexController")
@RequiredArgsConstructor
@RestController
@RequestMapping("index")
public class IndexController {

    private final IndexService indexService;

    @LogOperation
    @ApiOperation(value = "获取当前城市的天气预报信息")
    @GetMapping("weather")
    public ResponseData<WeatherInfo.Data> weather(HttpServletRequest request) throws Exception {
        WeatherInfo.Data data = indexService.weather(request);
        return ResponseData.ok(data);
    }


}
