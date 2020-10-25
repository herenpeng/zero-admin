package com.zero.common.exception;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 自定义异常
 *
 * @author herenpeng
 * @since 2020-10-25 11:49
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class MyException extends RuntimeException {

    private MyExceptionEnum myExceptionEnum;

}
