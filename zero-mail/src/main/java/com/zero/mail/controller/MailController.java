package com.zero.mail.controller;

import com.zero.common.annotation.AppLog;
import com.zero.common.domain.ResponseEntity;
import com.zero.mail.domain.ToMail;
import com.zero.mail.service.MailService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.Parameter;
import io.swagger.v3.oas.annotations.Parameters;
import io.swagger.v3.oas.annotations.tags.Tag;
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
@Tag(description = "邮件服务操作接口", name = "MailController")
@Slf4j
@RequiredArgsConstructor
@RestController
@RequestMapping("mail")
public class MailController {

    private final MailService mailService;

    @AppLog
    @Operation(description = "发送普通文本邮件")
    @Parameters({
            @Parameter(name = "toMail", description = "邮件接收封装实体", required = true)}
    )
    @PostMapping("text")
    public ResponseEntity<Boolean> text(ToMail toMail) throws Exception {
        boolean result = mailService.sendTextMail(toMail);
        return ResponseEntity.ok(result);
    }


    @AppLog
    @Operation(description = "发送HTML模板邮件")
    @Parameters({
            @Parameter(name = "toMail", description = "邮件接收封装实体", required = true)}
    )
    @PostMapping("template")
    public ResponseEntity<Boolean> template(ToMail toMail) throws Exception {
        boolean result = mailService.sendTemplateMail(toMail);
        return ResponseEntity.ok(result);
    }

}
