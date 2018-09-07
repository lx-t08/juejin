/*
 * Copyright (C) 2017 ShenZhen QiHangChuangShi Co.,Ltd All Rights Reserved.
 * 未经本公司正式书面同意，其他任何个人、团体不得使用、复制、修改或发布本软件.
 * 版权所有深圳市起航创势科技有限公司 www.qihcs.com.
 */
package com.qhcs.juejin.service.impl;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.qhcs.juejin.common.page.Page;
import com.qhcs.juejin.dao.ArticleDao;
import com.qhcs.juejin.entity.Article;
import com.qhcs.juejin.service.ArticleService;

import cn.hutool.core.map.MapUtil;
import cn.hutool.poi.excel.ExcelUtil;
import cn.hutool.poi.excel.ExcelWriter;

/**
 * 文章信息服务接口实现类
 * 
 * @version 2018年3月15日下午5:28:57
 * @author zhuwenbin
 */
@Service
public class ArticleServiceImpl implements ArticleService {

	@Autowired
	private ArticleDao articleDao;

	@Override
	public List<Article> pagingQueryArticle(Page<Article> page) {

		// 查询总记录数目
		int count = articleDao.findCount(page);

		// 判断是否有记录
		if (count == 0) {
			return new ArrayList<Article>();
		}

		// 设置总记录数目并计算
		page.setTotalElements(count);

		// 分页查询记录
		List<Article> articles = articleDao.findList(page);

		// 设置当前页数据
		page.setDatas(articles);

		return articles;
	}

	@Override
	public boolean deleteArticleById(long id) {
		return articleDao.deleteById(id) > 0 ? true : false;
	}

	@Override
	public Article getArticleById(long id) {
		return articleDao.findById(id);
	}

	@Override
	public boolean addArticle(Article article) {
		return articleDao.insert(article) > 0 ? true : false;
	}

	@Override
	public boolean updateArticle(Article article) {
		return articleDao.update(article) > 0 ? true : false;
	}

	@Override
	public byte[] generateExcel(long[] ids) {
		// 查询指定id查询文章列表
		List<Article> articles = articleDao.getArticleByIds(ids);

		// 二进制输出流
		ByteArrayOutputStream outputStream = new ByteArrayOutputStream();

		// 创建xlsx格式的
		ExcelWriter writer = ExcelUtil.getWriter(true);

		// 自定义标题别名
		Map<String, String> alias = MapUtil.newHashMap();
		alias.put("id", "序号");
		alias.put("title", "标题");
		alias.put("content", "内容");
		alias.put("userId", "用户编号");
		alias.put("menuId", "菜单编号");
		alias.put("status", "发布状态");
		alias.put("createDate", "创建时间");
		alias.put("updateDate", "修改时间");
		alias.put("publishDate", "发布时间");
		writer.setHeaderAlias(alias);

		// 合并单元格后的标题行，使用默认标题样式
		writer.merge(8, "文章列表");

		// 一次性写出内容到输出流
		writer.write(articles);
		// out为OutputStream，需要写出到的目标流
		writer.flush(outputStream);
		// 关闭writer，释放内存
		writer.close();
		
		//获取二进制数组
		byte[] bytes = outputStream.toByteArray();
		
		//关闭流
		try {
			outputStream.flush();
			outputStream.close();
		} catch (IOException e) {
			e.printStackTrace();
		}

		return bytes;
	}

}
