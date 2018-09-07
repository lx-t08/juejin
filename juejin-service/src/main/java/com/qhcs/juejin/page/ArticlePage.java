/*
 * Copyright (C) 2017 ShenZhen QiHangChuangShi Co.,Ltd All Rights Reserved.
 * 未经本公司正式书面同意，其他任何个人、团体不得使用、复制、修改或发布本软件.
 * 版权所有深圳市起航创势科技有限公司 www.qihcs.com.
 */
package com.qhcs.juejin.page;

import java.util.Date;

import com.qhcs.juejin.common.page.Page;
import com.qhcs.juejin.entity.Article;

import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * 文章信息分页实体
 * 
 * @version 2018年3月15日下午6:22:59
 * @author zhuwenbin
 */
@Data
@EqualsAndHashCode(callSuper=false)
public class ArticlePage extends Page<Article> {

	// 标题
	private String title;

	// 开始时间
	private Date startDate;

	// 截止时间
	private Date endDate;
	
	//状态：0-未发布；1-已发布
	private String status;
}
