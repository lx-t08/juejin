/*
 * Copyright (C) 2017 ShenZhen QiHangChuangShi Co.,Ltd All Rights Reserved.
 * 未经本公司正式书面同意，其他任何个人、团体不得使用、复制、修改或发布本软件.
 * 版权所有深圳市起航创势科技有限公司 www.qihcs.com.
 */
package com.qhcs.juejin.service;

import com.qhcs.juejin.entity.User;

/**
 * 用户信息服务接口
 * 
 * @version 2018年3月21日下午4:17:46
 * @author zhuwenbin
 */
public interface UserService {

	/**
	 * 
	 * 根据用户id查询用户
	 * 
	 * @version 2018年3月21日下午4:18:22
	 * @author zhuwenbin
	 * @param id
	 * @return
	 */
	User getUserById(long id);
}
