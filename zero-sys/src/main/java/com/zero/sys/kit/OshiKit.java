package com.zero.sys.kit;

import com.zero.sys.vo.Cpu;
import com.zero.sys.vo.Jvm;
import com.zero.sys.vo.Mem;
import oshi.SystemInfo;
import oshi.hardware.CentralProcessor;
import oshi.hardware.CentralProcessor.TickType;
import oshi.hardware.GlobalMemory;
import oshi.hardware.HardwareAbstractionLayer;
import oshi.util.Util;

import java.util.Properties;

/**
 * 封装的Oshi工具类，本地操作系统和Java的硬件信息库
 *
 * @author herenpeng
 * @since 2020-10-12 19:51
 */
public class OshiKit {

    private static final int OSHI_WAIT_SECOND = 1000;

    private static HardwareAbstractionLayer hardware;

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
        long nice = ticks[TickType.NICE.getIndex()] - prevTicks[TickType.NICE.getIndex()];
        long irq = ticks[TickType.IRQ.getIndex()] - prevTicks[TickType.IRQ.getIndex()];
        long softirq = ticks[TickType.SOFTIRQ.getIndex()] - prevTicks[TickType.SOFTIRQ.getIndex()];
        long steal = ticks[TickType.STEAL.getIndex()] - prevTicks[TickType.STEAL.getIndex()];
        long cSys = ticks[TickType.SYSTEM.getIndex()] - prevTicks[TickType.SYSTEM.getIndex()];
        long user = ticks[TickType.USER.getIndex()] - prevTicks[TickType.USER.getIndex()];
        long iowait = ticks[TickType.IOWAIT.getIndex()] - prevTicks[TickType.IOWAIT.getIndex()];
        long idle = ticks[TickType.IDLE.getIndex()] - prevTicks[TickType.IDLE.getIndex()];
        long totalCpu = user + nice + cSys + idle + iowait + irq + softirq + steal;
        cpu.setCpuNum(processor.getLogicalProcessorCount());
        cpu.setTotal(totalCpu);
        cpu.setSys(cSys);
        cpu.setUsed(user);
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

}
