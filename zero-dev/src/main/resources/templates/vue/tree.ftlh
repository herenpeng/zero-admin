<template>
  <div class="app-container">
    <el-row :gutter="20">
      <el-col :span="6">
        <el-input
          v-model="filterText"
          placeholder="输入关键字进行过滤"
        />
        <el-tree
          ref="tree"
          class="filter-tree"
          :data="${entityName?uncap_first}Tree"
          node-key="id"
          :default-expanded-keys="expandedKeys"
          :filter-node-method="filterNode"
          draggable
          @node-drop="handleDrop"
          @node-expand="nodeExpand"
          @node-collapse="nodeCollapse"
        >
          <span slot-scope="{ node }" class="custom-tree-node">
            <span><i :class="node.data.name" />{{ node.data.name }}</span>
          </span>
        </el-tree>
      </el-col>
      <el-col :span="18">
        <div class="filter-container">
          <el-button class="filter-item" type="primary" icon="el-icon-search" @click="handleFilter">
            {{ $t('table.search') }}
          </el-button>
          <el-button class="filter-item" style="margin-left: 10px;" type="primary" icon="el-icon-edit"
                     @click="handleCreate(null)"
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
          row-key="id"
          border
          fit
          size="mini"
          style="width: 100%;"
          :tree-props="{children: 'children', hasChildren: 'hasChildren'}"
          @sort-change="sortChange"
        >
          <el-table-column :label="$t('table.id')" sortable="true" align="center" width="80" />
          <#list tableColumnList as column>
            <#if column.name != "id" && column.name != "create_time" && column.name != "create_user_id" &&
            column.name != "update_time" && column.name != "update_user_id" && column.name != "deleted" &&
            column.name != "parent_id">
              <#if column.javaType == "String" || column.javaType == "Integer">
          <el-table-column label="${column.comment}" width="150px" align="center">
            <template v-slot="{row}">
              <span>{{ row.${column.javaName} }}</span>
            </template>
          </el-table-column>
              <#elseif column.javaType == "Boolean">
          <el-table-column label="${column.comment}" width="100px" align="center">
            <template v-slot="{row}">
              <span>{{ row.${column.javaName} ? $t('common.true') : $t('common.false') }}</span>
            </template>
          </el-table-column>
              </#if>
            </#if>
          </#list>
          <el-table-column :label="$t('table.actions')" align="center" class-name="small-padding fixed-width" width="280px" fixed="right">
            <template v-slot="{row}">
              <el-button type="primary" size="mini" icon="el-icon-edit" @click="handleUpdate(row)">
                {{ $t('table.edit') }}
              </el-button>
              <el-button type="danger" size="mini" icon="el-icon-delete" @click="deleteData(row)">
                {{ $t('table.delete') }}
              </el-button>
              <el-button size="mini" type="warning" icon="el-icon-circle-plus-outline" @click="handleCreate(row)" />
            </template>
          </el-table-column>
        </el-table>
      </el-col>
    </el-row>

    <el-dialog :title="$t(textMap[dialogStatus])" :visible.sync="dialogFormVisible">
      <el-form ref="dataForm" :rules="rules" :model="${entityName?uncap_first}" label-position="left" label-width="120px"
               style="width: 400px; margin-left:50px;"
      >
        <#list tableColumnList as column>
          <#if column.name != "id" && column.name != "create_time" && column.name != "create_user_id" && column.name != "update_time" && column.name != "update_user_id" && column.name != "deleted">
            <#if column.javaType == "String">
        <el-form-item label="${column.comment}" prop="${column.javaName}">
          <el-input v-model="${entityName?uncap_first}.${column.javaName}" placeholder="请输入${column.comment}" />
        </el-form-item>
            <#elseif column.javaType == "Integer">
        <el-form-item label="${column.comment}" prop="${column.javaName}">
          <el-input v-model="${entityName?uncap_first}.${column.javaName}" type="number" placeholder="请输入${column.comment}" />
        </el-form-item>
            <#elseif column.javaType == "Boolean">
        <el-form-item label="${column.comment}" prop="${column.javaName}">
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
  get${entityName}Tree,
  move${entityName},
  create${entityName},
  update${entityName},
  delete${entityName},
  export${entityName}Excel
} from '@/api/${vuePackage?replace(".","/")}'

export default {
  name: '${entityName}',
  data() {
    return {
      tableKey: 0,
      list: [],
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
        ${column.javaName}: null<#if hasQueryNumber &lt; queryNumber>, </#if>
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
      rules: {
        <#list tableColumnList as column>
        <#if column.name != "id" && column.name != "create_time" && column.name != "create_user_id" && column.name != "update_time" && column.name != "update_user_id" && column.name != "deleted">
        ${column.javaName}: [{ required: true, message: '请输入${column.comment}', trigger: 'change' }]<#if column_index &lt; (tableColumnList?size - 6) >,</#if>
        </#if>
        </#list>
      },
      downloadLoading: false,
      ${entityName?uncap_first}Tree: [],
      filterText: '',
      expandedKeys: []
    }
  },
  watch: {
    filterText(val) {
      this.$refs.tree.filter(val)
    }
  },
  created() {
    this.loadData()
  },
  methods: {
    loadData() {
      this.listLoading = true
      get${entityName}Tree().then(res => {
        setTimeout(() => {
          if (this.listLoading === true) {
            this.listLoading = false
          }
        }, 1000)
        this.list = res.data
        this.listLoading = false
        this.${entityName?uncap_first}Tree = this.buildTree(this.list)
      })
    },
    buildTree(${entityName?uncap_first}s) {
      const tree = []
      for (const ${entityName?uncap_first} of ${entityName?uncap_first}s) {
        ${entityName?uncap_first}.disabled = ${entityName?uncap_first}.hidden || !${entityName?uncap_first}.enabled
        const node = JSON.parse(JSON.stringify(${entityName?uncap_first}))
        tree.push(node)
        this.buildTree(node.children)
      }
      return tree
    },
    filterNode(value, data) {
      if (!value) {
        return true
      }
      return data.name.indexOf(value) !== -1
    },
    nodeExpand(data) {
      this.expandedKeys.push(data.id)
    },
    nodeCollapse(data) {
      this.expandedKeys = this.expandedKeys.filter(num => num !== data.id)
      if (data.children) {
        for (const child of data.children) {
          this.nodeCollapse(child)
        }
      }
    },
    handleCreate(row) {
      this.${entityName?uncap_first} = {}
      this.${entityName?uncap_first}.parentId = row === null ? 0 : row.id
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
      this.$confirm('此操作将删除该数据, 是否继续?', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
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
          message: '已取消删除'
        })
      })
    },
    handleFilter() {
      this.loadData()
    },
    handleDrop(draggingNode, dropNode, dropType, ev) {
      const data = draggingNode.data
      const dropData = dropNode.data
      if (dropType === 'inner') {
        data.parentId = dropData.id
      } else {
        data.parentId = dropData.parentId
        data.sort = dropData.sort + (dropType === 'before' ? 0 : 1)
      }
      move${entityName}(data)
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
      export${entityName}Excel(this.listQuery, '数据列表')
    }
  }
}
</script>
<style scoped>

</style>
