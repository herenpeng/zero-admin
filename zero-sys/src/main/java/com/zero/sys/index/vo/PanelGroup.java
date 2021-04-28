package com.zero.sys.index.vo;

import io.swagger.annotations.ApiModel;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 用户首页的数据封装实体
 *
 * @author herenpeng
 * @since 2021-04-28 20:59
 */
@ApiModel(value = "系统首页的展示数据封装实体")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class PanelGroup {

    /**
     * 用户数量
     */
    private Integer user;
    /**
     * 访问次数
     */
    private Integer access;

    private Integer message;

}
