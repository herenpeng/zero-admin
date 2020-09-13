package com.zero.sys.service.impl;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.zero.sys.domain.User;
import com.zero.sys.mapper.UserMapper;
import com.zero.sys.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * 用户业务逻辑层的实现类
 * @author herenpeng
 * @since 2020-09-07 19:20
 */
@Service
@Transactional(rollbackFor = Exception.class)
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper userMapper;

    @Override
    public IPage<User> page(Integer currentPage, Integer size) throws Exception {
        IPage page = new Page(currentPage, size);
        return userMapper.getPage(page);
    }


}
