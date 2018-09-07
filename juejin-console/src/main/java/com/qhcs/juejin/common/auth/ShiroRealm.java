/*
 * Copyright (C) 2017 ShenZhen QiHangChuangShi Co.,Ltd All Rights Reserved.
 * 未经本公司正式书面同意，其他任何个人、团体不得使用、复制、修改或发布本软件.
 * 版权所有深圳市起航创势科技有限公司 www.qihcs.com.
 */
package com.qhcs.juejin.common.auth;

import java.util.HashSet;
import java.util.List;
import java.util.Objects;
import java.util.Set;

import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.DisabledAccountException;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.LockedAccountException;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authc.pam.UnsupportedTokenException;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.subject.SimplePrincipalCollection;
import org.springframework.beans.factory.annotation.Autowired;

import com.qhcs.juejin.entity.SysFunction;
import com.qhcs.juejin.entity.SysRole;
import com.qhcs.juejin.entity.SysUser;
import com.qhcs.juejin.service.SysFunctionService;
import com.qhcs.juejin.service.SysRoleService;
import com.qhcs.juejin.service.SysUserService;


/**
 * 自定义realm
 * 
 * @version 2018年3月13日下午4:07:15
 * @author zhuwenbin
 */
public class ShiroRealm extends AuthorizingRealm {

	@Autowired
	private SysUserService sysUserService;
	@Autowired
	private SysRoleService sysRoleService;
	@Autowired
	private SysFunctionService sysFunctionService;

	/**
	 * 资源授权
	 */
	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
		// 获取身份信息
		ShiroUser user = (ShiroUser) principals.getPrimaryPrincipal();
		// 获取用户id
		int userId = user.getUserId();

		// 授权信息
		SimpleAuthorizationInfo authorizationInfo = new SimpleAuthorizationInfo();

		// 根据用户id获取用户角色信息
		List<SysRole> sysRoles = sysRoleService.getSysRoleByUserId(userId);
		// 将角色列表添加到授权信息内
		Set<String> roles = new HashSet<>();
		for (SysRole sysRole : sysRoles) {
			roles.add(sysRole.getRoleName());
		}
		authorizationInfo.setRoles(roles);

		// 根据用户id获取用户权限信息
		List<SysFunction> sysFunctions = sysFunctionService.getSysFunctionByUserId(userId);
		// 将权限列表添加到授权信息内
		Set<String> functions = new HashSet<>();
		for (SysFunction sysFunction : sysFunctions) {
			functions.add(sysFunction.getPermission());
		}
		authorizationInfo.setStringPermissions(functions);

		return authorizationInfo;
	}

	/**
	 * 身份认证
	 */
	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
		//判断token是否是UsernamePasswordToken
		if (!(token instanceof UsernamePasswordToken)) {
			throw new UnsupportedTokenException();
		}
		// 将token强转为UsernamePasswordToken
		UsernamePasswordToken usernamePasswordToken = (UsernamePasswordToken) token;

		// 从token中得到用户名密码
		String username = usernamePasswordToken.getUsername();
		String password = new String(usernamePasswordToken.getPassword());

		// 根据用户名查询用户信息
		SysUser sysUser = sysUserService.getSysUserByUserName(username);
		// 判断用户是否存在
		if (Objects.isNull(sysUser)) {
			throw new UnknownAccountException();
		}

		// 用户被冻结
		if (Objects.equals(sysUser.getStatus(), 1)) {
			throw new LockedAccountException();
		}

		// 用户被删除
		if (Objects.equals(sysUser.getStatus(), 2)) {
			throw new DisabledAccountException();
		}

		// 判断密码是否正确
		if (!Objects.equals(password, sysUser.getPassword())) {
			throw new IncorrectCredentialsException();
		}
		// 返回认证信息，后续授权通过认证信息得到用户的身份信息
		return new SimpleAuthenticationInfo(
				new ShiroUser(sysUser.getUserId(), sysUser.getUserName(), sysUser.getRealName()), password, getName());
	}

	/**
	 * 清空用户关联权限认证，待下次使用时重新加载
	 */
	public void clearCachedAuthorizationInfo(String principal) {
		SimplePrincipalCollection principals = new SimplePrincipalCollection(principal, getName());
		clearCachedAuthorizationInfo(principals);
	}

	/**
	 * 
	 * 自定义Authentication对象，使得Subject除了携带用户的登录名外还可以携带更多信息
	 * 
	 * @version 2018年3月13日下午6:44:15
	 * @author zhuwenbin
	 */
	class ShiroUser {

		private Integer userId;

		private String userName;

		private String realName;

		public ShiroUser() {
		}

		public ShiroUser(Integer userId, String userName, String realName) {
			this.userId = userId;
			this.userName = userName;
			this.realName = realName;
		}

		public Integer getUserId() {
			return userId;
		}

		public void setUserId(Integer userId) {
			this.userId = userId;
		}

		public String getUserName() {
			return userName;
		}

		public void setUserName(String userName) {
			this.userName = userName;
		}

		public String getRealName() {
			return realName;
		}

		public void setRealName(String realName) {
			this.realName = realName;
		}

		/**
		 * 本函数输出将作为默认的<shiro:principal/>输出
		 * 
		 * @return
		 */
		@Override
		public String toString() {
			return realName;
		}

	}

}
