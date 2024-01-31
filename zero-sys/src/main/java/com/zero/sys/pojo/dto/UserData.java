package com.zero.sys.pojo.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class UserData implements Serializable {

    private String time;
    private Long loginNum;
    private Long loginUserNum;

}
