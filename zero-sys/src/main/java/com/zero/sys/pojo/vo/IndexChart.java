package com.zero.sys.pojo.vo;

import com.zero.common.domain.LineChart;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

import java.io.Serializable;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class IndexChart implements Serializable {

    private UserChart userChart;

    private ResourcesChart resourcesChart;


    /**
     * 登录用户数
     * 登录用户次数
     */
    @EqualsAndHashCode(callSuper = true)
    @Data
    public static class UserChart extends LineChart {
        // 用户数量
        private Long num;
    }

    @EqualsAndHashCode(callSuper = true)
    @Data
    public static class ResourcesChart extends LineChart {
        // 资源数量
        private Long num;
    }



}
