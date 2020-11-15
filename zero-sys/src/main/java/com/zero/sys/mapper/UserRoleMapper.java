package com.zero.sys.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.zero.sys.entity.UserRole;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

/**
 * 用户和角色之间的关系表
 *
 * @author herenpeng
 * @since 2020-10-09 22:37
 */
@Mapper
@Repository
public interface UserRoleMapper extends BaseMapper<UserRole> {

}
