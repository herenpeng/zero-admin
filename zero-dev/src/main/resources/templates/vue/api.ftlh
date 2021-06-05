import request from '@/utils/request'
import { exportExcel } from '@/utils/export-file'

export function get${entityName}Page(page, query) {
  query.size = page.size
  return request({
    url: '/${requestMapping}/page/' + page.currentPage,
    method: 'get',
    params: query
  })
}

export function create${entityName}(${entityName?uncap_first}) {
  return request({
    url: '/${requestMapping}',
    method: 'post',
    data: ${entityName?uncap_first}
  })
}

export function update${entityName}(${entityName?uncap_first}) {
  return request({
    url: '/${requestMapping}',
    method: 'put',
    data: ${entityName?uncap_first}
  })
}

export function delete${entityName}(id) {
  return request({
    url: '/${requestMapping}/' + id,
    method: 'delete'
  })
}

export function get${entityName}RecoverPage(page, query) {
  query.size = page.size
  return request({
    url: '/${requestMapping}/recover/page/' + page.currentPage,
    method: 'get',
    params: query
  })
}

export function recover${entityName}(id) {
  return request({
    url: '/${requestMapping}/recover/' + id,
    method: 'put'
  })
}

export function recoverDelete${entityName}(id) {
  return request({
    url: '/${requestMapping}/recover/' + id,
    method: 'delete'
  })
}

export function export${entityName}Excel(query, fileName) {
  exportExcel('/${requestMapping}/export/excel', query, fileName)
}
