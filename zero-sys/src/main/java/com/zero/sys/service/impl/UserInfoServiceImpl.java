package com.zero.sys.service.impl;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.zero.common.base.service.impl.BaseServiceImpl;
import com.zero.common.util.FreeMarkerUtils;
import com.zero.mail.domain.ToMail;
import com.zero.mail.template.verify.VerifyParams;
import com.zero.mail.template.verify.VerifyProperties;
import com.zero.mail.util.MailUtils;
import com.zero.sys.entity.UserInfo;
import com.zero.sys.mapper.UserInfoMapper;
import com.zero.sys.security.jwt.util.JwtUtils;
import com.zero.sys.service.UserInfoService;
import com.zero.upload.service.UploadService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.ObjectUtils;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * 系统用户信息表业务逻辑层的实现类
 *
 * @author herenpeng
 * @since 2021-01-12 22:19
 */
@Slf4j
@Service
@Transactional(rollbackFor = Exception.class)
public class UserInfoServiceImpl extends BaseServiceImpl<UserInfoMapper, UserInfo> implements UserInfoService {

    @Autowired
    private UploadService uploadService;

    @Autowired
    private JwtUtils jwtUtils;

    @Autowired
    private VerifyProperties verifyProperties;

    @Autowired
    private FreeMarkerUtils freeMarkerUtils;

    @Autowired
    private MailUtils mailUtils;

    @Override
    public IPage<UserInfo> page(Integer currentPage, Integer size, UserInfo queryUserInfo) throws Exception {
        IPage<UserInfo> page = new Page<>(currentPage, size);
        IPage<UserInfo> pageInfo = baseMapper.getPage(page, queryUserInfo);
        return pageInfo;
    }

    @Override
    public List<UserInfo> list(UserInfo queryUserInfo) throws Exception {
        return baseMapper.getList(queryUserInfo);
    }

    @Override
    public IPage<UserInfo> recoverPage(Integer currentPage, Integer size, UserInfo queryUserInfo) throws Exception {
        IPage<UserInfo> page = new Page<>(currentPage, size);
        IPage<UserInfo> pageInfo = baseMapper.getRecoverPage(page, queryUserInfo);
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
    public void exportExcel(UserInfo queryUserInfo, HttpServletResponse response) throws Exception {
        List<UserInfo> exportData = list(queryUserInfo);
        excelUtils.exportExcel("系统用户信息表", UserInfo.class, exportData, response);
    }

    @Override
    public String avatar(MultipartFile file) throws Exception {
        String avatar = uploadService.uploadImage(file);
        Integer id = jwtUtils.getUserId(request);
        UserInfo userInfo = baseMapper.selectById(id);
        if (ObjectUtils.isEmpty(userInfo)) {
            userInfo = new UserInfo();
            userInfo.setId(id);
            userInfo.setAvatar(avatar);
            baseMapper.insert(userInfo);
        } else {
            userInfo.setAvatar(avatar);
            baseMapper.updateById(userInfo);
        }
        return avatar;
    }

    @Override
    public String getAvatar() throws Exception {
        Integer userId = jwtUtils.getUserId(request);
        UserInfo userInfo = baseMapper.selectById(userId);
        return userInfo.getAvatar();
    }

    @Override
    public UserInfo info() throws Exception {
        Integer userId = jwtUtils.getUserId(request);
        UserInfo userInfo = baseMapper.selectById(userId);
        return userInfo;
    }


    @Override
    public boolean verifyMail(String mail) throws Exception {
        ToMail toMail = new ToMail();
        // 设置邮箱接收者的邮箱账号
        toMail.setToMails(new String[]{mail});
        // 设置发送邮件的主题信息
        toMail.setSubject(verifyProperties.getSubject());
        // 准备邮件模板参数
        VerifyParams verifyParams = new VerifyParams();
        String username = jwtUtils.getUsername(request);
        verifyParams.setUsername(username);
        verifyParams.setToMail(mail);
        verifyParams.setVerify("123456");
        // 通过邮件模板参数和属性，获取模板内容字符串
        String content = freeMarkerUtils.getTemplateContent(verifyParams, verifyProperties.getPath(), verifyProperties.getFile());
        toMail.setContent(content);
        boolean result = mailUtils.sendTemplateMail(toMail);
        return result;
    }

}