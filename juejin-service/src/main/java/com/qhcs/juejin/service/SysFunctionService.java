/*
 * Copyright (C) 2017 ShenZhen QiHangChuangShi Co.,Ltd All Rights Reserved.
 * 未经本公司正式书面同意，其他任何个人、团体不得使用、复制、修改或发布本软件.
 * 版权所有深圳市起航创势科技有限公司 www.qihcs.com.
 */
package com.qhcs.juejin.service;

import java.util.List;

import com.qhcs.juejin.entity.SysFunction;


/**
 * 系统权限服务接口
 * 
 * @version 2018年3月13日下午6:32:33
 * @author zhuwenbin
 */
public interface SysFunctionService {

	/**
	 * 
	 * 根据用户id查询权限信息
	 * 
	 * @version 2018年3月13日下午6:27:04
	 * @author zhuwenbin
	 * @param userId
	 * @return
	 */
	List<SysFunction> getSysFunctionByUserId(int userId);
}
