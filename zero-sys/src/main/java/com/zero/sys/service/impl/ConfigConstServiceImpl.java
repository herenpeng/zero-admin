package com.zero.sys.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.zero.auth.kit.TokenKit;
import com.zero.common.base.service.impl.BaseServiceImpl;
import com.zero.common.exception.AppException;
import com.zero.common.exception.AppExceptionEnum;
import com.zero.common.kit.ExcelKit;
import com.zero.sys.entity.ConfigConst;
import com.zero.sys.entity.UserConfig;
import com.zero.sys.mapper.ConfigConstMapper;
import com.zero.sys.mapper.UserConfigMapper;
import com.zero.sys.service.ConfigConstService;
import jakarta.servlet.http.HttpServletResponse;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.ObjectUtils;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 系统配置常量表业务逻辑层的实现类
 *
 * @author herenpeng
 * @since 2021-06-05 22:29
 */
@Slf4j
@RequiredArgsConstructor
@Service
@Transactional(rollbackFor = Exception.class)
public class ConfigConstServiceImpl extends BaseServiceImpl<ConfigConstMapper, ConfigConst> implements ConfigConstService {

    private final UserConfigMapper userConfigMapper;

    private final TokenKit tokenKit;

    @Override
    public IPage<ConfigConst> page(Integer currentPage, Integer size, ConfigConst queryConfigConst) throws Exception {
        return page(currentPage, size, queryConfigConst, false);
    }


    private IPage<ConfigConst> page(Integer currentPage, Integer size, ConfigConst queryConfigConst, Boolean deleted) throws Exception {
        queryConfigConst.setDeleted(deleted);
        IPage<ConfigConst> page = new Page<>(currentPage, size);
        return baseMapper.getPage(page, queryConfigConst);
    }

    @Override
    public List<ConfigConst> list(ConfigConst queryConfigConst) throws Exception {
        QueryWrapper<ConfigConst> queryWrapper = new QueryWrapper<>(queryConfigConst);
        List<ConfigConst> configConstList = baseMapper.selectList(queryWrapper);
        return configConstList;
    }

    @Override
    public List<String> getKeyList(String key, Boolean userable) throws Exception {
        return baseMapper.getKeyList(key, userable);
    }

    @Override
    public String getByKey(String key) throws Exception {
        ConfigConst configConst = baseMapper.getByKey(key);
        if (ObjectUtils.isEmpty(configConst)) {
            log.error("[系统配置业务层]系统配置的KEY值：{}不存在", key);
            throw new AppException(AppExceptionEnum.CONFIG_KEY_NOT_EXIST);
        }
        if (configConst.getUserable()) {
            log.debug("系统配置的KEY值：{}允许用户自定义配置，检查用户自定义配置", key);
            Integer userId = tokenKit.getUserId(request);
            UserConfig userConfig = userConfigMapper.getByUserIdAndConfigId(userId, configConst.getId());
            if (!ObjectUtils.isEmpty(userConfig)) {
                log.debug("系统配置的KEY值：{}允许用户自定义配置，用户自定义配置id为：{}，配置值为：{}", key, userConfig.getId(), userConfig.getValue());
                return userConfig.getValue();
            }
        }
        return configConst.getDefaultValue();
    }

    @Override
    public Map<String, String> getByKeys(List<String> keys) throws Exception {
        Map<String, String> map = new HashMap<>();
        for (String key : keys) {
            String value = getByKey(key);
            map.put(key, value);
        }
        return map;
    }


    @Override
    public IPage<ConfigConst> recoverPage(Integer currentPage, Integer size, ConfigConst queryConfigConst) throws Exception {
        return page(currentPage, size, queryConfigConst, true);
    }

    @Override
    public void recover(Integer id) throws Exception {
        baseMapper.recoverById(id);
    }

    @Override
    public void recoverDelete(Integer id) throws Exception {
        baseMapper.recoverDelete(id);
    }

    @Override
    public void exportExcel(ConfigConst queryConfigConst, HttpServletResponse response) throws Exception {
        List<ConfigConst> exportData = list(queryConfigConst);
        ExcelKit.exportExcel("系统配置常量表", ConfigConst.class, exportData, response);
    }

}