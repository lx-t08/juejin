<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- shiro标签库 -->
<%@ taglib uri="http://shiro.apache.org/tags" prefix="shiro"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>后台管理系统</title>
<meta name="author" content="DeathGhost" />
<link rel="stylesheet" type="text/css" href="${ctx }/css/style.css">
<!--[if lt IE 9]>
<script src="${ctx }/js/html5.js"></script>
<![endif]-->
<script src="${ctx }/js/jquery.js"></script>
<script src="${ctx }/js/jquery.mCustomScrollbar.concat.min.js"></script>
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
			<img src="${ctx }/images/admin_logo.png" />
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
							<a href="${ctx }/admin/users">用户列表</a>
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
							<a href="${ctx }/admin/articles">文章列表</a>
						</dd>
					</dl>
				</li>
			</shiro:hasPermission>
		</ul>
	</aside>

	<section class="rt_wrap content mCustomScrollbar">
		<div class="rt_content">
			<div class="page_title">
				<h2 class="fl">你没有该权限，请联系管理员</h2>
				<a href="${ctx }/admin/index" class="fr top_rt_btn add_icon">返回首页</a>
			</div>
		</div>
	</section>
</body>
</html>