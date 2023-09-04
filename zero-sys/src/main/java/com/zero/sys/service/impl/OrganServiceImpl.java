package com.zero.sys.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.zero.auth.entity.User;
import com.zero.common.base.service.impl.BaseServiceImpl;
import com.zero.sys.entity.Organ;
import com.zero.sys.mapper.OrganMapper;
import com.zero.sys.mapper.UserOrganMapper;
import com.zero.sys.service.OrganService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * 系统组织机构表业务逻辑层的实现类
 *
 * @author herenpeng
 * @since 2023-09-03 16:42
 */
@Slf4j
@RequiredArgsConstructor
@Service
@Transactional(rollbackFor = Exception.class)
public class OrganServiceImpl extends BaseServiceImpl<OrganMapper, Organ> implements OrganService {

    private final UserOrganMapper userOrganMapper;

    @Override
    public IPage<Organ> page(Integer currentPage, Integer size, Organ queryOrgan) throws Exception {
        IPage<Organ> page = new Page<>(currentPage, size);
        IPage<Organ> pageInfo = baseMapper.getPage(page, queryOrgan);
        for (Organ organ : pageInfo.getRecords()) {
            findChildren(organ);
        }
        return pageInfo;
    }


    private void findChildren(Organ organ) throws Exception {
        List<User> users = userOrganMapper.getUserByOrganId(organ.getId());
        organ.setUsers(users);
        List<Organ> children = baseMapper.getByParentId(organ.getId());
        organ.setChildren(children);
        for (Organ child : children) {
            findChildren(child);
        }
    }


    @Override
    public List<Organ> list(Organ queryOrgan) throws Exception {
        QueryWrapper<Organ> queryWrapper = new QueryWrapper<>(queryOrgan);
        List<Organ> organList = baseMapper.selectList(queryWrapper);
        return organList;
    }

    @Override
    public IPage<Organ> recoverPage(Integer currentPage, Integer size, Organ queryOrgan) throws Exception {
        IPage<Organ> page = new Page<>(currentPage, size);
        IPage<Organ> pageInfo = baseMapper.getRecoverPage(page, queryOrgan);
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
    public void exportExcel(Organ queryOrgan, HttpServletResponse response) throws Exception {
        List<Organ> exportData = list(queryOrgan);
        excelUtils.exportExcel("系统组织机构表", Organ.class, exportData, response);
    }

}