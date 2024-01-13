<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN" "http://mybatis.org/dtd/mybatis-3-mapper.dtd">
<mapper namespace="${javaPackageName}.mapper.${entityName}Mapper">

    <resultMap id="resultMap" type="${javaPackageName}.entity.${entityName}">
    <#list tableColumnList as column>
    <#if column.name == "id">
        <id column="${column.name}" jdbcType="${column.jdbcType}" property="${column.javaName}"/>
    <#else>
        <result column="${column.name}" jdbcType="${column.jdbcType}" property="${column.javaName}"/>
    </#if>
    </#list>
    </resultMap>

    <sql id="baseColumn">
        <#list tableColumnList as column><#if column.name != "create_time" && column.name != "create_user_id" && column.name != "update_time" && column.name != "update_user_id" && column.name != "deleted"><#if column_index != 0>,</#if>`${column.name}`</#if></#list>
    </sql>

    <sql id="baseQuery">
        <#list tableColumnList as column>
        <#if column.name != "id" && column.name != "create_time" && column.name != "create_user_id" && column.name != "update_time" && column.name != "update_user_id">
        <#if column.javaType == "String">
        <if test="query${entityName}.${column.javaName} != null and query${entityName}.${column.javaName} != ''">
            and ${column.name} like concat('%', ${"#"}{query${entityName}.${column.javaName}}, '%')
        </if>
        <#else>
        <if test="query${entityName}.${column.javaName} != null">
            and ${column.name} = ${"#"}{query${entityName}.${column.javaName}}
        </if>
        </#if>
        </#if>
        </#list>
    </sql>

    <select id="getPage" resultMap="resultMap">
        select <#list tableColumnList as column>`${column.name}` as ${column.name}<#if (column_has_next)>,</#if></#list>
        from ${name}
        where 1 = 1
        <include refid="baseQuery"/>
    </select>

    <select id="getList" resultMap="resultMap">
        select <#list tableColumnList as column>`${column.name}` as ${column.name}<#if (column_has_next)>,</#if></#list>
        from ${name}
        where deleted = 0
        <include refid="baseQuery"/>
    </select>


    <#if tree>
    <select id="getByParentId" resultMap="resultMap">
        select <#list tableColumnList as column>`${column.name}` as ${column.name}<#if (column_has_next)>,</#if></#list>
        from ${name}
        where deleted = 0
        <if test="parentId != null">
            and parent_id = ${"#"}{parentId}
        </if>
        order by sort
    </select>
    </#if>

</mapper>