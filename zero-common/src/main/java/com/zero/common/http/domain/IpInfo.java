package com.zero.common.http.domain;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * {
 * "data": {
 * "area": "",
 * "country": "中国",
 * "isp_id": "1000323",
 * "queryIp": "47.114.99.214",
 * "city": "杭州",
 * "ip": "47.114.99.214",
 * "isp": "阿里云",
 * "county": "",
 * "region_id": "330000",
 * "area_id": "",
 * "county_id": null,
 * "region": "浙江",
 * "country_id": "CN",
 * "city_id": "330100"
 * },
 * "msg": "query success",
 * "code": 0
 * }
 *
 * @author herenpeng
 * @since 2021-02-16 12:47
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class IpInfo {

    /**
     * 业务状态码，0为成功
     */
    private Integer code;

    /**
     * 响应信息
     */
    private String msg;

    /**
     * 响应数据信息
     */
    private Data data;


    @lombok.Data
    @NoArgsConstructor
    @AllArgsConstructor
    public class Data {
        /**
         * 区域
         */
        private String areaId;
        private String area;
        /**
         * 国家，例如：中国
         */
        private String countryId;
        private String country;
        /**
         * 区域，省，例如：浙江
         */
        private String regionId;
        private String region;
        /**
         * 城市，例如：杭州
         */
        private String cityId;
        private String city;
        /**
         * 县
         */
        private String countyId;
        private String county;
        /**
         * 因特网提供商，例如：阿里云
         */
        private String ispId;
        private String isp;
        /**
         * 查询的ip信息
         */
        @JsonProperty(value = "queryIp")
        private String queryIp;
        private String ip;
    }

}
