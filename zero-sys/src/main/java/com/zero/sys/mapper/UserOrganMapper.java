package com.zero.sys.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.zero.auth.entity.User;
import com.zero.sys.entity.UserOrgan;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @author herenpeng
 * @since 2023-09-04 21:18
 */
@Mapper
@Repository
public interface UserOrganMapper extends BaseMapper<UserOrgan> {

    /**
     * 获取组织机构中的所有用户信息
     *
     * @param organId 组织机构Id
     * @return
     * @throws Exception
     */
    List<User> getUserByOrganId(@Param("organId") Integer organId) throws Exception;

}
