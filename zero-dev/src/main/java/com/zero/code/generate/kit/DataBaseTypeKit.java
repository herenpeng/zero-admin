package com.zero.code.generate.kit;

import java.util.HashMap;
import java.util.Map;

/**
 * 数据类型常量，能够通过数据库类型映射为JDBC类型和JAVA类型
 *
 * @author herenpeng
 * @since 2020-11-12 23:56
 */
public class DataBaseTypeKit {

    private static final Map<String, String> jdbcTypeMap = new HashMap<>(16);
    private static final Map<String, String> javaTypeMap = new HashMap<>(16);

    static {
        initJdbcTypeMap();
        initJavaTypeMap();
    }

    /**
     * 初始化数据库类型和Jdbc类型的映射关系
     */
    private static void initJdbcTypeMap() {
        jdbcTypeMap.put("int", "INTEGER");
        jdbcTypeMap.put("bigint", "BIGINT");
        jdbcTypeMap.put("char", "CHAR");
        jdbcTypeMap.put("varchar", "VARCHAR");
        jdbcTypeMap.put("datetime", "TIMESTAMP");
        jdbcTypeMap.put("timestamp", "TIMESTAMP");
        jdbcTypeMap.put("date", "DATE");
        jdbcTypeMap.put("time", "TIME");
        jdbcTypeMap.put("tinyint", "BOOLEAN");
        jdbcTypeMap.put("decimal", "DECIMAL");
        jdbcTypeMap.put("numeric", "NUMERIC");
        jdbcTypeMap.put("float", "FLOAT");
        jdbcTypeMap.put("double", "DOUBLE");
    }

    /**
     * 初始化数据库类型和Java类型的映射关系
     */
    private static void initJavaTypeMap() {
        javaTypeMap.put("int", "Integer");
        javaTypeMap.put("bigint", "Long");
        javaTypeMap.put("char", "String");
        javaTypeMap.put("varchar", "String");
        javaTypeMap.put("datetime", "Date");
        javaTypeMap.put("timestamp", "Date");
        javaTypeMap.put("date", "Date");
        javaTypeMap.put("time", "Date");
        javaTypeMap.put("tinyint", "Boolean");
        javaTypeMap.put("decimal", "BigDecimal");
        javaTypeMap.put("numeric", "BigDecimal");
        javaTypeMap.put("float", "Double");
        javaTypeMap.put("double", "Double");
    }

    /**
     * 获取数据库类型对应的JDBC类型
     *
     * @param databaseType 数据库类型
     * @return JDBC类型
     */
    public static String getJdbcType(String databaseType) {
        return jdbcTypeMap.get(databaseType);
    }

    /**
     * 获取数据库类型对应的Java类型
     *
     * @param databaseType 数据库类型
     * @return Java类型
     */
    public static String getJavaType(String databaseType) {
        return javaTypeMap.get(databaseType);
    }

}
