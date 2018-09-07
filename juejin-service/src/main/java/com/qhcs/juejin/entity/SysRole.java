/*
 * Copyright (C) 2017 ShenZhen QiHangChuangShi Co.,Ltd All Rights Reserved.
 * 未经本公司正式书面同意，其他任何个人、团体不得使用、复制、修改或发布本软件.
 * 版权所有深圳市起航创势科技有限公司 www.qihcs.com.
 */
package com.qhcs.juejin.entity;

import java.io.Serializable;
import java.util.Date;

import lombok.Data;

/**
 * 系统角色实体
 * 
 * @version 2018年3月13日下午5:15:28
 * @author zhuwenbin
 */
@Data
public class SysRole implements Serializable{

	private static final long serialVersionUID = 3355704797137020942L;

	private int roleId;

	private String roleName;

	private String description;

	private Date createTime;

	public SysRole() {
		super();
	}

	public SysRole(String roleName) {
		super();
		this.roleName = roleName;
	}

}
