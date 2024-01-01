package com.zero.common.response.domain;

import com.zero.common.response.CodeEnum;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import java.io.Serializable;

/**
 * HTTP协议response对象的返回体，其中包含了返回的具体数据
 *
 * @author herenpeng
 * @since 2020-09-12 12:27
 */
@Schema(name = "响应数据实体类")
@Data
public class ResponseData<T> implements Serializable {

    /**
     * 业务状态码，区别于HTTP协议状态码，
     */
    @Schema(name = "业务状态码")
    private Integer code;

    /**
     * 业务提示消息，一般在增删改操作的时候返回
     */
    @Schema(name = "业务提示消息")
    private String message;

    /**
     * 返回前端的交互数据
     */
    @Schema(name = "业务响应数据")
    private T data;

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
    private static <T> ResponseData<T> code(Integer code) {
        ResponseData<T> responseData = new ResponseData<>();
        responseData.setCode(code);
        return responseData;
    }


    public static <T> ResponseData<T> code(Integer code, String message) {
        ResponseData<T> responseData = code(code);
        responseData.setMessage(message);
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
        ResponseData<T> responseData = ok();
        responseData.setData(data);
        return responseData;
    }


    /**
     * 非静态方法，设置响应体的业务提示消息
     *
     * @param message 业务提示消息
     * @param <T>     返回数据的泛型
     * @return 返回一个返回数据为data的ResponseData对象
     */
    public static <T> ResponseData<T> message(String message) {
        ResponseData<T> responseData = ok();
        responseData.setMessage(message);
        return responseData;
    }

}
