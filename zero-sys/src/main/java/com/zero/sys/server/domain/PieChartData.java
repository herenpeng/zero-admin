package com.zero.sys.server.domain;

import io.swagger.annotations.ApiModel;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 饼壮图表数据实体类
 * @author herenpeng
 * @since 2020-10-12 19:19
 */
@ApiModel(value = "饼壮图表数据实体类")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class PieChartData {

    private Long value;

    private String name;

}
