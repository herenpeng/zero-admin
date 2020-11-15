package com.zero.code.generation.constant;

import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;
import java.util.HashMap;
import java.util.Map;

/**
 * 数据类型常量，能够通过数据库类型映射为JDBC类型和JAVA类型
 *
 * @author herenpeng
 * @since 2020-11-12 23:56
 */
@Component
public class DataBaseTypeConst {

    private Map<String, String> JdbcTypeMap = new HashMap<>(16);
    private Map<String, String> JavaTypeMap = new HashMap<>(16);

    @PostConstruct
    private void init() {
        initJdbcTypeMap();
        initJavaTypeMap();
    }

    /**
     * 初始化数据库类型和Jdbc类型的映射关系
     */
    private void initJdbcTypeMap() {
        JdbcTypeMap.put("int", "INTEGER");
        JdbcTypeMap.put("bigint", "BIGINT");
        JdbcTypeMap.put("char", "CHAR");
        JdbcTypeMap.put("varchar", "VARCHAR");
        JdbcTypeMap.put("datetime", "TIMESTAMP");
        JdbcTypeMap.put("timestamp", "TIMESTAMP");
        JdbcTypeMap.put("date", "DATE");
        JdbcTypeMap.put("time", "TIME");
        JdbcTypeMap.put("tinyint", "BOOLEAN");
        JdbcTypeMap.put("decimal", "DECIMAL");
        JdbcTypeMap.put("numeric", "NUMERIC");
        JdbcTypeMap.put("float", "FLOAT");
        JdbcTypeMap.put("double", "DOUBLE");
    }

    /**
     * 初始化数据库类型和Java类型的映射关系
     */
    private void initJavaTypeMap() {
        JavaTypeMap.put("int", "Integer");
        JavaTypeMap.put("bigint", "Long");
        JavaTypeMap.put("char", "String");
        JavaTypeMap.put("varchar", "String");
        JavaTypeMap.put("datetime", "Date");
        JavaTypeMap.put("timestamp", "Date");
        JavaTypeMap.put("date", "Date");
        JavaTypeMap.put("time", "Date");
        JavaTypeMap.put("tinyint", "Boolean");
        JavaTypeMap.put("decimal", "BigDecimal");
        JavaTypeMap.put("numeric", "BigDecimal");
        JavaTypeMap.put("float", "Double");
        JavaTypeMap.put("double", "Double");
    }

    /**
     * 获取数据库类型对应的JDBC类型
     *
     * @param databaseType 数据库类型
     * @return JDBC类型
     * @throws Exception
     */
    public String getJdbcType(String databaseType) {
        return JdbcTypeMap.get(clearPrecision(databaseType));
    }

    /**
     * 获取数据库类型对应的Java类型
     *
     * @param databaseType 数据库类型
     * @return Java类型
     * @throws Exception
     */
    public String getJavaType(String databaseType) {
        return JavaTypeMap.get(clearPrecision(databaseType));
    }

    /**
     * 数据库类型精度匹配正则表达式
     */
    private static final String REGEX = "\\([0-9]+\\)";

    /**
     * 清除数据库类型中的精度，保留数据库类型名称
     *
     * @param dataBaseType 带精度的数据库类型名称
     * @return 数据库类型名称
     */
    private String clearPrecision(String dataBaseType) {
        return dataBaseType.replaceAll(REGEX, "");
    }

}
