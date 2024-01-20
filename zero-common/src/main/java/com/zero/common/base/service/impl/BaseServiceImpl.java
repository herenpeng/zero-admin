package com.zero.common.base.service.impl;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.zero.common.base.entity.BaseEntity;
import com.zero.common.kit.JsonKit;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * Service接口的通用接口的实现
 *
 * @author herenpeng
 * @since 2020-10-30 22:06
 */
public class BaseServiceImpl<M extends BaseMapper<E>, E extends BaseEntity> extends ServiceImpl<M, E> {

    @Autowired
    protected HttpServletRequest request;

    @Autowired
    protected JsonKit jsonKit;

}
