package com.zero.mail.service.impl;

import com.zero.mail.domain.ToMail;
import com.zero.mail.service.MailService;
import com.zero.mail.util.MailUtils;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * 邮件服务的Service层接口实现类
 *
 * @author herenpeng
 * @since 2021-01-17 20:00
 */
@Slf4j
@RequiredArgsConstructor
@Service
@Transactional(rollbackFor = Exception.class)
public class MailServiceImpl implements MailService {

    private final MailUtils mailUtils;

    @Override
    public Boolean sendTextMail(ToMail toMail) throws Exception {
        return mailUtils.sendTextMail(toMail);
    }

    @Override
    public Boolean sendTemplateMail(ToMail toMail) throws Exception {
        return mailUtils.sendTemplateMail(toMail);
    }

}
