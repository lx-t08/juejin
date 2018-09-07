/*
 * Copyright (C) 2017 ShenZhen QiHangChuangShi Co.,Ltd All Rights Reserved.
 * 未经本公司正式书面同意，其他任何个人、团体不得使用、复制、修改或发布本软件.
 * 版权所有深圳市起航创势科技有限公司 www.qihcs.com.
 */
package com.qhcs.juejin.controller;

import java.io.UnsupportedEncodingException;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.qhcs.juejin.entity.Article;
import com.qhcs.juejin.entity.User;
import com.qhcs.juejin.page.ArticlePage;
import com.qhcs.juejin.service.ArticleService;
import com.qhcs.juejin.service.UserService;

import cn.hutool.core.date.DateUtil;

/**
 * 文章控制器
 * 
 * @version 2018年3月14日下午6:14:08
 * @author zhuwenbin
 */
@Controller
@RequestMapping("/admin")
public class ArticleController {

	@Autowired
	private ArticleService articleService;
	@Autowired
	private UserService userService;

	/**
	 * 
	 * 文章列表
	 * 
	 * @version 2018年3月14日下午6:15:07
	 * @author zhuwenbin
	 * @return
	 */
	@RequestMapping("/article/articles")
	@RequiresPermissions("article:articles")
	public String articleList(ArticlePage page, Model model) {
		articleService.pagingQueryArticle(page);
		model.addAttribute("page", page);
		return "article/articleList";
	}

	/**
	 * 
	 * 删除文章
	 * 
	 * @version 2018年3月14日下午8:19:35
	 * @author zhuwenbin
	 * @param id
	 * @return
	 */
	@DeleteMapping("/article/{id}")
	@RequiresPermissions("article:delete")
	@ResponseBody
	public String deleteArticle(@PathVariable("id") long id) {
		boolean result = articleService.deleteArticleById(id);
		return result ? "success" : "failure";
	}

	/**
	 * 
	 * 获取文章
	 * 
	 * @version 2018年3月14日下午8:19:35
	 * @author zhuwenbin
	 * @param id
	 * @return
	 */
	@GetMapping("/article/{id}")
	@RequiresPermissions("article:view")
	public String getArticle(@PathVariable("id") long id, Model model) {
		Article article = articleService.getArticleById(id);
		User user = userService.getUserById(article.getId());

		model.addAttribute("article", article);
		model.addAttribute("user", user);

		return "article/article";
	}

	/**
	 * 
	 * 增加文章页面
	 * 
	 * @version 2018年3月21日下午4:45:57
	 * @author zhuwenbin
	 * @return
	 */
	@GetMapping("/article")
	@RequiresPermissions("article:add")
	public String addArticleBefore() {
		return "article/addArticle";
	}

	/**
	 * 
	 * 增加文章
	 * 
	 * @version 2018年3月21日下午4:46:16
	 * @author zhuwenbin
	 * @param user
	 * @return
	 */
	@PostMapping("/article")
	@RequiresPermissions("article:add")
	public String addArticle(Article article) {
		articleService.addArticle(article);
		return "redirect:article/articles";
	}

	/**
	 * 
	 * 修改文章页面
	 * 
	 * @version 2018年3月21日下午4:45:57
	 * @author zhuwenbin
	 * @return
	 */
	@GetMapping("/article/{id}/editor")
	@RequiresPermissions("article:update")
	public String updateArticleBefore(@PathVariable("id") long id, Model model) {
		model.addAttribute("id", id);
		return "article/updateArticle";
	}

	/**
	 * 
	 * 修改文章
	 * 
	 * @version 2018年3月21日下午4:46:16
	 * @author zhuwenbin
	 * @param user
	 * @return
	 */
	@PutMapping("/article")
	@RequiresPermissions("article:update")
	public String updateArticle(Article article) {
		articleService.updateArticle(article);
		return "redirect:article/articles";
	}

	/**
	 * 
	 * 导出文章
	 * 
	 * @version 2018年3月22日下午4:09:29
	 * @author zhuwenbin
	 * @param ids
	 * @return
	 * @throws UnsupportedEncodingException
	 */
	@PostMapping(value = "/article/export", produces = MediaType.APPLICATION_OCTET_STREAM_VALUE)
	public ResponseEntity<byte[]> exportArticle(long[] ids) throws UnsupportedEncodingException {
		// 获取byte数组
		byte[] bytes = articleService.generateExcel(ids);
		
		// 设置header
		HttpHeaders httpHeaders = new HttpHeaders();
		httpHeaders.add("Accept-Ranges", "bytes");
		httpHeaders.add("Content-Length", bytes.length + "");
		httpHeaders.add("Content-disposition",
				"attachment; filename=" + new String("文章列表-".getBytes(), "iso-8859-1") + DateUtil.today() + ".xlsx");
		httpHeaders.add("Content-Type",
				"application/vnd.openxmlformats-officedocument.spreadsheetml.sheet;charset=utf-8");

		return new ResponseEntity<byte[]>(bytes, httpHeaders, HttpStatus.CREATED);
	}

}
