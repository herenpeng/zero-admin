package com.zero.sys.server.domain;

import com.zero.sys.server.util.Arith;
import io.swagger.annotations.ApiModel;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 系统内存参数信息实体类
 *
 * @author herenpeng
 * @since 2020-10-12 20:31
 */
@ApiModel(value = "系统内存参数信息实体类")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Mem {

    /**
     * 内存总量
     */
    private double total;

    /**
     * 已用内存
     */
    private double used;

    /**
     * 剩余内存
     */
    private double free;

    public double getTotal() {
        return Arith.div(total, (1024 * 1024 * 1024), 2);
    }

    public double getUsed() {
        return Arith.div(used, (1024 * 1024 * 1024), 2);
    }

    public double getFree() {
        return Arith.div(free, (1024 * 1024 * 1024), 2);
    }

    public double getUsage() {
        return Arith.mul(Arith.div(used, total, 4), 100);
    }


}
