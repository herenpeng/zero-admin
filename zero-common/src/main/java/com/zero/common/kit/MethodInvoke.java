package com.zero.common.kit;

import lombok.Data;
import lombok.RequiredArgsConstructor;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

@Data
@RequiredArgsConstructor
public class MethodInvoke {

    private final Method method;

    private final Object object;

    public void invoke(Object... param) throws InvocationTargetException, IllegalAccessException {
        method.invoke(object, param);
    }
}
