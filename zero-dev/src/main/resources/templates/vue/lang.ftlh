export default {
  table: {
    ${vuePackage}: {
      ${entityName?uncap_first}: {
    <#list tableColumnList as column>
      <#if column.name != "id" && column.name != "create_time" && column.name != "create_user_id" && column.name != "update_time" && column.name != "update_user_id" && column.name != "deleted">
        ${column.javaName}: '${column.comment}',
      </#if>
    </#list>
    <#list tableColumnList as column>
      <#if column.name != "id" && column.name != "create_time" && column.name != "create_user_id" && column.name != "update_time" && column.name != "update_user_id" && column.name != "deleted">
        ${column.javaName}Placeholder: '请输入${column.comment}',
      </#if>
    </#list>
    <#list tableColumnList as column>
      <#if column.name != "id" && column.name != "create_time" && column.name != "create_user_id" && column.name != "update_time" && column.name != "update_user_id" && column.name != "deleted">
        ${column.javaName}Rule: '请输入${column.comment}'<#if column_index &lt; (tableColumnList?size - 6) >,</#if>
      </#if>
    </#list>
      }
    }
  }
}
