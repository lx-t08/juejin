/*
 * Copyright (C) 2017 ShenZhen QiHangChuangShi Co.,Ltd All Rights Reserved.
 * 未经本公司正式书面同意，其他任何个人、团体不得使用、复制、修改或发布本软件.
 * 版权所有深圳市起航创势科技有限公司 www.qihcs.com.
 */
package com.qhcs.juejin.entity;

import java.io.Serializable;
import java.util.Date;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Pattern;

import lombok.Data;

/**
 * 系统用户实体
 * 
 * @version 2018年3月13日下午5:08:39
 * @author zhuwenbin
 */
@Data
public class SysUser implements Serializable{

	private static final long serialVersionUID = -2756341835931605548L;

	private int userId;

	@NotEmpty(message = "请输入用户名")
	@Pattern(regexp = "^\\w{3,10}$", message = "请输入3-10位由字符、数字、_组成的用户名")
	private String userName;

	@NotEmpty(message = "请输入密码")
	@Pattern(regexp = "^[a-z0-9]{32}$", message = "请输入32位加密后的密码")
	private String password;

	private String realName;

	private int status;

	private Date lastLoginTime;

	private String lastLoginIp;

	private Date createTime;

	private String email;

	private String tel;

	public SysUser() {
		super();
	}

	public SysUser(String userName, String password) {
		super();
		this.userName = userName;
		this.password = password;
	}

}
