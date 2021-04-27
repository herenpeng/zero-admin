package com.zero.sys.service.impl;

import com.zero.common.http.domain.WeatherInfo;
import com.zero.common.http.util.WeatherUtils;
import com.zero.sys.service.IndexService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.HttpServletRequest;

/**
 * 系统首页的业务层接口实现
 *
 * @author herenpeng
 * @since 2021-04-27 21:26
 */
@Slf4j
@RequiredArgsConstructor
@Service
@Transactional(rollbackFor = Exception.class)
public class IndexServiceImpl implements IndexService {

    private final WeatherUtils weatherUtils;

    @Override
    public WeatherInfo.Data weather(HttpServletRequest request) throws Exception {
        WeatherInfo weatherInfo = weatherUtils.getWeatherInfo(request);
        return weatherInfo.getData();
    }

}
