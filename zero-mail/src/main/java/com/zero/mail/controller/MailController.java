package com.zero.mail.controller;

import com.zero.common.annotation.LogOperation;
import com.zero.common.response.domain.ResponseData;
import com.zero.mail.domain.ToMail;
import com.zero.mail.service.MailService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 邮件服务控制层操作接口
 *
 * @author herenpeng
 * @since 2021-01-17 20:01
 */
@Api(value = "邮件服务操作接口", tags = "MailController")
@Slf4j
@RequiredArgsConstructor
@RestController
@RequestMapping("mail")
public class MailController {

    private final MailService mailService;

    @LogOperation
    @ApiOperation(value = "发送普通文本邮件")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "toMail", value = "邮件接收封装实体", dataTypeClass = ToMail.class, required = true)}
    )
    @PostMapping("text")
    public ResponseData<Boolean> text(ToMail toMail) throws Exception {
        boolean result = mailService.sendTextMail(toMail);
        return ResponseData.ok(result);
    }


    @LogOperation
    @ApiOperation(value = "发送HTML模板邮件")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "toMail", value = "邮件接收封装实体", dataTypeClass = ToMail.class, required = true)}
    )
    @PostMapping("template")
    public ResponseData<Boolean> template(ToMail toMail) throws Exception {
        boolean result = mailService.sendTemplateMail(toMail);
        return ResponseData.ok(result);
    }

}
