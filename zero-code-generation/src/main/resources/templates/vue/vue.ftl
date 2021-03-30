<template>
    <div class="app-container">
        <div class="filter-container">
            <el-input v-model="listQuery.username" placeholder="用户名" style="width: 200px;" class="filter-item"
                      @keyup.enter.native="handleFilter"
            />
            <el-select v-model="listQuery.enabled" placeholder="是否启用" clearable style="width: 120px" class="filter-item"
                       @change="handleFilter"
            >
                <el-option value="true" label="是" />
                <el-option value="false" label="否" />
            </el-select>
            <el-select v-model="listQuery.locked" placeholder="是否锁定" clearable class="filter-item"
                       style="width: 120px"
                       @change="handleFilter"
            >
                <el-option value="true" label="是" />
                <el-option value="false" label="否" />
            </el-select>
            <el-select v-model="listQuery.accountExpire" placeholder="账号是否过期" clearable style="width: 140px" class="filter-item"
                       @change="handleFilter"
            >
                <el-option value="true" label="是" />
                <el-option value="false" label="否" />
            </el-select>
            <el-select v-model="listQuery.passwordExpire" placeholder="密码是否过期" clearable style="width: 140px;" class="filter-item"
                       @change="handleFilter"
            >
                <el-option value="true" label="是" />
                <el-option value="false" label="否" />
            </el-select>
            <el-select v-model="listQuery.queryRoleId" placeholder="角色" clearable style="width: 100px;margin-right: 10px;"
                       class="filter-item" @change="handleFilter" @visible-change="getRoleList($event)"
            >
                <el-option
                        v-for="role in roles"
                        :key="role.id"
                        :label="role.name"
                        :value="role.id"
                />
            </el-select>
            <el-button class="filter-item" type="primary" icon="el-icon-search" @click="handleFilter">
                查询
            </el-button>
            <el-button class="filter-item" style="margin-left: 10px;" type="primary" icon="el-icon-edit"
                       @click="handleCreate"
            >
                添加
            </el-button>
            <el-button :loading="downloadLoading" class="filter-item" type="primary" icon="el-icon-download"
                       @click="handleDownload"
            >
                导出
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
            <el-table-column label="用户名" width="150px" align="center">
                <template slot-scope="{row}">
                    <span>{{ row.username }}</span>
                </template>
            </el-table-column>
            <el-table-column label="是否启用" width="100px" align="center">
                <template slot-scope="{row}">
                    <span>{{ row.enabled | enabledFilter }}</span>
                </template>
            </el-table-column>
            <el-table-column label="是否锁定" width="110px" align="center">
                <template slot-scope="{row}">
                    <span>{{ row.locked | lockedFilter }}</span>
                </template>
            </el-table-column>
            <el-table-column label="账号是否过期" width="120px" align="center">
                <template slot-scope="{row}">
                    <span>{{ row.accountExpire | expireFilter }}</span>
                </template>
            </el-table-column>
            <el-table-column label="密码是否过期" width="120px" align="center">
                <template slot-scope="{row}">
                    <span>{{ row.passwordExpire | expireFilter }}</span>
                </template>
            </el-table-column>
            <el-table-column label="账号状态" width="80px" align="center">
                <template slot-scope="{row}">
                    <el-link v-if="row.onlineLoginLogs.length === 0" type="info" :underline="false" style="font-size: 12px;">未登录</el-link>
                    <el-link v-else type="success" @click="loginLog(row)" style="font-size: 12px;">在线{{ row.onlineLoginLogs.length }}人</el-link>
                </template>
            </el-table-column>
            <el-table-column label="用户角色" class-name="status-col">
                <template slot-scope="{row}">
                    <el-tag
                            v-for="(role,index) in row.roles"
                            :key="index"
                            closable
                            :type="tagType[role.id]"
                            style="margin-right: 3px;border-radius: 15px;"
                            :title="role.description"
                            size="mini"
                            @close="deleteUserRole(row.id, role.id)"
                    >
                        {{ role.name }}
                    </el-tag>
                    <el-dropdown trigger="click" @command="addUserRole(row.id, $event)">
                        <el-button style="border-radius: 20px;" size="mini" @click="getUserNotRoleList(row.id)">+</el-button>
                        <el-dropdown-menu slot="dropdown">
                            <el-dropdown-item
                                    v-for="(role,index) in notRoleList"
                                    :key="index"
                                    :title="role.description"
                                    :command="role.id"
                            >{{ role.name }}
                            </el-dropdown-item>
                        </el-dropdown-menu>
                    </el-dropdown>
                </template>
            </el-table-column>
            <el-table-column label="操作" align="center" class-name="small-padding fixed-width" width="300px">
                <template slot-scope="{row}">
                    <el-button type="primary" size="mini" icon="el-icon-edit" @click="handleUpdate(row)">
                        编辑
                    </el-button>
                    <el-button v-if="row.enabled === false" icon="el-icon-check" size="mini" type="success" @click="enabled(row, true)">
                        启用
                    </el-button>
                    <el-button v-if="row.enabled === true" icon="el-icon-close" size="mini" @click="enabled(row, false)">
                        禁用
                    </el-button>
                    <el-button type="danger" size="mini" icon="el-icon-delete" @click="deleteData(row)">
                        删除
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

        <el-dialog :title="textMap[dialogStatus]" :visible.sync="dialogFormVisible">
            <el-form ref="dataForm" :rules="rules" :model="user" label-position="left" label-width="120px"
                     style="width: 400px; margin-left:50px;"
            >
                <el-form-item label="用户名" prop="username">
                    <el-input v-model="user.username" placeholder="请输入用户名" />
                </el-form-item>
                <el-form-item label="是否启用" prop="enabled">
                    <el-switch
                            v-model="user.enabled"
                            active-text="启用"
                            inactive-text="禁用"
                    />
                </el-form-item>
                <el-form-item label="是否锁定" prop="locked">
                    <el-switch
                            v-model="user.locked"
                            active-text="锁定"
                            inactive-text="未锁定"
                    />
                </el-form-item>
                <el-form-item label="账号是否过期">
                    <el-switch
                            v-model="user.accountExpire"
                            active-text="过期"
                            inactive-text="未过期"
                    />
                </el-form-item>
                <el-form-item label="密码是否过期">
                    <el-switch
                            v-model="user.passwordExpire"
                            active-text="过期"
                            inactive-text="未过期"
                    />
                </el-form-item>
            </el-form>
            <div slot="footer" class="dialog-footer">
                <el-button @click="dialogFormVisible = false">关闭</el-button>
                <el-button type="primary" @click="dialogStatus==='create'?createData():updateData()">保存</el-button>
            </div>
        </el-dialog>

        <el-dialog title="在线账号" :visible.sync="loginLogDialogVisible" width="60%">
            <login-log :onlineLoginLogs="onlineLoginLogs" @offline="offline"></login-log>
        </el-dialog>
    </div>
</template>

<script>
import {
    getUserPage,
    enabled,
    createUser,
    updateUser,
    deleteUser,
    deleteUserRole,
    getUserNotRoleList,
    addUserRole,
    checkUsername,
    exportUserExcel
} from '@/api/data/user'
import Pagination from '@/components/Pagination'

export default {
    name: '${entityName}',
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
                username: null,
                enabled: null,
                locked: null,
                accountExpire: null,
                passwordExpire: null,
                queryRoleId: null
            },
            tagType: ['', 'success', 'info', 'warning', 'danger'],
            ${entityName?uncap_first}: {
                id: null,
                username: null,
                enabled: true,
                locked: false,
                accountExpire: false,
                passwordExpire: false
            },
            dialogFormVisible: false,
            dialogStatus: '',
            textMap: {
                create: '添加',
                update: '编辑'
            },
            rules: {
                username: [{ required: true, message: '请输入用户名', trigger: 'change' }]
            },
            downloadLoading: false
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
                    createUser(this.${entityName?uncap_first}).then((res) => {
                        this.dialogFormVisible = false
                        this.$notify({
                            title: '成功',
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
                    updateUser(this.${entityName?uncap_first}).then((res) => {
                        this.dialogFormVisible = false
                        this.$notify({
                            title: '成功',
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
                deleteUser(row.id).then(res => {
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
            exportUserExcel(this.listQuery, '数据列表')
        }
    }
}
</script>
<style scoped>

</style>
