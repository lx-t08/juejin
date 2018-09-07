/*
 * Copyright (C) 2017 ShenZhen QiHangChuangShi Co.,Ltd All Rights Reserved.
 * 未经本公司正式书面同意，其他任何个人、团体不得使用、复制、修改或发布本软件.
 * 版权所有深圳市起航创势科技有限公司 www.qihcs.com.
 */
package com.qhcs.juejin.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.qhcs.juejin.dao.SysRoleDao;
import com.qhcs.juejin.entity.SysRole;
import com.qhcs.juejin.service.SysRoleService;


/**
 * 系统角色服务接口实现类
 * 
 * @version 2018年3月13日下午6:24:27
 * @author zhuwenbin
 */
@Service
public class SysRoleServiceImpl implements SysRoleService {

	@Autowired
	private SysRoleDao sysRoleDao;

	@Override
	public List<SysRole> getSysRoleByUserId(int userId) {
		return sysRoleDao.getSysRoleByUserId(userId);
	}

}
