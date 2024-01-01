package com.zero.sys.server.vo;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @author herenpeng
 * @since 2020-10-12 20:35
 */
@Schema(name = "系统文件信息实体类")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class SysFile {

    /**
     * 盘符路径
     */
    private String dirName;

    /**
     * 盘符类型
     */
    private String sysTypeName;

    /**
     * 文件类型
     */
    private String typeName;

    /**
     * 总大小
     */
    private String total;

    /**
     * 剩余大小
     */
    private String free;

    /**
     * 已经使用量
     */
    private String used;

    /**
     * 资源的使用率
     */
    private double usage;

    public String getUsage() {
        return usage + "%";
    }
}
