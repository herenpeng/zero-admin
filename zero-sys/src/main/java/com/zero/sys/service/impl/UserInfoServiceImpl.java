package com.zero.sys.service.impl;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.zero.auth.entity.UserInfo;
import com.zero.auth.kit.TokenKit;
import com.zero.auth.mapper.UserInfoMapper;
import com.zero.common.base.service.impl.BaseServiceImpl;
import com.zero.common.constant.AppConst;
import com.zero.common.kit.ExcelKit;
import com.zero.common.kit.FreeMarkerKit;
import com.zero.common.kit.NumberKit;
import com.zero.common.kit.RedisKit;
import com.zero.mail.domain.ToMail;
import com.zero.mail.template.verify.VerifyParams;
import com.zero.mail.template.verify.VerifyProperties;
import com.zero.mail.util.MailUtils;
import com.zero.sys.service.UserInfoService;
import com.zero.sys.service.UploadService;
import jakarta.servlet.http.HttpServletResponse;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.ObjectUtils;
import org.springframework.web.multipart.MultipartFile;

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

    private final TokenKit tokenKit;

    private final VerifyProperties verifyProperties;

    private final MailUtils mailUtils;

    private final RedisKit redisKit;

    @Override
    public IPage<UserInfo> page(Integer currentPage, Integer size, UserInfo queryUserInfo) throws Exception {
        return page(currentPage, size, queryUserInfo, false);
    }

    public IPage<UserInfo> page(Integer currentPage, Integer size, UserInfo queryUserInfo, Boolean deleted) throws Exception {
        queryUserInfo.setDeleted(deleted);
        IPage<UserInfo> page = new Page<>(currentPage, size);
        return baseMapper.getPage(page, queryUserInfo);
    }


    @Override
    public List<UserInfo> list(UserInfo queryUserInfo) throws Exception {
        return baseMapper.getList(queryUserInfo);
    }

    @Override
    public IPage<UserInfo> recoverPage(Integer currentPage, Integer size, UserInfo queryUserInfo) throws Exception {
        return page(currentPage, size, queryUserInfo, true);
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
        ExcelKit.exportExcel("系统用户信息表", UserInfo.class, exportData, response);
    }

    @Override
    public String avatar(MultipartFile file) throws Exception {
        String avatar = uploadService.uploadImage(file);
        Integer id = tokenKit.getUserId(request);
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
        Integer userId = tokenKit.getUserId(request);
        UserInfo userInfo = baseMapper.selectById(userId);
        return userInfo.getAvatar();
    }

    @Override
    public UserInfo info() throws Exception {
        Integer userId = tokenKit.getUserId(request);
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
        String verify = NumberKit.generateRandomNumberString(verifyProperties.getLength());
        // 准备邮件模板参数
        VerifyParams verifyParams = new VerifyParams(tokenKit.getUsername(request), mail, verify);
        // 将邮箱验证码存放入Redis中，以指定配置的key值前缀和邮箱账号名称作为key值，
        String verifyRedisKey = verifyProperties.getKey() + AppConst.COLON + mail;
        redisKit.set(verifyRedisKey, verify, verifyProperties.getTtl());
        // 通过邮件模板参数和属性，获取模板内容字符串
        String content = FreeMarkerKit.getTemplateContent(verifyParams, verifyProperties.getPath(), verifyProperties.getFile());
        toMail.setContent(content);
        return mailUtils.sendTemplateMail(toMail);
    }

    @Override
    public boolean verify(String mail, String verify) throws Exception {
        String verifyRedisKey = verifyProperties.getKey() + AppConst.COLON + mail;
        Object redisVerify = redisKit.get(verifyRedisKey);
        if (StringUtils.equals(verify, String.valueOf(redisVerify))) {
            // 删除redis
            redisKit.del(verifyRedisKey);
            // 更新数据库
            Integer id = tokenKit.getUserId(request);
            UserInfo userInfo = new UserInfo();
            userInfo.setId(id);
            userInfo.setMail(mail);
            baseMapper.updateById(userInfo);
            return true;
        }
        return false;
    }

}