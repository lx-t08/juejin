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
 * 文章信息实体
 * 
 * @version 2018年3月15日下午5:01:22
 * @author zhuwenbin
 */
@Data
public class Article implements Serializable{

	private static final long serialVersionUID = 1611199764857928538L;

	// id
	private long id;

	// 标题
	private String title;

	// 内容
	private String content;

	// 用户id
	private long userId;
	
	//菜单id
	private long menuId;
	
	//状态：0-未发布；1-已发布
	private String status;

	// 创建时间
	private Date createDate;

	// 修改时间
	private Date updateDate;

	// 发布时间
	private Date publishDate;

}
