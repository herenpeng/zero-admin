package com.zero.sys.server.util;

import com.zero.sys.server.domain.PieChartData;
import oshi.SystemInfo;
import oshi.hardware.CentralProcessor;
import oshi.hardware.CentralProcessor.TickType;
import oshi.hardware.HardwareAbstractionLayer;
import oshi.util.Util;

import java.util.List;

/**
 * 封装的Oshi工具类，本地操作系统和Java的硬件信息库
 * @author herenpeng
 * @since 2020-10-12 19:51
 */
public class OshiUtils {

    /**
     * 获取CPU的使用率和未使用率
     * @return
     * @throws Exception
     */
    public List<PieChartData> getCpuInfo() throws Exception {
        SystemInfo systemInfo = new SystemInfo();
        HardwareAbstractionLayer hardware = systemInfo.getHardware();
        CentralProcessor centralProcessor = hardware.getProcessor();
        long[] prevTicks = centralProcessor.getSystemCpuLoadTicks();
        Util.sleep(1000L);
        long[] ticks = centralProcessor.getSystemCpuLoadTicks();
        long user = ticks[TickType.USER.getIndex()] - prevTicks[TickType.USER.getIndex()];
        long iowait = ticks[TickType.IOWAIT.getIndex()] - prevTicks[TickType.IOWAIT.getIndex()];
        return null;
    }

}
