package com.zero.sys.kit;

import com.zero.common.kit.ArithHelper;
import com.zero.sys.vo.Cpu;
import com.zero.sys.vo.Jvm;
import com.zero.sys.vo.Mem;
import com.zero.sys.vo.ServerChart;
import oshi.SystemInfo;
import oshi.hardware.CentralProcessor;
import oshi.hardware.CentralProcessor.TickType;
import oshi.hardware.GlobalMemory;
import oshi.hardware.HardwareAbstractionLayer;
import oshi.util.Util;

import java.util.Arrays;
import java.util.Properties;

/**
 * 封装的Oshi工具类，本地操作系统和Java的硬件信息库
 *
 * @author herenpeng
 * @since 2020-10-12 19:51
 */
public class OshiKit {

    private static final int OSHI_WAIT_SECOND = 1000;

    private static final HardwareAbstractionLayer hardware;

    static {
        SystemInfo systemInfo = new SystemInfo();
        hardware = systemInfo.getHardware();
    }

    /**
     * 获取CPU的使用率和未使用率
     *
     * @return
     * @throws Exception
     */
    public static Cpu getCpuInfo() {
        Cpu cpu = new Cpu();
        setCpuInfo(cpu, hardware.getProcessor());
        return cpu;
    }

    /**
     * 封装的设置cpu信息的方法
     *
     * @param cpu
     * @param processor
     */
    public static void setCpuInfo(Cpu cpu, CentralProcessor processor) {
        long[] prevTicks = processor.getSystemCpuLoadTicks();
        Util.sleep(OSHI_WAIT_SECOND);
        long[] ticks = processor.getSystemCpuLoadTicks();
        long sys = ticks[TickType.SYSTEM.getIndex()] - prevTicks[TickType.SYSTEM.getIndex()];
        long user = ticks[TickType.USER.getIndex()] - prevTicks[TickType.USER.getIndex()];
        long iowait = ticks[TickType.IOWAIT.getIndex()] - prevTicks[TickType.IOWAIT.getIndex()];
        long idle = ticks[TickType.IDLE.getIndex()] - prevTicks[TickType.IDLE.getIndex()];
        long total = Arrays.stream(ticks).sum() - Arrays.stream(prevTicks).sum();
        cpu.setCpuNum(processor.getLogicalProcessorCount());
        cpu.setTotal(total);
        cpu.setSys(sys);
        cpu.setUser(user);
        cpu.setWait(iowait);
        cpu.setFree(idle);
    }

    /**
     * 获取内存信息
     *
     * @return
     * @throws Exception
     */
    public static Mem getMemInfo() {
        Mem mem = new Mem();
        setMemInfo(mem, hardware.getMemory());
        return mem;
    }

    /**
     * 设置内存信息
     *
     * @param mem
     * @param memory
     */
    public static void setMemInfo(Mem mem, GlobalMemory memory) {
        mem.setTotal(memory.getTotal());
        mem.setUsed(memory.getTotal() - memory.getAvailable());
        mem.setFree(memory.getAvailable());
    }

    /**
     * 获取Java虚拟机信息
     *
     * @return
     * @throws Exception
     */
    public static Jvm getJvmInfo() {
        Jvm jvm = new Jvm();
        setJvmInfo(jvm);
        return jvm;
    }

    /**
     * 设置Java虚拟机
     */
    public static void setJvmInfo(Jvm jvm) {
        Properties props = System.getProperties();
        jvm.setTotal(Runtime.getRuntime().totalMemory());
        jvm.setMax(Runtime.getRuntime().maxMemory());
        jvm.setFree(Runtime.getRuntime().freeMemory());
        jvm.setVersion(props.getProperty("java.version"));
        jvm.setHome(props.getProperty("java.home"));
    }


    public static ServerChart getServerChart() {
        CentralProcessor processor = hardware.getProcessor();
        long[] prevTicks = processor.getSystemCpuLoadTicks();
        Util.sleep(OSHI_WAIT_SECOND);
        // CPU
        long[] ticks = processor.getSystemCpuLoadTicks();
        long cpuUser = ticks[TickType.USER.getIndex()] - prevTicks[TickType.USER.getIndex()];
        long cpuSys = ticks[TickType.SYSTEM.getIndex()] - prevTicks[TickType.SYSTEM.getIndex()];
        long cpuTotal = Arrays.stream(ticks).sum() - Arrays.stream(prevTicks).sum();
        double cpuUserValue = ArithHelper.div(cpuUser * 100, cpuTotal, 2);
        double cpuSysValue = ArithHelper.div(cpuSys * 100, cpuTotal, 2);
        // 内存，单位B
        GlobalMemory memory = hardware.getMemory();
        long memFree = memory.getAvailable();
        long memUsed = memory.getTotal() - memFree;
        // 内存单位转为GB
        double memFreeValue = ArithHelper.div(memFree, (1024 * 1024 * 1024), 2);
        double memUsedValue = ArithHelper.div(memUsed, (1024 * 1024 * 1024), 2);
        // JVM，单位B
        long jvmFree = Runtime.getRuntime().freeMemory();
        long jvmTotal = Runtime.getRuntime().totalMemory();
        long jvmUsed = jvmTotal - jvmFree;
        // JVM内存单位转为MB
        double jvmFreeValue = ArithHelper.div(jvmFree, (1024 * 1024), 2);
        double jvmUsedValue = ArithHelper.div(jvmUsed, (1024 * 1024), 2);
        return new ServerChart(cpuUserValue, cpuSysValue, memUsedValue, memFreeValue, jvmUsedValue, jvmFreeValue);
    }

}
