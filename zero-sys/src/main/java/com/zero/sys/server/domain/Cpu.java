package com.zero.sys.server.domain;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.zero.sys.server.util.Arith;
import io.swagger.annotations.ApiModel;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 系统CPU参数信息实体类
 *
 * @author herenpeng
 * @since 2020-10-12 20:14
 */
@ApiModel(value = "系统CPU参数信息实体类")
@JsonInclude(JsonInclude.Include.NON_NULL)
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Cpu {

    /**
     * 核心数
     */
    private int cpuNum;

    /**
     * CPU总的使用率
     */
    private double total;

    /**
     * CPU系统使用率
     */
    private double sys;

    /**
     * CPU用户使用率
     */
    private double used;

    /**
     * CPU当前等待率
     */
    private double wait;

    /**
     * CPU当前空闲率
     */
    private double free;

    public double getTotal() {
        return Arith.round(Arith.mul(total, 100), 2);
    }

    public double getSys() {
        return Arith.round(Arith.mul(sys / total, 100), 2);
    }

    public double getUsed() {
        return Arith.round(Arith.mul(used / total, 100), 2);
    }

    public double getWait() {
        return Arith.round(Arith.mul(wait / total, 100), 2);
    }

    public double getFree() {
        return Arith.round(Arith.mul(free / total, 100), 2);
    }

}
