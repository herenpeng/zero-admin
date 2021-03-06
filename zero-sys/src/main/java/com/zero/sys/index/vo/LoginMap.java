package com.zero.sys.index.vo;

import io.swagger.annotations.ApiModel;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @author herenpeng
 * @since 2021-04-28 23:33
 */
@ApiModel(value = "系统首页的用户登录地图数据封装实体")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class LoginMap {
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
