package com.zero.sys.vo;

import lombok.Data;

import java.util.List;

/**
 * @author herenpeng
 * @since 2020-10-12 20:36
 */
@Data
public class Server {

    /**
     * CPU相关信息
     */
    private Cpu cpu;

    /**
     * 內存相关信息
     */
    private Mem mem;

    /**
     * JVM相关信息
     */
    private Jvm jvm;

    /**
     * 服务器相关信息
     */
    private Sys sys;

    /**
     * 磁盘相关信息
     */
    private List<SysFile> sysFiles;

}
