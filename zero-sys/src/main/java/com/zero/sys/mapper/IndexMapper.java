package com.zero.sys.mapper;

import com.zero.sys.pojo.dto.ResourcesData;
import com.zero.sys.pojo.dto.UserData;
import com.zero.sys.pojo.vo.LoginMap;
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


    @Select("SELECT DATE_FORMAT(login_time, '%Y-%m-%d %H:%i') as time, COUNT(1) as loginNum, count(distinct user_id) as loginUserNum " +
            "FROM auth_login_log where login_time >= DATE_SUB(NOW(), INTERVAL 1 DAY) " +
            "GROUP BY MINUTE(login_time) order by login_time")
    List<UserData> selectUserData() throws Exception;


    @Select("SELECT DATE_FORMAT(access_time, '%Y-%m-%d %H:%i') as time, COUNT(1) as accessNum, sum(execution_time) as consumeTime " +
            "FROM sys_operation_log where access_time >= DATE_SUB(NOW(), INTERVAL 1 DAY) " +
            "GROUP BY MINUTE(access_time) order by access_time")
    List<ResourcesData> selectResourcesData() throws Exception;

    /**
     * 获取系统首页的用户登录地图数据
     *
     * @return 用户登录地图数据
     */
    @Select("select region as name,count(distinct user_id) as user,count(id) as value from auth_login_log group by region")
    List<LoginMap> loginMap();

}
