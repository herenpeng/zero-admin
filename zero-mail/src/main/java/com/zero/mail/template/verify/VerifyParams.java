package com.zero.mail.template.verify;

import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 发送邮件验证码邮件的模板参数实体类
 *
 * @author herenpeng
 * @since 2021-01-17 21:16
 */
@Schema(name = "发送邮件验证邮件的模板参数实体类")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class VerifyParams {

    /**
     * 邮件接收者的用户名
     */
    @Schema(name = "邮件接收者的用户名")
    private String username;

    /**
     * 邮件接收者的账号
     */
    @Schema(name = "邮件接收者的账号")
    private String toMail;

    /**
     * 邮件验证码
     */
    @Schema(name = "邮件验证码")
    private String verify;

}
