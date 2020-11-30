package ${basePackageName}.service.impl;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.zero.common.base.service.impl.BaseServiceImpl;
import ${basePackageName}.entity.${entityName};
import ${basePackageName}.mapper.${entityName}Mapper;
import ${basePackageName}.service.${entityName}Service;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
        Page page = new Page(currentPage, size);
        IPage<${entityName}> pageInfo = baseMapper.getPage(page, query${entityName});
        return pageInfo;
    }

    @Override
    public List<${entityName}> list(${entityName} query${entityName}) throws Exception {
        return baseMapper.getList(page, query${entityName});
    }

    @Override
    public IPage<${entityName}> recoverPage(Integer currentPage, Integer size, ${entityName} query${entityName}) throws Exception {
        Page page = new Page(currentPage, size);
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

}