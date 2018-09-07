<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="ctx" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html>
<html>
<head>
		<meta charset="utf-8" />
		<title>掘金网</title>
		<meta name="keywords" content="资讯,最新,最好">
		<meta name="description" itemprop="description" content="资讯-最新、最好的资讯网站">
		<!--指定移动设备优先，width指定屏幕宽度等于设备屏幕宽度；initial-scale指定初始化比例，1.0代表1:1比例呈现；user-scalable指定页面不能缩放-->
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
		<!--重置css样式，增强跨浏览器表现的一致性-->
		<!--<link rel="stylesheet" href="${ctx}/static/css/normalize.css" />-->
		<!--bootstrap的css文件-->
		<link rel="stylesheet" href="${ctx}/static/css/bootstrap.min.css" />
		<!--引入font-awesome-->
		<link rel="stylesheet" href="${ctx}/static/css/font-awesome/css/font-awesome.min.css" />
		<!--引入外部样式-->
		<link rel="stylesheet" href="${ctx}/static/css/index.css" />
		<!--jquery文件-->
		<script type="text/javascript" src="${ctx}/static/js/jquery.min-3.2.1.js"></script>
		<!--bootstrap的js文件-->
		<script type="text/javascript" src="${ctx}/static/js/bootstrap.min.js"></script>
		<!--适配ie9以下的浏览器-->
		<!--[if lt IE 9]>
	      <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
	      <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
	    <![endif]-->
	</head>

	<body>
		<!--页头-->
		<header>
			<nav class="navbar navbar-default">
				<div class="container">
					<!-- Brand and toggle get grouped for better mobile display -->
					<div class="navbar-header">
						<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
				        <span class="sr-only">Toggle navigation</span>
				        <span class="icon-bar"></span>
				        <span class="icon-bar"></span>
				        <span class="icon-bar"></span>
				      </button>
						<a class="navbar-brand" href="index.html">
							<div id="logo">
								<img src="${ctx}/static/img/logo.svg" />
							</div>
						</a>
					</div>

					<!-- Collect the nav links, forms, and other content for toggling -->
					<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
						<ul class="nav navbar-nav">
							<li class="active">
								<a href="#">首页 <span class="sr-only">(current)</span></a>
							</li>
							<li>
								<a href="articleList.html">后端</a>
							</li>
							<li>
								<a href="#">前端</a>
							</li>
							<li class="dropdown">
								<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">其他 <span class="caret"></span></a>
								<ul class="dropdown-menu">
									<li>
										<a href="#">大数据</a>
									</li>
									<li>
										<a href="#">人工智能</a>
									</li>
								</ul>
							</li>
						</ul>
						<form class="navbar-form navbar-left" action="searchList.html">
							<div class="form-group">
								<input type="text" class="form-control" placeholder="搜索掘金">
							</div>
							<button type="submit" class="btn btn-default">搜索</button>
						</form>
						<ul class="nav navbar-nav navbar-right">
							<li>
								<a href="javascript:void(0)"  data-toggle="modal" data-target="#login"><span class="fa fa-sign-in"></span>&nbsp;登陆</a>
							</li>
							<li class="dropdown">
								<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">个人中心 <span class="caret"></span></a>
								<ul class="dropdown-menu">
									<li>
										<a href="#"><span class="fa fa-edit"></span>&nbsp;写文章</a>
									</li>
									<li>
										<a href="#"><span class="fa fa-inbox"></span>&nbsp;草稿</a>
									</li>
									<li>
										<a href="#"><span class="fa fa-home"></span>&nbsp;我的主页</a>
									</li>
									<li role="separator" class="divider"></li>
									<li>
										<a href="#"><span class="fa fa-sign-out"></span>&nbsp;退出</a>
									</li>
								</ul>
							</li>
						</ul>
					</div>
					<!-- /.navbar-collapse -->
				</div>
				<!-- /.container-fluid -->
			</nav>
		</header>
		
		<!--内容-->
		<div class="content">
			<div class="container">
				<div class="row">
					<!--左边-->
					<div class="col-md-9">
						<!--工具栏-->
						<div class="topbar white margin-bottom">
							<div id="topbar-left">
								<a href="#"><span class="fa fa-edit"></span>&nbsp;写文章</a>
								&nbsp;&nbsp;
								<a href="#"><span class="fa fa-link"></span>&nbsp;分享连接</a>
							</div>
							<div id="topbar-right">
								<a href="#"><span class="fa fa-inbox"></span>&nbsp;草稿</a>
							</div>
						</div>
						
						<!--文章列表-->
						<div class="main white margin-bottom">
							<div class="main-header">
								<div class="container-fluid">
									<div class="row">
										<div class="col-md-9">
												<a href="#">热门</a>
												|
												<a href="#">最新</a>
												|
												<a href="#">评论</a>
										</div>
										<div class="col-md-3">
											<div class="pull-right">
												<a href="#">本周最热</a>
												<a href="#">本月最热</a>
												<a href="#">历史最热</a>
											</div>
										</div>
									</div>
								</div>
							</div>
							
							<!--列表-->
							<div class="main-list">
								<c:forEach var="data" items="${page.datas }">
									<div class="main-content">
										<div class="container-fluid">
											<div class="row">
												<div class="col-md-10">
													<div class="main-content-left">
														<p><span>Carson_Ho</span>.<span><fmt:formatDate type="date" value="${data.createDate }"/> </span>.<span>java</span></p>
														<a href="article.html">
															<div class="main-title"><strong>${data.title }</strong></div>
														</a>
														<br>
														<div class="btn-group margin-bottom">
															<button class="btn btn-default"><span class="fa fa-heart"></span>&nbsp;22</button>
															<button class="btn btn-default"><span class="fa fa-comment"></span>&nbsp;112</button>
														</div>
													</div>
												</div>
												<div class="col-md-2">
													<div class="main-content-right">
														<img src="${ctx}/static/img/pic.png" />
													</div>
												</div>
											</div>
										</div>
									</div>
								</c:forEach>
							</div>
						</div>
						
						<!--分页-->
						<%@ include file="include/pagination-hyperlink.jsp"%>
						
					</div>
					<!--右边-->
					<div class="col-md-3">
						<!--广告-->
						<div class="ad">
							<img src="${ctx}/static/img/ad.png" class="ad-img"/>
						</div>
						<div class="ad">
							<img src="${ctx}/static/img/ad.png" class="ad-img"/>
						</div>
						
						<!--二维码-->
						<div class="qr-container white margin-bottom">
							<div class="pull-left" id="qrCode">
								<img src="${ctx}/static/img/QRCode.png" />
							</div>
							<div class="pull-right">
								<div id="qrCode-text">
									<p><strong>下载掘金客户端</strong></p>
									<p>一个帮助开发者成长的社区</p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<!--页脚-->
		<footer></footer>
	</body>
	
	<!--登陆框-->
	<div class="modal fade" id="login" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="exampleModalLabel">登陆</h4>
	      </div>
	      <div class="modal-body">
	        <form>
	          <div class="form-group">
	            <label for="recipient-name" class="control-label">用户名:</label>
	            <input type="text" class="form-control">
	          </div>
	          <div class="form-group">
	            <label for="message-text" class="control-label">密码:</label>
	            <input type="password" class="form-control">
	          </div>
	        </form>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
	        <button type="button" class="btn btn-primary">登陆</button>
	      </div>
	    </div>
	  </div>
	</div>
</html>