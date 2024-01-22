package com.zero.sys.vo;

import com.zero.common.kit.ArithHelper;
import com.zero.sys.kit.OshiKit;
import lombok.Data;
import oshi.SystemInfo;
import oshi.hardware.HardwareAbstractionLayer;
import oshi.software.os.FileSystem;
import oshi.software.os.OSFileStore;
import oshi.software.os.OperatingSystem;

import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.LinkedList;
import java.util.List;
import java.util.Properties;

/**
 * @author herenpeng
 * @since 2020-10-12 20:36
 */
@Data
public class Server {

    /**
     * CPU相关信息
     */
    private Cpu cpu = new Cpu();

    /**
     * 內存相关信息
     */
    private Mem mem = new Mem();

    /**
     * JVM相关信息
     */
    private Jvm jvm = new Jvm();

    /**
     * 服务器相关信息
     */
    private Sys sys = new Sys();

    /**
     * 磁盘相关信息
     */
    private List<SysFile> sysFiles = new LinkedList<SysFile>();


    public void copyTo() throws Exception {
        SystemInfo systemInfo = new SystemInfo();
        HardwareAbstractionLayer hardware = systemInfo.getHardware();
        OshiKit.setCpuInfo(cpu, hardware.getProcessor());
        OshiKit.setMemInfo(mem, hardware.getMemory());
        OshiKit.setJvmInfo(jvm);
        setSysInfo();
        setSysFiles(systemInfo.getOperatingSystem());
    }

    /**
     * 设置服务器信息
     */
    private void setSysInfo() throws UnknownHostException {
        InetAddress inetAddress = InetAddress.getLocalHost();
        sys.setComputerName(inetAddress.getHostName());
        sys.setComputerIp(inetAddress.getHostAddress());
        Properties props = System.getProperties();
        sys.setOsName(props.getProperty("os.name"));
        sys.setOsArch(props.getProperty("os.arch"));
        sys.setUserDir(props.getProperty("user.dir"));
    }


    /**
     * 设置磁盘信息
     */
    private void setSysFiles(OperatingSystem os) {
        FileSystem fileSystem = os.getFileSystem();
        List<OSFileStore> fsArray = fileSystem.getFileStores();
        for (OSFileStore fs : fsArray) {
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
            sysFile.setUsage(ArithHelper.mul(ArithHelper.div(used, total, 4), 100));
            sysFiles.add(sysFile);
        }
    }

    /**
     * 字节转换
     *
     * @param size 字节大小
     * @return 转换后值
     */
    public String convertFileSize(long size) {
        long kb = 1024;
        long mb = kb * 1024;
        long gb = mb * 1024;
        if (size >= gb) {
            return String.format("%.1f GB", (float) size / gb);
        } else if (size >= mb) {
            float f = (float) size / mb;
            return String.format(f > 100 ? "%.0f MB" : "%.1f MB", f);
        } else if (size >= kb) {
            float f = (float) size / kb;
            return String.format(f > 100 ? "%.0f KB" : "%.1f KB", f);
        } else {
            return String.format("%d B", size);
        }
    }

}
