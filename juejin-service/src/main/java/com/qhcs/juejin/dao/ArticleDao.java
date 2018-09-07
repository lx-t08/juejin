/*
 * Copyright (C) 2017 ShenZhen QiHangChuangShi Co.,Ltd All Rights Reserved.
 * 未经本公司正式书面同意，其他任何个人、团体不得使用、复制、修改或发布本软件.
 * 版权所有深圳市起航创势科技有限公司 www.qihcs.com.
 */
package com.qhcs.juejin.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.qhcs.juejin.common.dao.BaseDao;
import com.qhcs.juejin.entity.Article;

/**
 * 文章信息数据库访问接口
 * 
 * @version 2018年3月15日下午5:18:41
 * @author zhuwenbin
 */
@Repository
public interface ArticleDao extends BaseDao<Article> {

	/**
	 * 
	 * 获取指定id的文章列表
	 * 
	 * @version 2018年3月22日下午5:20:01
	 * @author zhuwenbin
	 * @param ids
	 * @return
	 */
	List<Article> getArticleByIds(long[] ids);
}
