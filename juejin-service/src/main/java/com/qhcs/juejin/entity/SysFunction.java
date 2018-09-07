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
 * 系统权限实体
 * 
 * @version 2018年3月13日下午5:17:46
 * @author zhuwenbin
 */
@Data
public class SysFunction implements Serializable{

	private static final long serialVersionUID = 9209557138339623195L;

	private int functionId;

	private int parentId;

	private String functionName;

	private String functionUrl;

	private int functionType;

	private String permission;

	private Date createTime;

	private int sort;

	public SysFunction() {
		super();
	}

	public SysFunction(int functionId, int parentId, String functionName, String functionUrl, int functionType,
			String permission, Date createTime, int sort) {
		super();
		this.functionId = functionId;
		this.parentId = parentId;
		this.functionName = functionName;
		this.functionUrl = functionUrl;
		this.functionType = functionType;
		this.permission = permission;
		this.createTime = createTime;
		this.sort = sort;
	}

}
