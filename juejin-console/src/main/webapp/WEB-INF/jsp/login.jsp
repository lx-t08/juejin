<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>后台登录</title>
<meta name="author" content="DeathGhost" />
<link rel="stylesheet" type="text/css" href="${ctx }/static/css/style.css" />
<style>
body {
	height: 100%;
	background: #16a085;
	overflow: hidden;
}

canvas {
	z-index: -1;
	position: absolute;
}

#errorMsg {
	color: red;
	height: 32px;
    line-height: 32px
}

#veridationMsg {
	display: none;
}
</style>
<script src="${ctx }/static/js/jquery.js"></script>
<script src="${ctx }/static/js/verificationNumbers.js"></script>
<script src="${ctx }/static/js/Particleground.js"></script>
<script src="${ctx }/static/js/md5.js"></script>
<script>
	$(document).ready(function() {
		//粒子背景特效
		$('body').particleground({
			dotColor : '#5cbdaa',
			lineColor : '#5cbdaa'
		});
		//验证码
		//createCode();
		//测试提交，对接程序删除即可
		//$(".submit_btn").click(function() {
		//	location.href = "index.html";
		//});
		
	});
	
	function submitForm(){
		//获取用户名密码
		var userName = $("#userName").val();
		var password = $("#password").val();
		
		//正则表达式判断
		var userNameReg = new RegExp("^\\w{3,10}$");
		var passwordReg = new RegExp("^\\w{6,18}$");
		
		if(!userNameReg.test(userName)){
			$("#veridationMsg").html("<div id='errorMsg'>请输入正确的用户名！</div>");
			$("#veridationMsg").show();
			return false;
		}
		if(!passwordReg.test(password)){
			$("#veridationMsg").html("<div id='errorMsg'>请输入正确的密码！</div>");
			$("#veridationMsg").show();
			return false;
		}
		
		//使用md5加密密码
		$("#password").val(MD5(password));
		
		//提交表单
		return true;
	};
</script>
</head>
<body>
	<form id="loginForm" action="${ctx }/admin/doLogin" method="post" onsubmit="return submitForm()">
		<dl class="admin_login">
			<dt>
				<strong>站点后台管理系统</strong> <em>Management System</em>
			</dt>
			<dd class="user_icon">
				<input type="text" id="userName" name="userName" placeholder="账号" class="login_txtbx" />
			</dd>
			<dd class="pwd_icon">
				<input type="password" id="password" name="password" placeholder="密码" class="login_txtbx" />
			</dd>
			
			<dd id="veridationMsg">
				
			</dd>
			
			<c:if test="${errorMsg != null }">
				<dd id="errorMsg">
					<div>${errorMsg }</div>
				</dd>
			</c:if>
			
			<!-- 
			<dd class="val_icon">
				<div class="checkcode">
					<input type="text" id="J_codetext" placeholder="验证码" maxlength="4"
						class="login_txtbx">
					<canvas class="J_codeimg" id="myCanvas" onclick="createCode()">对不起，您的浏览器不支持canvas，请下载最新版浏览器!</canvas>
				</div>
				<input type="button" value="验证码核验" class="ver_btn"
					onClick="validate();">
			</dd>
			 -->
			<dd>
				<input type="submit" value="立即登陆" class="submit_btn" />
			</dd>
			<dd>
				<p>© 2015-2016 DeathGhost 版权所有</p>
				<p>陕B2-20080224-1</p>
			</dd>
		</dl>
	</form>
</body>
</html>