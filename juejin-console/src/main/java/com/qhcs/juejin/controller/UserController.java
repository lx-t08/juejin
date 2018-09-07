/*
 * Copyright (C) 2017 ShenZhen QiHangChuangShi Co.,Ltd All Rights Reserved.
 * 未经本公司正式书面同意，其他任何个人、团体不得使用、复制、修改或发布本软件.
 * 版权所有深圳市起航创势科技有限公司 www.qihcs.com.
 */
package com.qhcs.juejin.controller;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 用户管理控制器
 * 
 * @version 2018年3月14日下午6:12:10
 * @author zhuwenbin
 */
@Controller
@RequestMapping("/admin")
public class UserController {

	/**
	 * 
	 * 用户列表
	 * 
	 * @version 2018年3月14日下午6:13:37
	 * @author zhuwenbin
	 * @return
	 */
	@GetMapping("/user/users")
	@RequiresPermissions("user:users")
	public String userList() {
		return "userList";
	}
}
