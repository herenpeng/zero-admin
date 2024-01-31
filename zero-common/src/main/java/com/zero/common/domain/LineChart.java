package com.zero.common.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

/**
 * 封装的线状图实体类
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class LineChart implements Serializable {

    private List<String> xAxis;

    private Map<String, List<Long>> data;

}
