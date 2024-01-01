package com.zero.mail.template.login;

import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

/**
 * @author herenpeng
 * @since 2021-05-17 23:36
 */
@Schema(name = "发送登录邮件的模板参数实体类")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class LoginMailParams {

    /**
     * 邮件接收者的用户名
     */
    @Schema(name = "邮件接收者的用户名")
    private String username;

    /**
     * 用户登录时间
     */
    @Schema(name = "用户登录时间")
    private Date loginTime;

    /**
     * 用户登录实现地址
     */
    @Schema(name = "用户登录实现地址")
    private String loginAddress;

    /**
     * 用户登录网络IP
     */
    @Schema(name = "用户登录网络IP")
    private String loginIp;


}
