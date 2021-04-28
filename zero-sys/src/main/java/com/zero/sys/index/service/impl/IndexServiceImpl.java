package com.zero.sys.index.service.impl;

import com.zero.auth.mapper.LoginLogMapper;
import com.zero.auth.mapper.UserMapper;
import com.zero.common.http.domain.WeatherInfo;
import com.zero.common.http.util.WeatherUtils;
import com.zero.sys.index.mapper.IndexMapper;
import com.zero.sys.index.service.IndexService;
import com.zero.sys.index.vo.LoginMap;
import com.zero.sys.index.vo.PanelGroup;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

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

    private final WeatherUtils weatherUtils;

    private final UserMapper userMapper;

    private final LoginLogMapper loginLogMapper;

    @Override
    public WeatherInfo.Data weather(HttpServletRequest request) throws Exception {
        WeatherInfo weatherInfo = weatherUtils.getWeatherInfo(request);
        return weatherInfo.getData();
    }

    @Override
    public PanelGroup panelGroup() throws Exception {
        PanelGroup panelGroup = new PanelGroup();
        Integer user = userMapper.selectCount(null);
        Integer access = loginLogMapper.selectCount(null);
        panelGroup.setUser(user);
        panelGroup.setAccess(access);
        return panelGroup;
    }

    @Override
    public List<LoginMap> loginMap() throws Exception {
        return indexMapper.loginMap();
    }

}
