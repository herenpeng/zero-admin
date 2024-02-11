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
        <el-option value="true" label="是" />
        <el-option value="false" label="否" />
      </el-select>
      </#if>
        </#if>
      </#list>
      <el-button class="filter-item" type="primary" icon="el-icon-search" @click="handleFilter">
        {{ $t('table.search') }}
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
      <el-table-column label="序号" type="index" sortable="true" align="center" width="80" />
      <#list tableColumnList as column>
        <#if column.name != "id" && column.name != "create_time" && column.name != "create_user_id" &&
        column.name != "update_time" && column.name != "update_user_id" && column.name != "deleted" &&
        (!tree || column.name != "parent_id")>
          <#if column.javaType == "String" || column.javaType == "Integer">
      <el-table-column label="${column.comment}" width="150px" align="center">
        <template v-slot="{row}">
          <span>{{ row.${column.javaName} }}</span>
        </template>
      </el-table-column>
          </#if>
          <#if column.javaType == "Boolean">
      <el-table-column label="${column.comment}" width="100px" align="center">
        <template v-slot="{row}">
          <span>{{ row.${column.javaName} ? '是' : '否' }}</span>
        </template>
      </el-table-column>
          </#if>
        </#if>
      </#list>
      <el-table-column label="操作" align="center" width="250px" class-name="small-padding fixed-width" fixed="right">
        <template v-slot="{row}">
          <el-button type="success" size="mini" icon="el-icon-finished" @click="handleRecover(row)">
            {{ $t('table.recovery') }}
          </el-button>
          <el-button type="danger" size="mini" icon="el-icon-delete" @click="handleRecoverDelete(row)">
            {{ $t('table.deleteRecovery') }}
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

  </div>
</template>
<script>
import {
  get${entityName}RecoverPage,
  recover${entityName},
  recoverDelete${entityName}
} from '@/api/${vuePackage?replace(".","/")}'
import Pagination from '@/components/Pagination/index.vue'

export default {
  name: 'Recover${entityName}',
  components: { Pagination },
  data() {
    return {
      tableKey: 0,
      list: null,
      page: {
        currentPage: 1,
        size: 10,
        total: 0
      },
      listLoading: false,
      listQuery: {
        path: null,
        name: null,
        metaTitle: null,
        enabled: null,
        queryRoleId: null
      },
      tagType: ['', 'success', 'info', 'warning', 'danger'],
      roles: null,
      downloadLoading: false
    }
  },
  created() {
    this.loadData()
  },
  methods: {
    loadData() {
      this.listLoading = true
      get${entityName}RecoverPage(this.page, this.listQuery).then(res => {
        setTimeout(() => {
          if (this.listLoading === true) {
            this.listLoading = false
          }
        }, 1000)
        const page = res.data
        this.list = page.records
        this.page.total = page.total
        this.listLoading = false
      })
    },
    handlePagination(page) {
      this.page.currentPage = page.page
      this.page.size = page.limit
      this.loadData()
    },
    handleRecover(row) {
      recover${entityName}(row.id).then(res => {
        this.loadData()
      })
    },
    handleRecoverDelete(row) {
      this.$confirm('此操作将彻底删除该菜单, 数据将不可恢复, 是否继续?', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        recoverDelete${entityName}(row.id).then(res => {
          this.$message({
            type: 'success',
            message: res.message
          })
          this.loadData()
        })
      }).catch(() => {
        this.$message({
          type: 'info',
          message: '已取消删除'
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
      this.downloadLoading = true
      import('@/vendor/Export2Excel').then(excel => {
        const tHeader = ['timestamp', 'title', 'type', 'importance', 'status']
        const filterVal = ['timestamp', 'title', 'type', 'importance', 'status']
        const data = this.formatJson(filterVal)
        excel.export_json_to_excel({
          header: tHeader,
          data,
          filename: 'table-list'
        })
        this.downloadLoading = false
      })
    }
  }
}
</script>
