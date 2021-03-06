﻿/*
 * Copyright (C) 2017 ShenZhen QiHangChuangShi Co.,Ltd All Rights Reserved.
 * 未经本公司正式书面同意，其他任何个人、团体不得使用、复制、修改或发布本软件.
 * 版权所有深圳市起航创势科技有限公司 www.qihcs.com.
 */
package com.qhcs.juejin.common.dao;

import java.io.Serializable;
import java.util.List;

import com.qhcs.juejin.common.page.Page;


/**
 * 
 * 基本接口，不是为了公用，而是为了约束常用功能方法的命名。 类和子类中的方法排序需遵守 增、删、改、查
 * 的顺序，在此基础上常用名要优先，如getById要先于getByUserId
 * 
 * @version 2018年3月15日下午5:34:33
 * @author zhuwenbin
 */
public interface BaseDao<T> {
 

	/** 插入新对象 */
	int insert(T o);

	/** 删除一个或多个对象 */
	int delete(T o);

	/** 根据对象id删除单一对象 */
	int deleteById(Serializable id);

	/** 更新修改的对象 */
	int update(T o);

	/** 根据对象id获取单一对象 */
	T findById(Serializable id);

	/** 无条件获取所有对象 */
	List<T> findAll();

	/** 根据查询对象获取多个对象 */
	List<T> findList(Page<T> page);

	/** 根据查询对象统计结果个数 */
	int findCount(Page<T> page);

}
