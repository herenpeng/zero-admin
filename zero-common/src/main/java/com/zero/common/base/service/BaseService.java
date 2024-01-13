package com.zero.common.base.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.zero.common.base.entity.BaseEntity;

/**
 * Service接口的通用接口
 *
 * @author herenpeng
 * @since 2020-10-30 22:05
 */
public interface BaseService<E extends BaseEntity> extends IService<E> {
}
