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

    public Object invoke(Object... param) throws InvocationTargetException, IllegalAccessException {
        return method.invoke(object, param);
    }
}
