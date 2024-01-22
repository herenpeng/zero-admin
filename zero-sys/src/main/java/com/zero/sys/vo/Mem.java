package com.zero.sys.vo;

import com.zero.common.kit.ArithHelper;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 系统内存参数信息实体类
 *
 * @author herenpeng
 * @since 2020-10-12 20:31
 */
@Schema(name = "系统内存参数信息实体类")
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
        return ArithHelper.div(total, (1024 * 1024 * 1024), 2);
    }

    public double getUsed() {
        return ArithHelper.div(used, (1024 * 1024 * 1024), 2);
    }

    public double getFree() {
        return ArithHelper.div(free, (1024 * 1024 * 1024), 2);
    }

    public double getUsage() {
        return ArithHelper.mul(ArithHelper.div(used, total, 4), 100);
    }


}
