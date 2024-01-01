package com.zero.sys.mapper;

import com.zero.sys.vo.LoginMap;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @author herenpeng
 * @since 2021-04-28 23:34
 */
@Mapper
@Repository
public interface IndexMapper {

    /**
     * 获取系统首页的用户登录地图数据
     *
     * @return 用户登录地图数据
     */
    @Select("select region as name,count(distinct user_id) as user,count(id) as value from auth_login_log group by region")
    List<LoginMap> loginMap();

}
