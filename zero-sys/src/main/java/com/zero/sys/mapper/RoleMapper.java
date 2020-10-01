package com.zero.sys.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.zero.sys.domain.Role;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * 角色的Mapper接口
 * @author herenpeng
 * @since 2020-09-07 22:34
 */
@Repository
public interface RoleMapper extends BaseMapper<Role> {

    /**
     * 通过用户主键信息获取该用户所有的角色，需要关联中间表sys_user_role
     * @param userId
     * @return
     * @throws Exception
     */
    List<Role> getByUserId(@Param("userId") Integer userId) throws Exception;

}
