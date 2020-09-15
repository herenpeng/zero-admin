package com.zero.sys.controller;

import com.zero.common.response.domain.CodeEnum;
import com.zero.common.response.domain.ResponseData;
import com.zero.sys.domain.Role;
import com.zero.sys.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * 用户角色的控制器
 *
 * @author herenpeng
 * @since 2020-09-13 23:18
 */
@RestController
@RequestMapping("role")
public class RoleController {

    @Autowired
    private RoleService roleService;

    /**
     * 获取所有的用户角色数据
     *
     * @return 所有的用户角色集合
     */
    @GetMapping("list")
    public ResponseEntity<ResponseData> list() throws Exception {
        ResponseData<List<Role>> responseData = new ResponseData(CodeEnum.OK.getValue(), roleService.list());
        return ResponseEntity.ok(responseData);
    }

}
