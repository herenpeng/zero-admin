package ${javaPackageName}.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.zero.common.base.service.BaseService;
import ${javaPackageName}.entity.${entityName};
import jakarta.servlet.http.HttpServletResponse;

import java.util.List;

/**
 * ${comment}业务逻辑层接口
 *
 * @author ${codeAuthor}
 * @since ${.now?string("yyyy-MM-dd HH:mm")}
 */
public interface ${entityName}Service extends BaseService<${entityName}> {

    /**
     * 分页查询${comment}数据
     *
     * @param currentPage 当前页面数，页面从1开始
     * @param size        当前页的大小，默认为10
     * @param query${entityName}   查询${comment}的条件
     * @return 分页查询所有的${comment}数据
     * @throws Exception 抛出异常
     */
    IPage<${entityName}> page(Integer currentPage, Integer size, ${entityName} query${entityName}) throws Exception;

    /**
     * 查询所有的${comment}数据
     *
     * @param query${entityName} 查询${comment}的条件
     * @return 查询所有的${comment}数据
     * @throws Exception 抛出异常
     */
    List<${entityName}> list(${entityName} query${entityName}) throws Exception;

    <#if tree>
    /**
     * 查询${comment}数据并构建树状结构
     *
     * @return 查询${comment}数据并构建树状结构
     * @throws Exception 抛出异常
     */
    List<${entityName}> tree() throws Exception;


    /**
     * 移动${comment}树状结构节点
     *
     * @param ${entityName?uncap_first} ${comment}树状结构节节点
     * @throws Exception 抛出异常
     */
     void move(${entityName} ${entityName?uncap_first}) throws Exception;
    </#if>

    /**
     * 分页查询逻辑删除的${comment}数据
     *
     * @param currentPage 当前页面数，页面从1开始
     * @param size        当前页的大小，默认为10
     * @param query${entityName}  查询${comment}的条件
     * @return 分页查询逻辑删除的${comment}数据
     * @throws Exception 抛出异常
     */
    IPage<${entityName}> recoverPage(Integer currentPage, Integer size, ${entityName} query${entityName}) throws Exception;

    /**
     * 通过主键恢复逻辑删除的${comment}数据
     *
     * @param id ${comment}主键
     * @throws Exception 抛出异常
     */
    void recover(Integer id) throws Exception;

    /**
     * 回收站删除，通过${comment}主键彻底删除${comment}数据
     *
     * @param id ${comment}主键
     * @throws Exception 抛出异常
     */
    void recoverDelete(Integer id) throws Exception;

    /**
     * 导出${comment}列表数据的Excel文件
     *
     * @param query${entityName} 查询${comment}的条件
     * @param response  HttpServletResponse对象
     * @throws Exception 抛出异常
     */
    void exportExcel(${entityName} query${entityName}, HttpServletResponse response) throws Exception;

}
