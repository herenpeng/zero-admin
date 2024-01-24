package com.zero.sys.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 服务器信息，前端需要的饼图数据信息
 *
 * @author herenpeng
 * @since 2020-10-18 23:31
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class ServerChart {

    private CpuChart cpu;

    private MemChart mem;

    private JvmChart jvm;

    public ServerChart(double cpuUser, double cpuSys, double memUsed, double memFree, double jvmUsed, double jvmFree) {
        cpu = new CpuChart(cpuUser, cpuSys);
        mem = new MemChart(memUsed, memFree);
        jvm = new JvmChart(jvmUsed, jvmFree);
    }

    @AllArgsConstructor
    @Data

    private static class CpuChart {
        /**
         * CPU用户使用率
         */
        private double user;
        /**
         * CPU系统使用率
         */
        private double sys;
    }

    @AllArgsConstructor
    @Data
    private static class MemChart {
        /**
         * 已用内存
         */
        private double used;

        /**
         * 剩余内存
         */
        private double free;
    }


    @AllArgsConstructor
    @Data
    private static class JvmChart {
        /**
         * JVM已用内存
         */
        private double used;
        /**
         * JVM空闲内存(M)
         */
        private double free;
    }

}
