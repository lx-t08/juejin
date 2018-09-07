/*
 * Copyright (C) 2017 ShenZhen QiHangChuangShi Co.,Ltd All Rights Reserved.
 * 未经本公司正式书面同意，其他任何个人、团体不得使用、复制、修改或发布本软件.
 * 版权所有深圳市起航创势科技有限公司 www.qihcs.com.
 */
package com.qhcs.juejin.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.qhcs.juejin.dao.SysFunctionDao;
import com.qhcs.juejin.entity.SysFunction;
import com.qhcs.juejin.service.SysFunctionService;


/**
 * 系统权限服务接口实现类
 * 
 * @version 2018年3月13日下午6:33:11
 * @author zhuwenbin
 */
@Service
public class SysFunctionServiceImpl implements SysFunctionService {

	@Autowired
	private SysFunctionDao sysFunctionDao;

	@Override
	public List<SysFunction> getSysFunctionByUserId(int userId) {
		return sysFunctionDao.getSysFunctionByUserId(userId);
	}

}
