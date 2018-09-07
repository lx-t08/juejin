/*
 * Copyright (C) 2017 ShenZhen QiHangChuangShi Co.,Ltd All Rights Reserved.
 * 未经本公司正式书面同意，其他任何个人、团体不得使用、复制、修改或发布本软件.
 * 版权所有深圳市起航创势科技有限公司 www.qihcs.com.
 */
package com.qhcs.juejin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.qhcs.juejin.page.ArticlePage;
import com.qhcs.juejin.service.ArticleService;

/**
 * 首页控制器
 * 
 * @version 2018年3月15日下午6:27:13
 * @author zhuwenbin
 */
@Controller
public class IndexController {

	@Autowired
	private ArticleService articleService;

	@GetMapping({ "/", "/index" })
	public String index(ArticlePage page, Model model) {
		// 分页查询文章列表
		articleService.pagingQueryArticle(page);
		// 返回page数据
		model.addAttribute("page", page);

		return "index";
	}
}
