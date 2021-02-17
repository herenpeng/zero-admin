package ${basePackageName}.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.zero.common.base.service.impl.BaseServiceImpl;
import ${basePackageName}.entity.${entityName};
import ${basePackageName}.mapper.${entityName}Mapper;
import ${basePackageName}.service.${entityName}Service;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * ${comment}业务逻辑层的实现类
 *
 * @author ${codeAuthor}
 * @since ${.now?string("yyyy-MM-dd HH:mm")}
 */
@Slf4j
@Service
@Transactional(rollbackFor = Exception.class)
public class ${entityName}ServiceImpl extends BaseServiceImpl<${entityName}Mapper, ${entityName}> implements ${entityName}Service {

    @Override
    public IPage<${entityName}> page(Integer currentPage, Integer size, ${entityName} query${entityName}) throws Exception {
        IPage<${entityName}> page = new Page<>(currentPage, size);
        QueryWrapper<${entityName}> queryWrapper = new QueryWrapper<>(query${entityName});
        IPage<${entityName}> pageInfo = baseMapper.selectPage(page, queryWrapper);
        return pageInfo;
    }

    @Override
    public List<${entityName}> list(${entityName} query${entityName}) throws Exception {
        QueryWrapper<${entityName}> queryWrapper = new QueryWrapper<>(query${entityName});
        List<${entityName}> ${entityName?uncap_first}List = baseMapper.selectList(queryWrapper);
        return ${entityName?uncap_first}List;
    }

    @Override
    public IPage<${entityName}> recoverPage(Integer currentPage, Integer size, ${entityName} query${entityName}) throws Exception {
        IPage<${entityName}> page = new Page<>(currentPage, size);
        IPage<${entityName}> pageInfo = baseMapper.getRecoverPage(page, query${entityName});
        return pageInfo;
    }

    @Override
    public void recover(Integer id) throws Exception {
        baseMapper.recoverById(id);
    }

    @Override
    public void recoverDelete(Integer id) throws Exception {
        baseMapper.recoverDelete(id);
    }

    @Override
    public void exportExcel(${entityName} query${entityName}, HttpServletResponse response) throws Exception {
        List<${entityName}> exportData = list(query${entityName});
        excelUtils.exportExcel("${comment}", ${entityName}.class, exportData, response);
    }

}