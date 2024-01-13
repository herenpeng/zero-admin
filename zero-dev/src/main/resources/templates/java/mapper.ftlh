package ${javaPackageName}.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import ${javaPackageName}.entity.${entityName};
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * ${comment}的Mapper接口
 *
 * @author ${codeAuthor}
 * @since ${.now?string("yyyy-MM-dd HH:mm")}
 */
@Mapper
@Repository
public interface ${entityName}Mapper extends BaseMapper<${entityName}> {

    /**
     * 分页查询${comment}数据，区别于selectPage的是，该方法添加了查询条件
     *
     * @param page      分页查询
     * @param query${entityName} ${entityName}查询条件
     * @return ${entityName}集合
     * @throws Exception 抛出异常
     */
    IPage<${entityName}> getPage(IPage<${entityName}> page, @Param("query${entityName}") ${entityName} query${entityName}) throws Exception;

    /**
     * 获取所有的${comment}数据，区别于selectList的是，该方法添加了查询条件
     *
     * @param query${entityName} ${entityName}查询条件
     * @return ${entityName}集合
     * @throws Exception 抛出异常
     */
    List<${entityName}> getList(@Param("query${entityName}") ${entityName} query${entityName}) throws Exception;

    <#if tree>
    /**
     * 通过父节点主键，获取节点的所有子节点${comment}数据
     *
     * @param parentId 父节点主键Id
     * @return 节点的所有子节点${comment}数据
     * @throws Exception 抛出异常
     */
    List<${entityName}> getByParentId(@Param("parentId") Integer parentId) throws Exception;
    </#if>

    /**
     * 通过主键恢复逻辑删除的${comment}数据
     *
     * @param id ${comment}主键
     * @throws Exception 抛出异常
     */
    @Update("update ${name} set deleted = 0 where id = ${"#"}{id}")
    void recoverById(@Param("id") Integer id) throws Exception;

    /**
     * 回收站删除，通过${comment}主键彻底删除${comment}数据
     *
     * @param id ${comment}主键
     * @throws Exception 抛出异常
     */
    @Delete("delete from ${name} where id = ${"#"}{id}")
    void recoverDelete(@Param("id") Integer id) throws Exception;

}
