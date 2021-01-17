package com.zero.common.response.domain;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.io.Serializable;

/**
 * HTTP协议response对象的返回体，其中包含了返回的具体数据
 *
 * @author herenpeng
 * @since 2020-09-12 12:27
 */
@ApiModel(value = "响应数据实体类")
@Data
public class ResponseData<T> implements Serializable {

    /**
     * 业务状态码，区别于HTTP协议状态码，
     */
    @ApiModelProperty(value = "业务状态码")
    private Integer code;

    /**
     * 业务提示消息，一般在增删改操作的时候返回
     */
    @ApiModelProperty(value = "业务提示消息")
    private String message;

    /**
     * 返回前端的交互数据
     */
    @ApiModelProperty(value = "业务响应数据")
    private T data;

    private static ResponseData responseData;

    /**
     * 私有构造方法，这样就只能够通过静态方法code()和ok()创建ResponseData对象
     */
    private ResponseData() {
    }

    /**
     * 静态方法
     *
     * @param code 业务状态码
     * @param <T>  返回数据的泛型
     * @return 返回一个业务状态为code的ResponseData对象
     */
    public static <T> ResponseData<T> code(Integer code) {
        responseData = new ResponseData();
        responseData.setCode(code);
        return responseData;
    }

    /**
     * 非静态方法，设置响应体的业务提示消息
     *
     * @param message 业务提示消息
     * @param <T>     返回数据的泛型
     * @return 返回一个返回数据为data的ResponseData对象
     */
    public <T> ResponseData<T> message(String message) {
        responseData.setMessage(message);
        return responseData;
    }

    /**
     * 非静态方法
     *
     * @param data 返回数据
     * @param <T>  返回数据的泛型
     * @return 返回一个返回数据为data的ResponseData对象
     */
    public <T> ResponseData<T> data(T data) {
        responseData.setData(data);
        return responseData;
    }

    /**
     * 静态方法
     *
     * @param <T> 返回数据的泛型
     * @return 返回一个业务状态为20000，返回数据为null的ResponseData对象
     */
    public static <T> ResponseData<T> ok() {
        return code(CodeEnum.OK.getValue());
    }

    /**
     * 静态方法
     *
     * @param data 返回数据
     * @param <T>  返回数据的泛型
     * @return 返回一个业务状态为20000，返回数据为data的ResponseData对象
     */
    public static <T> ResponseData<T> ok(T data) {
        return ok().data(data);
    }

}
