/*
 * Copyright (C) 2017 ShenZhen QiHangChuangShi Co.,Ltd All Rights Reserved.
 * 未经本公司正式书面同意，其他任何个人、团体不得使用、复制、修改或发布本软件.
 * 版权所有深圳市起航创势科技有限公司 www.qihcs.com.
 */
package com.qhcs.juejin.service;

import com.qhcs.juejin.entity.SysUser;

/**
 * 系统用户服务接口
 * 
 * @version 2018年3月13日下午6:13:35
 * @author zhuwenbin
 */
public interface SysUserService {

	/**
	 * 
	 * 根据用户名查询用户信息
	 * 
	 * @version 2018年3月13日下午5:32:12
	 * @author zhuwenbin
	 * @param userName
	 * @return
	 */
	SysUser getSysUserByUserName(String userName);
}
