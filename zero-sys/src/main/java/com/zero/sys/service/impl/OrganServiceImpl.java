package com.zero.sys.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.zero.common.base.service.impl.BaseServiceImpl;
import com.zero.common.kit.ExcelKit;
import com.zero.common.kit.TreeKit;
import com.zero.sys.entity.Organ;
import com.zero.sys.mapper.OrganMapper;
import com.zero.sys.service.OrganService;
import jakarta.servlet.http.HttpServletResponse;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * 系统组织机构表业务逻辑层的实现类
 *
 * @author herenpeng
 * @since 2024-01-20 10:11
 */
@Slf4j
@RequiredArgsConstructor
@Service
@Transactional(rollbackFor = Exception.class)
public class OrganServiceImpl extends BaseServiceImpl<OrganMapper, Organ> implements OrganService {

    @Override
    public IPage<Organ> page(Integer currentPage, Integer size, Organ queryOrgan) throws Exception {
        return page(currentPage, size, queryOrgan, false);
    }

    private IPage<Organ> page(Integer currentPage, Integer size, Organ queryOrgan, Boolean deleted) throws Exception {
        queryOrgan.setDeleted(deleted);
        IPage<Organ> page = new Page<>(currentPage, size);
        return baseMapper.getPage(page, queryOrgan);
    }


    @Override
    public List<Organ> list(Organ queryOrgan) throws Exception {
        QueryWrapper<Organ> queryWrapper = new QueryWrapper<>(queryOrgan);
        return baseMapper.selectList(queryWrapper);
    }


    @Override
    public List<Organ> tree() throws Exception {
        return TreeKit.findChildren(0, baseMapper::getByParentId);
    }


    @Override
    public void move(Organ organ) throws Exception {
        TreeKit.move(organ.getId(), organ.getParentId(), organ.getSort(),
                baseMapper::selectById, baseMapper::getByParentId, this::updateBatchById);
    }


    @Override
    public IPage<Organ> recoverPage(Integer currentPage, Integer size, Organ queryOrgan) throws Exception {
        return page(currentPage, size, queryOrgan, true);
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
    public void exportExcel(Organ queryOrgan, HttpServletResponse response) throws Exception {
        List<Organ> exportData = list(queryOrgan);
        ExcelKit.exportExcel("系统组织机构表", Organ.class, exportData, response);
    }

}