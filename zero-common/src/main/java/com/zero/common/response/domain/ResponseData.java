package com.zero.common.response.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * HTTP协议response对象的返回体，其中包含了返回的具体数据
 * @author herenpeng
 * @since 2020-09-12 12:27
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class ResponseData<T> {

    /**
     * 业务状态码，区别于HTTP协议状态码，
     */
    private Integer code;

    /**
     * 返回前端的交互数据
     */
    private T data;

    /**
     * 重写一个单参数的构造方法
     *
     * @param code 业务状态码
     */
    public ResponseData(Integer code) {
        this.code = code;
    }

}
