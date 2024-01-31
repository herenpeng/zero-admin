package com.zero.sys.pojo.vo;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 用户首页的数据封装实体
 *
 * @author herenpeng
 * @since 2021-04-28 20:59
 */
@Schema(name = "系统首页的展示数据封装实体")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class PanelGroup {

    /**
     * 用户数量
     */
    private Long user;
    /**
     * 访问次数
     */
    private Long access;

    private Integer message;

}
