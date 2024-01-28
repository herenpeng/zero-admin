package com.zero.sys.vo;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

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
public class Mem implements Serializable {

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
    /**
     * 使用率
     */
    private double usage;

}
