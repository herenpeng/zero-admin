package com.zero.sys.service.impl;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.zero.auth.entity.UserInfo;
import com.zero.auth.mapper.UserInfoMapper;
import com.zero.auth.security.util.SecurityUtils;
import com.zero.common.base.service.impl.BaseServiceImpl;
import com.zero.common.constant.StringConst;
import com.zero.common.util.FreeMarkerUtils;
import com.zero.common.util.NumberUtils;
import com.zero.common.util.RedisUtils;
import com.zero.mail.domain.ToMail;
import com.zero.mail.template.verify.VerifyParams;
import com.zero.mail.template.verify.VerifyProperties;
import com.zero.mail.util.MailUtils;
import com.zero.sys.service.UserInfoService;
import com.zero.upload.service.UploadService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.ObjectUtils;
import org.springframework.web.multipart.MultipartFile;

import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * 系统用户信息表业务逻辑层的实现类
 *
 * @author herenpeng
 * @since 2021-01-12 22:19
 */
@Slf4j
@RequiredArgsConstructor
@Service
@Transactional(rollbackFor = Exception.class)
public class UserInfoServiceImpl extends BaseServiceImpl<UserInfoMapper, UserInfo> implements UserInfoService {

    private final UploadService uploadService;

    private final SecurityUtils securityUtils;

    private final VerifyProperties verifyProperties;

    private final FreeMarkerUtils freeMarkerUtils;

    private final MailUtils mailUtils;

    private final NumberUtils numberUtils;

    private final RedisUtils<String, Object> redisUtils;

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
        Integer id = securityUtils.getUserId(request);
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
        Integer userId = securityUtils.getUserId(request);
        UserInfo userInfo = baseMapper.selectById(userId);
        return userInfo.getAvatar();
    }

    @Override
    public UserInfo info() throws Exception {
        Integer userId = securityUtils.getUserId(request);
        UserInfo userInfo = baseMapper.selectById(userId);
        return userInfo;
    }


    @Override
    public boolean sendVerifyMail(String mail) throws Exception {
        ToMail toMail = new ToMail();
        // 设置邮箱接收者的邮箱账号
        toMail.setToMails(new String[]{mail});
        // 设置发送邮件的主题信息
        toMail.setSubject(verifyProperties.getSubject());
        // 通过随机数生成邮件验证码
        String verify = numberUtils.generateRandomNumberString(verifyProperties.getLength());
        // 准备邮件模板参数
        VerifyParams verifyParams = new VerifyParams(securityUtils.getUsername(request), mail, verify);
        // 将邮箱验证码存放入Redis中，以指定配置的key值前缀和邮箱账号名称作为key值，
        String verifyRedisKey = verifyProperties.getKey() + StringConst.COLON + mail;
        redisUtils.set(verifyRedisKey, verify, verifyProperties.getTtl());
        // 通过邮件模板参数和属性，获取模板内容字符串
        String content = freeMarkerUtils.getTemplateContent(verifyParams, verifyProperties.getPath(), verifyProperties.getFile());
        toMail.setContent(content);
        return mailUtils.sendTemplateMail(toMail);
    }

    @Override
    public boolean verify(String mail, String verify) throws Exception {
        String verifyRedisKey = verifyProperties.getKey() + StringConst.COLON + mail;
        Object redisVerify = redisUtils.get(verifyRedisKey);
        if (StringUtils.equals(verify, String.valueOf(redisVerify))) {
            // 删除redis
            redisUtils.del(verifyRedisKey);
            // 更新数据库
            Integer id = securityUtils.getUserId(request);
            UserInfo userInfo = new UserInfo();
            userInfo.setId(id);
            userInfo.setMail(mail);
            baseMapper.updateById(userInfo);
            return true;
        }
        return false;
    }

}