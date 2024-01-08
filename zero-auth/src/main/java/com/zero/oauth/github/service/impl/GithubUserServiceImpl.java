package com.zero.oauth.github.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.zero.common.base.service.impl.BaseServiceImpl;
import com.zero.common.kit.ExcelKit;
import com.zero.oauth.github.entity.GithubUser;
import com.zero.oauth.github.mapper.GithubUserMapper;
import com.zero.oauth.github.service.GithubUserService;
import jakarta.servlet.http.HttpServletResponse;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Github用户信息表业务逻辑层的实现类
 *
 * @author herenpeng
 * @since 2021-04-07 21:40
 */
@Slf4j
@RequiredArgsConstructor
@Service
@Transactional(rollbackFor = Exception.class)
public class GithubUserServiceImpl extends BaseServiceImpl<GithubUserMapper, GithubUser> implements GithubUserService {

    @Override
    public IPage<GithubUser> page(Integer currentPage, Integer size, GithubUser queryGithubUser) throws Exception {
        IPage<GithubUser> page = new Page<>(currentPage, size);
        QueryWrapper<GithubUser> queryWrapper = new QueryWrapper<>(queryGithubUser);
        return baseMapper.selectPage(page, queryWrapper);
    }


    private IPage<GithubUser> page(Integer currentPage, Integer size, GithubUser queryGithubUser, Boolean deleted) throws Exception {
        queryGithubUser.setDeleted(deleted);
        IPage<GithubUser> page = new Page<>(currentPage, size);
        QueryWrapper<GithubUser> queryWrapper = new QueryWrapper<>(queryGithubUser);
        IPage<GithubUser> pageInfo = baseMapper.selectPage(page, queryWrapper);
        return pageInfo;
    }

    @Override
    public List<GithubUser> list(GithubUser queryGithubUser) throws Exception {
        QueryWrapper<GithubUser> queryWrapper = new QueryWrapper<>(queryGithubUser);
        return baseMapper.selectList(queryWrapper);
    }

    @Override
    public IPage<GithubUser> recoverPage(Integer currentPage, Integer size, GithubUser queryGithubUser) throws Exception {
        return page(currentPage, size, queryGithubUser, true);
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
    public void exportExcel(GithubUser queryGithubUser, HttpServletResponse response) throws Exception {
        List<GithubUser> exportData = list(queryGithubUser);
        ExcelKit.exportExcel("Github用户信息表", GithubUser.class, exportData, response);
    }

}