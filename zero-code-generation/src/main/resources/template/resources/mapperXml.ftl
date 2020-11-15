<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN" "http://mybatis.org/dtd/mybatis-3-mapper.dtd">
<mapper namespace="${basePackageName}.mapper.${entityName}Mapper">

    <resultMap id="resultMap" type="${basePackageName}.entity.${entityName}">
    <#list tableColumnList as column>
    <#if column.name == "id">
         <id column="${column.name}" jdbcType="${column.jdbcType}" property="${column.javaName}"/>
    </#if>
    <#if column.name == "id">
        <result column="${column.name}" jdbcType="${column.jdbcType}" property="${column.javaName}"/>
    </#if>
    </#list>
    </resultMap>

    <sql id="baseColumn">
        <#list tableColumnList as column>${column.name}<#if (column_has_next)>,</#if></#list>
    </sql>

    <select id="getPage" resultMap="resultMap">
        select <#list tableColumnList as column>
            ${column.name}<#if (column_has_next)>,</#if>
            </#list>
        from ${name}
        where deleted = 0
        <#list tableColumnList as column>
        <#if column.name != "id" && column.name != "create_time" && column.name != "create_user_id" && column.name != "update_time" && column.name != "update_user_id" && column.name != "deleted">
        <#if column.javaType == "String">
        <if test="query${entityName}.${column.name} != null and query${entityName}.${column.name} != ''">
            and ${column.name} like concat('%', ${"#"}{query${entityName}.${javaName}, '%')
        </if>
        <#else>
        <if test="query${entityName}.${column.name} != null">
            and ${column.name} = ${"#"}{query${entityName}.${javaName}}
        </if>
        </#if>
        </#if>
        </#list>
    </select>

</mapper>