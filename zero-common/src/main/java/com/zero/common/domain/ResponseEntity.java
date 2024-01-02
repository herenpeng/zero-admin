package com.zero.common.domain;

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
public class ResponseEntity<T> implements Serializable {

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
    private ResponseEntity() {
    }

    /**
     * 静态方法
     *
     * @param code 业务状态码
     * @param <T>  返回数据的泛型
     * @return 返回一个业务状态为code的ResponseData对象
     */
    private static <T> ResponseEntity<T> code(Integer code) {
        ResponseEntity<T> responseEntity = new ResponseEntity<>();
        responseEntity.setCode(code);
        return responseEntity;
    }


    public static <T> ResponseEntity<T> code(Integer code, String message) {
        ResponseEntity<T> responseEntity = code(code);
        responseEntity.setMessage(message);
        return responseEntity;
    }


    /**
     * 静态方法
     *
     * @param <T> 返回数据的泛型
     * @return 返回一个业务状态为20000，返回数据为null的ResponseData对象
     */
    public static <T> ResponseEntity<T> ok() {
        return code(CodeEnum.OK.value());
    }

    /**
     * 静态方法
     *
     * @param data 返回数据
     * @param <T>  返回数据的泛型
     * @return 返回一个业务状态为20000，返回数据为data的ResponseData对象
     */
    public static <T> ResponseEntity<T> ok(T data) {
        ResponseEntity<T> responseEntity = ok();
        responseEntity.setData(data);
        return responseEntity;
    }


    /**
     * 非静态方法，设置响应体的业务提示消息
     *
     * @param message 业务提示消息
     * @param <T>     返回数据的泛型
     * @return 返回一个返回数据为data的ResponseData对象
     */
    public static <T> ResponseEntity<T> message(String message) {
        ResponseEntity<T> responseEntity = ok();
        responseEntity.setMessage(message);
        return responseEntity;
    }


    private enum CodeEnum {
        /**
         * code为20000，代表正常返回数据
         */
        OK(20000);

        private final Integer value;

        CodeEnum(int value) {
            this.value = value;
        }

        public int value() {
            return this.value;
        }

    }


}
