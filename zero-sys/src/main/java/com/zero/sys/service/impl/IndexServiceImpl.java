package com.zero.sys.service.impl;

import com.zero.auth.mapper.ResourcesMapper;
import com.zero.auth.mapper.UserMapper;
import com.zero.common.http.domain.WeatherInfo;
import com.zero.common.http.kit.WeatherKit;
import com.zero.common.kit.DateKit;
import com.zero.sys.mapper.IndexMapper;
import com.zero.sys.pojo.dto.ResourcesData;
import com.zero.sys.pojo.dto.UserData;
import com.zero.sys.pojo.vo.IndexChart;
import com.zero.sys.pojo.vo.LoginMap;
import com.zero.sys.service.IndexService;
import jakarta.servlet.http.HttpServletRequest;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.ObjectUtils;

import java.util.*;
import java.util.stream.Collectors;

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

    private final IndexMapper indexMapper;

    private final WeatherKit weatherKit;

    private final UserMapper userMapper;

    private final ResourcesMapper resourcesMapper;

    @Override
    public WeatherInfo.Data weather(HttpServletRequest request) throws Exception {
        WeatherInfo weatherInfo = weatherKit.getWeatherInfo(request);
        return ObjectUtils.isEmpty(weatherInfo) ? null : weatherInfo.getData();
    }

    @Override
    public IndexChart indexChart() throws Exception {
        List<String> xAxis = generateLineChartTimeAxis();
        IndexChart.UserChart userChart = getUserChart(xAxis);
        IndexChart.ResourcesChart resourcesChart = generateResourcesChart(xAxis);
        IndexChart indexChart = new IndexChart();
        indexChart.setUserChart(userChart);
        indexChart.setResourcesChart(resourcesChart);
        return indexChart;
    }


    private IndexChart.UserChart getUserChart(List<String> xAxis) throws Exception {
        Long userNum = userMapper.selectCount(null);
        List<UserData> userDatas = indexMapper.selectUserData();
        Map<String, UserData> map = userDatas.stream().collect(Collectors.toMap(UserData::getTime, v -> v));
        List<Long> loginUserNum = new ArrayList<>();
        List<Long> loginNum = new ArrayList<>();
        for (String time : xAxis) {
            UserData userData = map.get(time);
            if (userData == null) {
                loginUserNum.add(0L);
                loginNum.add(0L);
            } else {
                loginUserNum.add(userData.getLoginUserNum());
                loginNum.add(userData.getLoginNum());
            }
        }
        IndexChart.UserChart userChart = new IndexChart.UserChart();
        userChart.setNum(userNum);
        userChart.setXAxis(xAxis);
        Map<String, List<Long>> data = new LinkedHashMap<>();
        data.put("登录用户数", loginUserNum);
        data.put("登录用户次数", loginNum);
        userChart.setData(data);
        return userChart;
    }


    private IndexChart.ResourcesChart generateResourcesChart(List<String> xAxis) throws Exception {
        Long resourcesNum = resourcesMapper.selectCount(null);
        List<ResourcesData> resourcesDatas = indexMapper.selectResourcesData();
        Map<String, ResourcesData> map = resourcesDatas.stream().collect(Collectors.toMap(ResourcesData::getTime, v -> v));
        List<Long> accessNum = new ArrayList<>();
        List<Long> consumeTime = new ArrayList<>();
        for (String time : xAxis) {
            ResourcesData resourcesData = map.get(time);
            if (resourcesData == null) {
                accessNum.add(0L);
                consumeTime.add(0L);
            } else {
                accessNum.add(resourcesData.getAccessNum());
                consumeTime.add(resourcesData.getConsumeTime());
            }
        }
        IndexChart.ResourcesChart resourcesChart = new IndexChart.ResourcesChart();
        resourcesChart.setNum(resourcesNum);
        resourcesChart.setXAxis(xAxis);
        Map<String, List<Long>> data = new LinkedHashMap<>();
        data.put("访问次数", accessNum);
        data.put("访问耗时", consumeTime);
        resourcesChart.setData(data);
        return resourcesChart;
    }

    private List<String> generateLineChartTimeAxis() {
        List<String> timeAxis = new ArrayList<>();
        long now = DateKit.now();
        long time = now - DateKit.HOUR;
        while (time < now) {
            timeAxis.add(DateKit.format(time, DateKit.MINUTE_PATTERN));
            time += DateKit.MINUTE;
        }
        return timeAxis;
    }


    @Override
    public List<LoginMap> loginMap() throws Exception {
        return indexMapper.loginMap();
    }

}
