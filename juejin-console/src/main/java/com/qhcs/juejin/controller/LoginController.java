/*
 * Copyright (C) 2017 ShenZhen QiHangChuangShi Co.,Ltd All Rights Reserved.
 * 未经本公司正式书面同意，其他任何个人、团体不得使用、复制、修改或发布本软件.
 * 版权所有深圳市起航创势科技有限公司 www.qihcs.com.
 */
package com.qhcs.juejin.controller;

import javax.validation.Valid;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.ConcurrentAccessException;
import org.apache.shiro.authc.DisabledAccountException;
import org.apache.shiro.authc.ExcessiveAttemptsException;
import org.apache.shiro.authc.ExpiredCredentialsException;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.LockedAccountException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authc.pam.UnsupportedTokenException;
import org.apache.shiro.subject.Subject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.qhcs.juejin.entity.SysUser;


/**
 * 登陆控制器
 * 
 * @version 2018年3月14日上午11:09:59
 * @author zhuwenbin
 */
@Controller
@RequestMapping("/admin")
public class LoginController {

	// 获取日志记录器
	private static final Logger log = LoggerFactory.getLogger(LoginController.class);

	/**
	 * 
	 * 跳转到登陆页面
	 * 
	 * @version 2018年3月14日上午11:11:38
	 * @author zhuwenbin
	 * @return
	 */
	@GetMapping("/login")
	public String login() {
		return "login";
	}

	/**
	 * 
	 * 登陆
	 * 
	 * @version 2018年3月14日上午11:11:38
	 * @author zhuwenbin
	 * @return
	 */
	@PostMapping("/doLogin")
	public String doLogin(@Valid SysUser sysUser, BindingResult bindingResult, Model model) {
		// 验证用户密码，如果验证失败显示错误信息重新登陆
		if (bindingResult.hasErrors()) {
			model.addAttribute("errorMsg", bindingResult.getFieldError().getDefaultMessage());
			return "login";
		}
		// 获取主体
		Subject subject = SecurityUtils.getSubject();
		// 创建token
		UsernamePasswordToken token = new UsernamePasswordToken(sysUser.getUserName(), sysUser.getPassword());
		// suject携带token去登陆
		try {
			subject.login(token);
			// 登陆成功跳转到首页
			log.info("账号：{} 登陆成功！", sysUser.getUserName());
			return "redirect:index";
		} catch (ConcurrentAccessException e) {
			log.error("账号：{} 账号已登陆！", sysUser.getUserName());
			model.addAttribute("errorMsg", "账号已登陆！");
		} catch (LockedAccountException e) {
			log.error("账号：{} 账号已锁定！", sysUser.getUserName());
			model.addAttribute("errorMsg", "账号已锁定！");
		} catch (DisabledAccountException e) {
			log.error("账号：{} 账号已禁用！", sysUser.getUserName());
			model.addAttribute("errorMsg", "账号已禁用！");
		} catch (ExcessiveAttemptsException e) {
			log.error("账号：{} 尝试登陆次数过多！", sysUser.getUserName());
			model.addAttribute("errorMsg", "尝试登陆次数过多！");
		} catch (UnknownAccountException e) {
			log.error("账号：{} 账号不存在！", sysUser.getUserName());
			model.addAttribute("errorMsg", "账号不存在！");
		} catch (ExpiredCredentialsException e) {
			log.error("账号：{} 密码已过期！", sysUser.getUserName());
			model.addAttribute("errorMsg", "密码已过期！");
		} catch (IncorrectCredentialsException e) {
			log.error("账号：{} 账号/密码不正确！", sysUser.getUserName());
			model.addAttribute("errorMsg", "账号/密码不正确！");
		} catch (UnsupportedTokenException e) {
			log.error("账号：{} 不支持该类身份凭证认证！", sysUser.getUserName());
			model.addAttribute("errorMsg", "不支持该类身份凭证认证！");
		}
		return "login";
	}

	/**
	 * 
	 * 退出
	 * 
	 * @version 2018年3月14日下午3:27:00
	 * @author zhuwenbin
	 * @return
	 */
	@GetMapping("/logout")
	public String logout() {
		// 获取主体
		Subject subject = SecurityUtils.getSubject();
		// 主体退出
		subject.logout();

		return "redirect:login";
	}
}
