package com.zero.sys.service;

import com.zero.common.http.domain.WeatherInfo;
import com.zero.sys.pojo.vo.IndexChart;
import com.zero.sys.pojo.vo.LoginMap;
import jakarta.servlet.http.HttpServletRequest;

import java.util.List;

/**
 * 系统首页的业务层接口
 *
 * @author herenpeng
 * @since 2021-04-27 21:25
 */
public interface IndexService {

    /**
     * 获取当前城市的天气预报信息
     *
     * @param request HttpServletRequest 对象
     * @return 当前城市的天气预报信息
     * @throws Exception 抛出异常
     */
    WeatherInfo.Data weather(HttpServletRequest request) throws Exception;

    /**
     * 获取系统首页的展示数据
     *
     * @return 系统首页的展示数据
     * @throws Exception 抛出异常
     */
    IndexChart indexChart() throws Exception;

    /**
     * 获取系统首页的用户登录地图数据
     *
     * @return 系统首页的用户登录地图数据
     * @throws Exception 抛出异常
     */
    List<LoginMap> loginMap() throws Exception;
}
