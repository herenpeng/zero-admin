package com.zero.sys.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.zero.sys.entity.ResourcesRole;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

/**
 * 系统资源和角色关系表
 *
 * @author herenpeng
 * @since 2020-10-20 22:44
 */
@Mapper
@Repository
public interface ResourcesRoleMapper extends BaseMapper<ResourcesRole> {

    /**
     * 删除所有的系统资源和角色之间的关系
     *
     * @throws Exception
     */
    @Delete("delete from sys_resources_role")
    void deleteAll() throws Exception;
}
