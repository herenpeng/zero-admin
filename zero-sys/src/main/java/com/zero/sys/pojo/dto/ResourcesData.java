package com.zero.sys.pojo.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ResourcesData implements Serializable {

    private String time;
    private Long accessNum;
    private Long consumeTime;

}
