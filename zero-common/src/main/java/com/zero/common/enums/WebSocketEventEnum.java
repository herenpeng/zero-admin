package com.zero.common.enums;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public enum WebSocketEventEnum {

    SERVER(1);

    private final int value;

}
