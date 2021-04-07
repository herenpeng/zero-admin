package com.zero.oauth.github.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.zero.common.base.service.BaseService;
import com.zero.oauth.github.entity.GithubUser;

import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * Github用户信息表业务逻辑层接口
 *
 * @author herenpeng
 * @since 2021-04-07 21:40
 */
public interface GithubUserService extends BaseService<GithubUser> {

    /**
     * 分页查询Github用户信息表数据
     *
     * @param currentPage 当前页面数，页面从1开始
     * @param size        当前页的大小，默认为10
     * @param queryGithubUser   查询Github用户信息表的条件
     * @return 分页查询所有的Github用户信息表数据
     * @throws Exception 抛出异常
     */
    IPage<GithubUser> page(Integer currentPage, Integer size, GithubUser queryGithubUser) throws Exception;

    /**
     * 查询所有的Github用户信息表数据
     *
     * @param queryGithubUser   查询Github用户信息表的条件
     * @return 查询所有的Github用户信息表数据
     * @throws Exception 抛出异常
     */
    List<GithubUser> list(GithubUser queryGithubUser) throws Exception;

    /**
     * 分页查询逻辑删除的Github用户信息表数据
     *
     * @param currentPage 当前页面数，页面从1开始
     * @param size        当前页的大小，默认为10
     * @param queryGithubUser   查询Github用户信息表的条件
     * @return 分页查询逻辑删除的Github用户信息表数据
     * @throws Exception 抛出异常
     */
    IPage<GithubUser> recoverPage(Integer currentPage, Integer size, GithubUser queryGithubUser) throws Exception;

    /**
     * 通过主键恢复逻辑删除的Github用户信息表数据
     *
     * @param id Github用户信息表主键
     * @throws Exception 抛出异常
     */
    void recover(Integer id) throws Exception;

    /**
     * 回收站删除，通过Github用户信息表主键彻底删除Github用户信息表数据
     *
     * @param id Github用户信息表主键
     * @throws Exception 抛出异常
     */
    void recoverDelete(Integer id) throws Exception;

    /**
     * 导出Github用户信息表列表数据的Excel文件
     *
     * @param queryGithubUser 查询Github用户信息表的条件
     * @param response  HttpServletResponse对象
     * @throws Exception 抛出异常
     */
    void exportExcel(GithubUser queryGithubUser, HttpServletResponse response) throws Exception;

}
