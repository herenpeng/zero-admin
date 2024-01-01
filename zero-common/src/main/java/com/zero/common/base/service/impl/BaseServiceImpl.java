package com.zero.common.base.service.impl;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * Service接口的通用接口的实现
 *
 * @author herenpeng
 * @since 2020-10-30 22:06
 */
public class BaseServiceImpl<M extends BaseMapper<T>, T> extends ServiceImpl<M, T> {

    @Autowired
    protected HttpServletRequest request;

}
