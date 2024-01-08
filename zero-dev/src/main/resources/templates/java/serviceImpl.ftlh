package ${javaPackageName}.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.zero.common.base.service.impl.BaseServiceImpl;
import ${javaPackageName}.entity.${entityName};
import ${javaPackageName}.mapper.${entityName}Mapper;
import ${javaPackageName}.service.${entityName}Service;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * ${comment}业务逻辑层的实现类
 *
 * @author ${codeAuthor}
 * @since ${.now?string("yyyy-MM-dd HH:mm")}
 */
@Slf4j
@RequiredArgsConstructor
@Service
@Transactional(rollbackFor = Exception.class)
public class ${entityName}ServiceImpl extends BaseServiceImpl<${entityName}Mapper, ${entityName}> implements ${entityName}Service {

    @Override
    public IPage<${entityName}> page(Integer currentPage, Integer size, ${entityName} query${entityName}) throws Exception {
        return page(currentPage, size, query${entityName}, false);
    }

    private IPage<${entityName}> page(Integer currentPage, Integer size, ${entityName} query${entityName}, Boolean deleted) throws Exception {
        query${entityName}.setDeleted(deleted);
        IPage<${entityName}> page = new Page<>(currentPage, size);
        return baseMapper.getPage(page, query${entityName});
    }

    @Override
    public List<${entityName}> list(${entityName} query${entityName}) throws Exception {
        QueryWrapper<${entityName}> queryWrapper = new QueryWrapper<>(query${entityName});
        return baseMapper.selectList(queryWrapper);
    }

    @Override
    public IPage<${entityName}> recoverPage(Integer currentPage, Integer size, ${entityName} query${entityName}) throws Exception {
        return page(currentPage, size, query${entityName}, true);
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