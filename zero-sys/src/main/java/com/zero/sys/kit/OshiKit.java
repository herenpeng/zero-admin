package com.zero.sys.kit;

import com.zero.common.kit.ArithHelper;
import com.zero.common.kit.DateKit;
import com.zero.sys.pojo.vo.*;
import oshi.SystemInfo;
import oshi.hardware.CentralProcessor;
import oshi.hardware.CentralProcessor.TickType;
import oshi.hardware.GlobalMemory;
import oshi.hardware.HardwareAbstractionLayer;
import oshi.software.os.FileSystem;
import oshi.software.os.OSFileStore;
import oshi.software.os.OperatingSystem;
import oshi.util.Util;

import java.lang.management.ManagementFactory;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Properties;

/**
 * 封装的Oshi工具类，本地操作系统和Java的硬件信息库
 *
 * @author herenpeng
 * @since 2020-10-12 19:51
 */
public class OshiKit {

    private static final int OSHI_WAIT_SECOND = 1000;
    private static final int KB = 1024;
    private static final int MB = KB * 1024;
    private static final int GB = MB * 1024;

    private static final SystemInfo systemInfo = new SystemInfo();
    private static final HardwareAbstractionLayer hardware = systemInfo.getHardware();

    /**
     * 获取CPU的使用率和未使用率
     */
    public static Cpu getCpuInfo() {
        Cpu cpu = new Cpu();
        CentralProcessor processor = hardware.getProcessor();
        long[] prevTicks = processor.getSystemCpuLoadTicks();
        Util.sleep(OSHI_WAIT_SECOND);
        long[] ticks = processor.getSystemCpuLoadTicks();
        long sys = ticks[TickType.SYSTEM.getIndex()] - prevTicks[TickType.SYSTEM.getIndex()];
        long user = ticks[TickType.USER.getIndex()] - prevTicks[TickType.USER.getIndex()];
        long iowait = ticks[TickType.IOWAIT.getIndex()] - prevTicks[TickType.IOWAIT.getIndex()];
        long idle = ticks[TickType.IDLE.getIndex()] - prevTicks[TickType.IDLE.getIndex()];
        long total = Arrays.stream(ticks).sum() - Arrays.stream(prevTicks).sum();
        cpu.setCpuNum(processor.getLogicalProcessorCount());
        cpu.setTotal(ArithHelper.percent(total, total, 2));
        cpu.setSys(ArithHelper.percent(sys, total, 2));
        cpu.setUser(ArithHelper.percent(user, total, 2));
        cpu.setWait(ArithHelper.percent(iowait, total, 2));
        cpu.setFree(ArithHelper.percent(idle, total, 2));
        return cpu;
    }


    /**
     * 获取内存信息
     */
    public static Mem getMemInfo() {
        Mem mem = new Mem();
        GlobalMemory memory = hardware.getMemory();
        long total = memory.getTotal();
        long used = total - memory.getAvailable();
        mem.setTotal(ArithHelper.div(total, GB, 2));
        mem.setUsed(ArithHelper.div(used, GB, 2));
        mem.setFree(ArithHelper.div(memory.getAvailable(), GB, 2));
        mem.setUsage(ArithHelper.percent(used, total, 2));
        return mem;
    }

    /**
     * 获取Java虚拟机信息
     */
    public static Jvm getJvmInfo() {
        Jvm jvm = new Jvm();
        jvm.setName(ManagementFactory.getRuntimeMXBean().getVmName());
        Properties props = System.getProperties();
        jvm.setVersion(props.getProperty("java.version"));
        jvm.setHome(props.getProperty("java.home"));
        long startTime = ManagementFactory.getRuntimeMXBean().getStartTime();
        jvm.setStartTime(DateKit.format(startTime));
        jvm.setRunTime(getRunTime(startTime));
        jvm.setMax(ArithHelper.div(Runtime.getRuntime().maxMemory(), MB, 2));
        long total = Runtime.getRuntime().totalMemory();
        long free = Runtime.getRuntime().freeMemory();
        long used = total - free;
        jvm.setTotal(ArithHelper.div(total, MB, 2));
        jvm.setFree(ArithHelper.div(free, MB, 2));
        jvm.setUsed(ArithHelper.div(used, MB, 2));
        jvm.setUsage(ArithHelper.percent(used, total, 2));
        List<String> arguments = ManagementFactory.getRuntimeMXBean().getInputArguments();
        jvm.setArguments(arguments);
        return jvm;
    }


    /**
     * JVM运行时间
     */
    private static String getRunTime(long startTime) {
        long runTime = System.currentTimeMillis() - startTime;
        long runDay = runTime / DateKit.DAY;
        long runHourTime = runTime % DateKit.DAY;
        long runHour = runHourTime / DateKit.HOUR;
        long runMinuteTime = runHourTime % DateKit.HOUR;
        long runMinute = runMinuteTime / DateKit.MINUTE;
        return runDay + "天" + runHour + "小时" + runMinute + "分钟";
    }


    public static Sys getSysInfo() throws UnknownHostException {
        Sys sys = new Sys();
        InetAddress inetAddress = InetAddress.getLocalHost();
        sys.setComputerName(inetAddress.getHostName());
        sys.setComputerIp(inetAddress.getHostAddress());
        Properties props = System.getProperties();
        sys.setOsName(props.getProperty("os.name"));
        sys.setOsArch(props.getProperty("os.arch"));
        sys.setUserDir(props.getProperty("user.dir"));
        return sys;
    }


    public static List<SysFile> getSysFiles() {
        OperatingSystem os = systemInfo.getOperatingSystem();
        FileSystem fileSystem = os.getFileSystem();
        List<SysFile> sysFiles = new ArrayList<>();
        for (OSFileStore fs : fileSystem.getFileStores()) {
            long free = fs.getUsableSpace();
            long total = fs.getTotalSpace();
            long used = total - free;
            SysFile sysFile = new SysFile();
            sysFile.setDirName(fs.getMount());
            sysFile.setSysTypeName(fs.getType());
            sysFile.setTypeName(fs.getName());
            sysFile.setTotal(convertFileSize(total));
            sysFile.setFree(convertFileSize(free));
            sysFile.setUsed(convertFileSize(used));
            sysFile.setUsage(ArithHelper.percent(used, total, 2));
            sysFiles.add(sysFile);
        }
        return sysFiles;
    }


    /**
     * 字节转换
     *
     * @param size 字节大小
     * @return 转换后值
     */
    private static String convertFileSize(long size) {
        if (size >= GB) {
            return String.format("%.1f GB", (float) size / GB);
        } else if (size >= MB) {
            float f = (float) size / MB;
            return String.format(f > 100 ? "%.0f MB" : "%.1f MB", f);
        } else if (size >= KB) {
            float f = (float) size / KB;
            return String.format(f > 100 ? "%.0f KB" : "%.1f KB", f);
        } else {
            return String.format("%d B", size);
        }
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
        double cpuUserValue = ArithHelper.percent(cpuUser, cpuTotal, 2);
        double cpuSysValue = ArithHelper.percent(cpuSys, cpuTotal, 2);
        // 内存，单位B
        GlobalMemory memory = hardware.getMemory();
        long memFree = memory.getAvailable();
        long memUsed = memory.getTotal() - memFree;
        // 内存单位转为GB
        double memFreeValue = ArithHelper.div(memFree, GB, 2);
        double memUsedValue = ArithHelper.div(memUsed, GB, 2);
        // JVM，单位B
        long jvmFree = Runtime.getRuntime().freeMemory();
        long jvmTotal = Runtime.getRuntime().totalMemory();
        long jvmUsed = jvmTotal - jvmFree;
        // JVM内存单位转为MB
        double jvmFreeValue = ArithHelper.div(jvmFree, MB, 2);
        double jvmUsedValue = ArithHelper.div(jvmUsed, MB, 2);
        return new ServerChart(cpuUserValue, cpuSysValue, memUsedValue, memFreeValue, jvmUsedValue, jvmFreeValue);
    }

}
