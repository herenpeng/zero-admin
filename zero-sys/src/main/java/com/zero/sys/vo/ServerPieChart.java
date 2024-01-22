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
public class ServerPieChart {

    private Cpu cpu;

    private Mem mem;

    private Jvm jvm;

}
