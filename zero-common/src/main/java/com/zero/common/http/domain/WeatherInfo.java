package com.zero.common.http.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

/**
 * weather: {
 * yesterday: {
 * date: '26日星期一',
 * high: '高温 17℃',
 * fx: '北风',
 * low: '低温 16℃',
 * fl: '<![CDATA[2级]]>',
 * type: '阴'
 * },
 * city: '南昌',
 * forecast: [
 * {
 * date: '27日星期二',
 * high: '高温 21℃',
 * fengli: '<![CDATA[1级]]>',
 * low: '低温 15℃',
 * fengxiang: '北风',
 * type: '小雨'
 * },
 * {
 * date: '28日星期三',
 * high: '高温 21℃',
 * fengli: '<![CDATA[2级]]>',
 * low: '低温 15℃',
 * fengxiang: '北风',
 * type: '小雨'
 * },
 * {
 * date: '29日星期四',
 * high: '高温 27℃',
 * fengli: '<![CDATA[3级]]>',
 * low: '低温 17℃',
 * fengxiang: '西南风',
 * type: '晴'
 * },
 * {
 * date: '30日星期五',
 * high: '高温 30℃',
 * fengli: '<![CDATA[3级]]>',
 * low: '低温 19℃',
 * fengxiang: '西南风',
 * type: '晴'
 * },
 * {
 * date: '1日星期六',
 * high: '高温 31℃',
 * fengli: '<![CDATA[3级]]>',
 * low: '低温 21℃',
 * fengxiang: '西南风',
 * type: '晴'
 * }
 * ],
 * ganmao: '感冒低发期，天气舒适，请注意多吃蔬菜水果，多喝水哦。',
 * wendu: '18'
 * }
 * }
 *
 * @author herenpeng
 * @since 2021-04-27 21:28
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class WeatherInfo {

    private Integer status;

    private String desc;

    private Data data;

    @lombok.Data
    @NoArgsConstructor
    public static class Data {
        /**
         * 当前城市
         */
        private String city;
        /**
         * 当前的温度
         */
        private String wendu;
        /**
         * 感冒提醒
         */
        private String ganmao;
        /**
         * 昨天的天气信息
         */
        private YesterdayWeatherInfo yesterday;
        /**
         * 天气预报
         */
        private List<ForecastWeatherInfo> forecast;

        /**
         * date: '26日星期一',
         * high: '高温 17℃',
         * fx: '北风',
         * low: '低温 16℃',
         * fl: '<![CDATA[2级]]>',
         * type: '阴'
         */
        @lombok.Data
        @NoArgsConstructor
        public static class YesterdayWeatherInfo {
            /**
             * 日期
             */
            private String date;
            /**
             * 天气
             */
            private String type;
            /**
             * 最低气温
             */
            private String low;
            /**
             * 最高气温
             */
            private String high;
            /**
             * 风向
             */
            private String fx;
            /**
             * 风力
             */
            private String fl;
        }

        /**
         * {
         * date: '1日星期六',
         * high: '高温 31℃',
         * fengli: '<![CDATA[3级]]>',
         * low: '低温 21℃',
         * fengxiang: '西南风',
         * type: '晴'
         * }
         */
        @lombok.Data
        @NoArgsConstructor
        public static class ForecastWeatherInfo {
            /**
             * 日期
             */
            private String date;
            /**
             * 天气
             */
            private String type;
            /**
             * 最低气温
             */
            private String low;
            /**
             * 最高气温
             */
            private String high;
            /**
             * 风向
             */
            private String fengxiang;
            /**
             * 风力
             */
            private String fengli;
        }

    }

}
