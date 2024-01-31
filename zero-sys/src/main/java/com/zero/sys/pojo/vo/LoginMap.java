package com.zero.sys.pojo.vo;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

/**
 * @author herenpeng
 * @since 2021-04-28 23:33
 */
@Schema(name = "系统首页的用户登录地图数据封装实体")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class LoginMap implements Serializable {
    /**
     * 省份名称
     */
    private String name;
    /**
     * 访问用户数
     */
    private Integer user;
    /**
     * 访问次数
     */
    private Integer value;

}
