package ${basePackageName}.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.zero.common.base.service.BaseService;
import ${basePackageName}.entity.${entityName};

/**
 * ${comment}业务逻辑层接口
 *
 * @author ${codeAuthor}
 * @since ${.now?string("yyyy-MM-dd HH:mm")}
 */
public interface ${entityName}Service extends BaseService<${entityName}> {

    /**
     * 分页查询用户数据
     *
     * @param currentPage 当前页面数，页面从1开始
     * @param size        当前页的大小，默认为10
     * @param query${entityName}   查询${entityName}的条件
     * @return 分页查询的所有${entityName}数据
     * @throws Exception 抛出异常
     */
    IPage<${entityName}> page(Integer currentPage, Integer size, ${entityName} query${entityName}) throws Exception;

}
