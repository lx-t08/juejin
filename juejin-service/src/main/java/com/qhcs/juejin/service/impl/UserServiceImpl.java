/*
 * Copyright (C) 2017 ShenZhen QiHangChuangShi Co.,Ltd All Rights Reserved.
 * 未经本公司正式书面同意，其他任何个人、团体不得使用、复制、修改或发布本软件.
 * 版权所有深圳市起航创势科技有限公司 www.qihcs.com.
 */
package com.qhcs.juejin.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.qhcs.juejin.dao.UserDao;
import com.qhcs.juejin.entity.User;
import com.qhcs.juejin.service.UserService;

/**
 * 用户信息服务接口实现类
 * 
 * @version 2018年3月21日下午4:18:48
 * @author zhuwenbin
 */
@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDao userDao;

	@Override
	public User getUserById(long id) {
		return userDao.findById(id);
	}

}
