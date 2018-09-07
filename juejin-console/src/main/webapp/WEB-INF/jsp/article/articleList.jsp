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
<link rel="stylesheet" type="text/css" href="${ctx }/static/css/style.css">
<!--[if lt IE 9]>
<script src="${ctx }/js/html5.js"></script>
<![endif]-->
<script src="${ctx }/static/js/jquery.js"></script>
<script src="${ctx }/static/js/jquery.mCustomScrollbar.concat.min.js"></script>
<script src="${ctx }/static/js/layer/layer.js"></script>
<script type="text/javascript" src="${ctx }/static/js/My97DatePicker/WdatePicker.js"></script>
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
	
	//删除文章
	function deleteArticle(ctx, id){
		if(confirm("是否确认删除？")){
			$.ajax({
				url: ctx + "/admin/article/" + id,
				dataType: "text",
				type: "DELETE",
				success: function(data){
					if(data == "success"){
						layer.msg("删除成功！");
						location.href = ctx + "/admin/article/articles";
					}else{
						layer.msg("删除失败！");
					}
				}
			});
		}
	}
	
	//全选
	function allSelection(){
		if($('#allSelect').prop('checked')){
			var elements = getAllSelectElements(false);
			$.each(elements, function(index, item){
				$(item).prop("checked", true);
			});
		}else{
			var elements = getAllSelectElements(true);
			$.each(elements, function(index, item){
				$(item).prop("checked", false);
			});
		}
	}
	
	//获取所有被选或不被选的checkbox
	function getAllSelectElements(isSelect){
		var elements;
		if(isSelect){
			elements = $("table tr input[type='checkbox']:checked");
		}else{
			elements = $("table tr input[type='checkbox']");
		}
		return elements;
	}
	
	//导出当前页被选中的文章
	function exportArticle(){
		//获取选中的文章
		var elements = getAllSelectElements(true);
		
		//导出
		if(elements.length != 0){
			 $("#form2").submit();
		}else{
			layer.msg("请选择需要导出的文章！");
		}
	}
	
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
			<li><a href="${ctx }/admin/logout" class="quit_icon">安全退出</a></li>
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
				<h2 class="fl">文章列表</h2>
				<a href="${ctx }/admin/article" class="fr top_rt_btn add_icon">添加文章</a>
				<a href="javascript:void(0);" class="fr top_rt_btn add_icon" onclick="exportArticle()">导出文章</a>
			</div>
			<section class="mtb">
				<!-- form表单的name设置为form1，必须设置 -->
				<form name="form1" id="form1" action="${ctx }/admin/article/articles" method="post">
					<!-- 隐藏域，用来传递当前页码 -->
					<input type="hidden" id="qp_number" name="number" value="${page.number }">
					<input type="hidden" id="page_number" value="${page.number }">
					<input type="text" name="title" class="textbox textbox_225" placeholder="请输入输入标题" value="${page.title }"/> 
					<input type="text" class="textbox textbox_225" style="width: 180px" name="startDate" placeholder="请输入开始时间" 
						 value="<fmt:formatDate value='${page.startDate}'
									pattern='yyyy-MM-dd HH:mm:ss' />" id="startDate"
					onFocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',maxDate:'#F{$dp.$D(\'endDate\')||\'2020-10-01 00:00:00\'}'})"/>
					
					<input type="text" class="textbox textbox_225" style="width: 180px" name="endDate" placeholder="请输入结束时间" 
						 value="<fmt:formatDate value='${page.endDate}'
									pattern='yyyy-MM-dd HH:mm:ss' />" id="endDate"
					onFocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',minDate:'#F{$dp.$D(\'startDate\')}',maxDate:'2020-10-01 00:00:00'})"/>
					<input type="submit" value="查询" class="group_btn" />
				</form>
			</section>
			<!-- form表单的id设置为form2，用于导出excel -->
			<form id="form2" action="${ctx}/admin/article/export" method="post">
				<table class="table">
					<tr>
						<th><input type="checkbox" id="allSelect" onclick="allSelection()">&nbsp;序号</th>
						<th>标题</th>
						<th>内容</th>
						<th>作者</th>
						<th>创建时间</th>
						<th>修改时间</th>
						<th>发布时间</th>
						<th>操作</th>
					</tr>
					<c:forEach var="article" items="${page.datas }">
						<tr>
							<td>
								<input type="checkbox" name="ids" value="${article.id}">
							</td>
							<td class="center">
								<c:choose>
									<c:when test="${fn:length(article.title) > 10 }">
										<a href="${ctx }/admin/article/${article.id}">${fn:substring(article.title, 0, 10) }...</a>
									</c:when>
									<c:otherwise>
										<a href="${ctx }/admin/article/${article.id}">${article.title }</a>
									</c:otherwise>
								</c:choose>
							</td>
							<td class="center">
								<c:choose>
									<c:when test="${fn:length(article.content) > 10 }">
										${fn:substring(article.content, 0, 10) }...
									</c:when>
									<c:otherwise>${article.content }</c:otherwise>
								</c:choose>
							</td>
							<td class="center">${article.userId }</td>
							<td class="center"><fmt:formatDate type="date" value="${article.createDate }"/> </td>
							<td class="center"><fmt:formatDate type="date" value="${article.updateDate }"/> </td>
							<td class="center"><fmt:formatDate type="date" value="${article.publishDate }"/> </td>
							<td class="center">
								<shiro:hasPermission name="article:update">
									<a href="${ctx }/admin/article/${article.id }/editor" title="编辑" class="link_icon">&#101;</a>
								</shiro:hasPermission>
								<shiro:hasPermission name="article:delete">
									<a href="javascript:void(0);" onclick="deleteArticle('${ctx}','${article.id }')" title="删除" class="link_icon">&#100;</a>
								</shiro:hasPermission>
							</td>
						</tr>
					</c:forEach>
				</table>
			</form>
			<%@ include file="../include/pagination.jsp" %>
		</div>
	</section>

</body>
</html>