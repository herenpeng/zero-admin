package com.zero.oauth.github.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.zero.oauth.github.entity.GithubUser;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Github用户信息表的Mapper接口
 *
 * @author herenpeng
 * @since 2021-04-07 21:40
 */
@Mapper
@Repository
public interface GithubUserMapper extends BaseMapper<GithubUser> {

    /**
     * 分页查询Github用户信息表数据，区别于selectPage的是，该方法添加了查询条件
     *
     * @param page            分页查询
     * @param queryGithubUser GithubUser查询条件
     * @return GithubUser集合
     * @throws Exception 抛出异常
     */
    IPage<GithubUser> getPage(IPage page, @Param("queryGithubUser") GithubUser queryGithubUser) throws Exception;

    /**
     * 获取所有的Github用户信息表数据，区别于selectList的是，该方法添加了查询条件
     *
     * @param queryGithubUser GithubUser查询条件
     * @return GithubUser集合
     * @throws Exception 抛出异常
     */
    List<GithubUser> getList(@Param("queryGithubUser") GithubUser queryGithubUser) throws Exception;

    /**
     * 分页查询逻辑删除的Github用户信息表数据
     *
     * @param page            分页查询
     * @param queryGithubUser GithubUser查询条件
     * @return GithubUser集合
     * @throws Exception 抛出异常
     */
    IPage<GithubUser> getRecoverPage(IPage page, @Param("queryGithubUser") GithubUser queryGithubUser) throws Exception;

    /**
     * 通过主键恢复逻辑删除的Github用户信息表数据
     *
     * @param id Github用户信息表主键
     * @throws Exception 抛出异常
     */
    @Update("update oauth_github_user set deleted = 0 where id = #{id}")
    void recoverById(@Param("id") Integer id) throws Exception;

    /**
     * 回收站删除，通过Github用户信息表主键彻底删除Github用户信息表数据
     *
     * @param id Github用户信息表主键
     * @throws Exception 抛出异常
     */
    @Delete("delete from oauth_github_user where id = #{id}")
    void recoverDelete(@Param("id") Integer id) throws Exception;

    /**
     * 通过github用户主键获取用户的本地主键
     *
     * @param githubId github用户主键
     * @return GithubUser 用户的本地主键
     * @throws Exception 抛出异常
     */
    @Select("select * from oauth_github_user where github_id = #{githubId}")
    GithubUser selectByGithubId(@Param("githubId") Integer githubId) throws Exception;

}
