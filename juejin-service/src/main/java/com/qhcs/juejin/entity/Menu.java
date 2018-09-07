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
 * 栏目信息实体
 * 
 * @version 2018年3月15日下午5:12:52
 * @author zhuwenbin
 */
@Data
public class Menu implements Serializable{

	private static final long serialVersionUID = -8055976756224535607L;
	
	//id
	private long id;
	
	//父级栏目
	private long parentId;
	
	//栏目名称
	private String name;
	
	//栏目描述
	private String description;

	//创建时间
	private Date createDate;
	
	//修改时间
	private Date updateDate;

}
