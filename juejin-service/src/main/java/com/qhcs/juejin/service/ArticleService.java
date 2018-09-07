/*
 * Copyright (C) 2017 ShenZhen QiHangChuangShi Co.,Ltd All Rights Reserved.
 * 未经本公司正式书面同意，其他任何个人、团体不得使用、复制、修改或发布本软件.
 * 版权所有深圳市起航创势科技有限公司 www.qihcs.com.
 */
package com.qhcs.juejin.service;

import java.util.List;

import com.qhcs.juejin.common.page.Page;
import com.qhcs.juejin.entity.Article;

/**
 * 文章信息服务接口
 * 
 * @version 2018年3月15日下午5:25:34
 * @author zhuwenbin
 */
public interface ArticleService {

	/**
	 * 
	 * 分页查询文章列表
	 * 
	 * @version 2018年3月15日下午5:28:14
	 * @author zhuwenbin
	 * @param page
	 * @return
	 */
	List<Article> pagingQueryArticle(Page<Article> page);

	/**
	 * 
	 * 根据文章id删除文章
	 * 
	 * @version 2018年3月21日下午12:29:37
	 * @author zhuwenbin
	 * @param id
	 * @return
	 */
	boolean deleteArticleById(long id);

	/**
	 * 
	 * 根据文章id查询文章
	 * 
	 * @version 2018年3月21日下午4:15:17
	 * @author zhuwenbin
	 * @param id
	 * @return
	 */
	Article getArticleById(long id);

	/**
	 * 
	 * 添加文章
	 * 
	 * @version 2018年3月21日下午4:51:47
	 * @author zhuwenbin
	 * @param article
	 * @return
	 */
	boolean addArticle(Article article);

	/**
	 * 
	 * 修改文章
	 * 
	 * @version 2018年3月21日下午4:51:47
	 * @author zhuwenbin
	 * @param article
	 * @return
	 */
	boolean updateArticle(Article article);

	/**
	 * 
	 * 指定文章id生成excel文档
	 * 
	 * @version 2018年3月22日下午5:19:01
	 * @author zhuwenbin
	 * @param ids
	 * @return
	 */
	byte[] generateExcel(long[] ids);
}
