/*
 * Copyright (C) 2017 ShenZhen QiHangChuangShi Co.,Ltd All Rights Reserved.
 * 未经本公司正式书面同意，其他任何个人、团体不得使用、复制、修改或发布本软件.
 * 版权所有深圳市起航创势科技有限公司 www.qihcs.com.
 */
package com.qhcs.juejin.common.exception;

import org.apache.shiro.authz.UnauthorizedException;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

/**
 * 全局异常处理
 * 
 * @version 2018年3月14日下午6:40:01
 * @author zhuwenbin
 */
@ControllerAdvice
public class ExceptionController {

	/**
	 * 
	 * 权限异常控制
	 * 
	 * @version 2018年3月14日下午6:44:28
	 * @author zhuwenbin
	 * @param exception
	 * @param model
	 * @return
	 */
	@ExceptionHandler(UnauthorizedException.class)
	public String exceptionHandler(Exception exception, Model model) {

		return "error/authError";
	}
}
