<template>
  <div class="app-container">
    <div class="filter-container">
      <#list tableColumnList as column>
        <#if column.query>
      <#if column.javaType == "String">
      <el-input v-model="listQuery.${column.javaName}" placeholder="${column.comment}" style="width: 200px;" class="filter-item"
                @keyup.enter.native="handleFilter"
      />
      </#if>
      <#if column.javaType == "Boolean">
      <el-select v-model="listQuery.${column.javaName}" placeholder="${column.comment}" clearable class="filter-item"
                 @change="handleFilter"
      >
        <el-option value="true" :label="$t('common.true')" />
        <el-option value="false" :label="$t('common.false')" />
      </el-select>
      </#if>
        </#if>
      </#list>
      <el-button class="filter-item" type="primary" icon="el-icon-search" @click="handleFilter">
        {{ $t('table.search') }}
      </el-button>
      <el-button class="filter-item" style="margin-left: 10px;" type="primary" icon="el-icon-edit"
                 @click="handleCreate"
      >
        {{ $t('table.add') }}
      </el-button>
      <el-button :loading="downloadLoading" class="filter-item" type="primary" icon="el-icon-download"
                 @click="handleDownload"
      >
        {{ $t('table.export') }}
      </el-button>
    </div>

    <el-table
      :key="tableKey"
      v-loading="listLoading"
      :data="list"
      border
      fit
      size="mini"
      style="width: 100%;"
      @sort-change="sortChange"
    >
      <el-table-column :label="$t('table.id')" type="index" sortable="true" align="center" width="80px" />
      <#list tableColumnList as column>
        <#if column.name != "id" && column.name != "create_time" && column.name != "create_user_id" && column.name != "update_time" && column.name != "update_user_id" && column.name != "deleted">
          <#if column.javaType == "String" || column.javaType == "Integer">
      <el-table-column :label="$t('table.${vuePackage}.${entityName?uncap_first}.${column.javaName}')" width="150px" align="center">
        <template v-slot="{row}">
          <span>{{ row.${column.javaName} }}</span>
        </template>
      </el-table-column>
          </#if>
          <#if column.javaType == "Boolean">
      <el-table-column :label="$t('table.${vuePackage}.${entityName?uncap_first}.${column.javaName}')" width="100px" align="center">
        <template v-slot="{row}">
          <span>{{ row.${column.javaName} ? $t('common.true') : $t('common.false') }}</span>
        </template>
      </el-table-column>
          </#if>
        </#if>
      </#list>
      <el-table-column :label="$t('table.actions')" align="center" class-name="small-padding fixed-width" width="220px" fixed="right">
        <template v-slot="{row}">
          <el-button type="primary" size="mini" icon="el-icon-edit" @click="handleUpdate(row)">
            {{ $t('table.edit') }}
          </el-button>
          <el-button type="danger" size="mini" icon="el-icon-delete" @click="deleteData(row)">
            {{ $t('table.delete') }}
          </el-button>
        </template>
      </el-table-column>
    </el-table>

    <pagination v-show="page.total > 0"
                :total="page.total"
                :page="page.currentPage"
                :limit="page.size"
                @pagination="handlePagination"
    />

    <el-dialog :title="$t(textMap[dialogStatus])" :visible.sync="dialogFormVisible">
      <el-form ref="dataForm" :rules="rules" :model="${entityName?uncap_first}" label-position="left" label-width="120px"
               style="width: 400px; margin-left:50px;"
      >
      <#list tableColumnList as column>
        <#if column.name != "id" && column.name != "create_time" && column.name != "create_user_id" && column.name != "update_time" && column.name != "update_user_id" && column.name != "deleted">
          <#if column.javaType == "String">
        <el-form-item :label="$t('table.${vuePackage}.${entityName?uncap_first}.${column.javaName}')" prop="${column.javaName}">
          <el-input v-model="${entityName?uncap_first}.${column.javaName}" :placeholder="$t('table.${vuePackage}.${entityName?uncap_first}.${column.javaName}Placeholder')" />
        </el-form-item>
          <#elseif column.javaType == "Integer">
        <el-form-item :label="$t('table.${vuePackage}.${entityName?uncap_first}.${column.javaName}')" prop="${column.javaName}">
          <el-input v-model="${entityName?uncap_first}.${column.javaName}" type="number" :placeholder="$t('table.${vuePackage}.${entityName?uncap_first}.${column.javaName}Placeholder')" />
        </el-form-item>
          <#elseif column.javaType == "Boolean">
        <el-form-item :label="$t('table.${vuePackage}.${entityName?uncap_first}.${column.javaName}')" prop="${column.javaName}">
          <el-switch
                v-model="${entityName?uncap_first}.${column.javaName}"
                style="width: 190px"
                :active-text="$t('common.true')"
                :inactive-text="$t('common.false')"
          />
        </el-form-item>
          </#if>
        </#if>
      </#list>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button @click="dialogFormVisible = false">{{ $t('table.close') }}</el-button>
        <el-button type="primary" @click="dialogStatus==='create'?createData():updateData()">{{ $t('table.save') }}</el-button>
      </div>
    </el-dialog>

  </div>
</template>

<script>
import {
  get${entityName}Page,
  create${entityName},
  update${entityName},
  delete${entityName},
  export${entityName}Excel
} from '@/api/${vuePackage?replace(".","/")}/${entityName?uncap_first}'
import Pagination from '@/components/Pagination'

export default {
  name: '${entityName}',
  components: { Pagination },
  data() {
    return {
      tableKey: 0,
      list: [],
      page: {
        currentPage: 1,
        size: 10,
        total: 0
      },
      listLoading: false,
      <#assign queryNumber = 0>
      <#list tableColumnList as column>
        <#if column.query>
          <#assign queryNumber = queryNumber + 1>
        </#if>
      </#list>
      <#assign hasQueryNumber = 0>
      listQuery: {
        <#list tableColumnList as column>
          <#if column.query>
            <#assign hasQueryNumber = hasQueryNumber + 1>
        ${column.javaName}: null<#if hasQueryNumber &lt; queryNumber>,</#if>
          </#if>
        </#list>
      },
      tagType: ['', 'success', 'info', 'warning', 'danger'],
      ${entityName?uncap_first}: {
        <#list tableColumnList as column>
          <#if column.name != "create_time" && column.name != "create_user_id" && column.name != "update_time" && column.name != "update_user_id" && column.name != "deleted">
        ${column.javaName}: null<#if column_index &lt; (tableColumnList?size - 6) >,</#if>
          </#if>
        </#list>
      },
      dialogFormVisible: false,
      dialogStatus: '',
      textMap: {
        create: 'table.add',
        update: 'table.edit'
      },
      downloadLoading: false,
    }
  },
  computed: {
    rules() {
      return {
        <#list tableColumnList as column>
        <#if column.name != "id" && column.name != "create_time" && column.name != "create_user_id" && column.name != "update_time" && column.name != "update_user_id" && column.name != "deleted">
        ${column.javaName}: [{ required: true, message: this.$t('table.${vuePackage}.${entityName?uncap_first}.${column.javaName}Rule'), trigger: 'change' }]<#if column_index &lt; (tableColumnList?size - 6) >,</#if>
        </#if>
        </#list>
      }
    }
  },
  created() {
    this.loadData()
  },
  methods: {
    loadData() {
      this.listLoading = true
      get${entityName}Page(this.page, this.listQuery).then(res => {
        setTimeout(() => {
          if (this.listLoading === true) {
            this.listLoading = false
          }
        }, 1000)
        const page = res.data
        this.list = page.records
        this.page.total = page.total
        this.listLoading = false
        this.${entityName?uncap_first}Tree = this.buildTree(this.list)
      })
    },
    handlePagination(page) {
      this.page.currentPage = page.page
      this.page.size = page.limit
      this.loadData()
    },
    handleCreate() {
      this.${entityName?uncap_first} = {}
      this.dialogStatus = 'create'
      this.dialogFormVisible = true
      this.$nextTick(() => {
        this.$refs['dataForm'].clearValidate()
      })
    },
    createData() {
      this.$refs['dataForm'].validate((valid) => {
        if (valid) {
          create${entityName}(this.${entityName?uncap_first}).then((res) => {
            this.dialogFormVisible = false
            this.$notify({
              title: this.$t('common.success'),
              message: res.message,
              type: 'success',
              duration: 2000
            })
            this.loadData()
          })
        }
      })
    },
    handleUpdate(row) {
      this.${entityName?uncap_first} = Object.assign({}, row)
      this.dialogStatus = 'update'
      this.dialogFormVisible = true
      this.$nextTick(() => {
        this.$refs['dataForm'].clearValidate()
      })
    },
    updateData() {
      this.$refs['dataForm'].validate((valid) => {
        if (valid) {
          update${entityName}(this.${entityName?uncap_first}).then((res) => {
            this.dialogFormVisible = false
            this.$notify({
              title: this.$t('common.success'),
              message: res.message,
              type: 'success',
              duration: 2000
            })
            this.loadData()
          })
        }
      })
    },
    deleteData(row) {
      this.$confirm(this.$t('common.deleteTip'), this.$t('common.tip'), {
        confirmButtonText: this.$t('common.confirm'),
        cancelButtonText: this.$t('common.cancel'),
        type: 'warning'
      }).then(() => {
        delete${entityName}(row.id).then(res => {
          this.$message({
            type: 'success',
            message: res.message
          })
          this.loadData()
        })
      }).catch(() => {
        this.$message({
          type: 'info',
          message: this.$t('common.cancelDelete')
        })
      })
    },
    handleFilter() {
      this.page.currentPage = 1
      this.loadData()
    },
    sortChange(data) {
      const { prop, order } = data
      if (prop === 'id') {
        this.sortByID(order)
      }
    },
    sortByID(order) {
      if (order === 'ascending') {
        this.listQuery.sort = '+id'
      } else {
        this.listQuery.sort = '-id'
      }
      this.handleFilter()
    },
    handleDownload() {
      export${entityName}Excel(this.listQuery, this.$t('common.exportFileName'))
    }
  }
}
</script>
<style scoped>

</style>
