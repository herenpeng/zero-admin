package com.zero.sys.service;

import com.zero.common.http.domain.WeatherInfo;

import javax.servlet.http.HttpServletRequest;

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

}
