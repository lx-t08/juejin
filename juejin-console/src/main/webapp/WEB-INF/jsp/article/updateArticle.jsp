<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- shiro标签库 -->
<%@ taglib uri="http://shiro.apache.org/tags" prefix="shiro"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="ctx" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>后台管理系统</title>
<meta name="author" content="DeathGhost" />
<link rel="stylesheet" type="text/css"
	href="${ctx }/static/css/style.css">
<!--[if lt IE 9]>
<script src="js/html5.js"></script>
<![endif]-->
<script src="${ctx }/static/js/jquery.js"></script>
<script src="${ctx }/static/js/jquery.mCustomScrollbar.concat.min.js"></script>
<script>
	(function($) {
		$(window).load(
				function() {

					$("a[rel='load-content']").click(
							function(e) {
								e.preventDefault();
								var url = $(this).attr("href");
								$.get(url, function(data) {
									$(".content .mCSB_container").append(data); //load new content inside .mCSB_container
									//scroll-to appended content 
									$(".content").mCustomScrollbar("scrollTo",
											"h2:last");
								});
							});

					$(".content").delegate(
							"a[href='top']",
							"click",
							function(e) {
								e.preventDefault();
								$(".content").mCustomScrollbar("scrollTo",
										$(this).attr("href"));
							});

				});
	})(jQuery);
</script>
</head>
<body>
	<!--header-->
	<header>
		<h1>
			<img src="${ctx }/static/images/admin_logo.png" />
		</h1>
		<ul class="rt_nav">
			<li><a href="http://www.deathghost.cn" target="_blank"
				class="website_icon">站点首页</a></li>
			<li><a href="#" class="clear_icon">清除缓存</a></li>
			<li><a href="#" class="admin_icon">DeathGhost</a></li>
			<li><a href="#" class="set_icon">账号设置</a></li>
			<li><a href="login.html" class="quit_icon">安全退出</a></li>
		</ul>
	</header>
	<!--aside nav-->
	<!--aside nav-->
	<aside class="lt_aside_nav content mCustomScrollbar">
		<h2>
			<a href="index.html">起始页</a>
		</h2>
		<ul>
			<!-- 设置访问需要的权限标识 -->
			<shiro:hasPermission name="user:users">
				<li>
					<dl>
						<dt>用户管理</dt>
						<dd>
							<a href="${ctx }/admin/user/users">用户列表</a>
						</dd>
					</dl>
				</li>
			</shiro:hasPermission>
			<!-- 设置访问需要的权限标识 -->
			<shiro:hasPermission name="role:roles">
				<li>
					<dl>
						<dt>角色管理</dt>
						<dd>
							<a href="user_list.html">角色列表</a>
						</dd>
					</dl>
				</li>
			</shiro:hasPermission>
			<!-- 设置访问需要的权限标识 -->
			<shiro:hasPermission name="function:functions">
				<li>
					<dl>
						<dt>权限管理</dt>
						<dd>
							<a href="user_list.html">权限列表</a>
						</dd>
					</dl>
				</li>
			</shiro:hasPermission>
			<!-- 设置访问需要的权限标识 -->
			<shiro:hasPermission name="article:articles">
				<li>
					<dl>
						<dt>文章管理</dt>
						<dd>
							<a href="${ctx }/admin/article/articles">文章列表</a>
						</dd>
					</dl>
				</li>
			</shiro:hasPermission>
		</ul>
	</aside>

	<section class="rt_wrap content mCustomScrollbar">
		<div class="rt_content">
			<div class="page_title">
				<h2 class="fl">修改文章</h2>
			</div>
			<form action="${ctx }/admin/article" method="post">
				<!-- 添加put支持 -->
				<input type="hidden" name="_method" value="PUT">
				<!-- 文章id -->
				<input type="hidden" name="id" value="${id }">
				<ul class="ulColumn2">
					<li><span class="item_name" style="width: 120px;">上传头像：</span>
						<label class="uploadImg"> <input type="file" /> <span>上传头像</span>
					</label></li>
					<li><span class="item_name" style="width: 120px;">会员名称：</span>
						<input type="text" class="textbox textbox_225" value="DeathGhost"
						placeholder="会员账号..." /> <span class="errorTips">错误提示信息...</span></li>
					<li><span class="item_name" style="width: 120px;">登陆密码：</span>
						<input type="password" class="textbox textbox_225"
						value="1830000000" placeholder="会员密码..." /> <span
						class="errorTips">错误提示信息...</span></li>
					<li><span class="item_name" style="width: 120px;">会员等级：</span>
						<select class="select">
							<option>会员等级</option>
							<option>普通会员</option>
							<option>高级会员</option>
					</select></li>
					<li><span class="item_name" style="width: 120px;">电子邮箱：</span>
						<input type="email" class="textbox textbox_225"
						value="DeathGhost@sina.cn" placeholder="电子邮件地址..." /> <span
						class="errorTips">错误提示信息...</span></li>
					<li><span class="item_name" style="width: 120px;">手机号码：</span>
						<input type="tel" class="textbox textbox_225" value="18300000000"
						placeholder="手机号码..." /> <span class="errorTips">错误提示信息...</span></li>
					<li><span class="item_name" style="width: 120px;">可用资金：</span>
						<input type="text" class="textbox textbox_225" value="1599.00"
						placeholder="可用资金（单位：元）..." readonly /> <span>元</span></li>
					<li><span class="item_name" style="width: 120px;">冻结资金：</span>
						<input type="text" class="textbox textbox_225" value="100.00"
						placeholder="冻结资金（单位：元）..." readonly /> <span>元</span></li>
					<li><span class="item_name" style="width: 120px;">收货地址：</span>
						<select class="select">
							<option>选择省份</option>
							<option>陕西省</option>
							<option>山西省</option>
					</select> <select class="select">
							<option>选择城市</option>
							<option>西安市</option>
							<option>大同市</option>
					</select> <select class="select">
							<option>选择区/县</option>
							<option>长安县</option>
							<option>不晓得</option>
					</select></li>
					<li><span class="item_name" style="width: 120px;">详细地址：</span>
						<input type="text" class="textbox textbox_295"
						value="陕西省西安市未央区凤城五路旺景国际大厦" placeholder="详细地址..." /> <span
						class="errorTips">错误提示信息...</span></li>
					<li><span class="item_name" style="width: 120px;"></span> <input
						type="submit" class="link_btn" value="更新/保存" /></li>
				</ul>
			</form>
		</div>
	</section>
</body>
</html>