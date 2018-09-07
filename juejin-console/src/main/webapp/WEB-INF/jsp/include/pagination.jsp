<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<c:set var="ctxStatic" value="${pageContext.request.contextPath}/static" />

<script type="text/javascript" src="${ctxStatic}/js/pagination.js"></script>

<c:if test="${page.totalPages != 0}">
	<aside class="paging">
		<c:choose>
			<c:when test="${page.firstPage}">
				<a style="background: #798883; border: 1px #798883 solid;">第一页</a>
			</c:when>
			<c:otherwise>
				<a href="javascript:goPage('1');">第一页</a>
			</c:otherwise>
		</c:choose>
		<c:forEach var="x" begin="${page.beginPage}" end="${page.endPage}">
			<c:choose>
				<c:when test="${page.number==x}">
			    	<a style="background: #0b573f; border: 1px #0b573f solid;">${x }</a>
			    </c:when>
			    <c:otherwise>  
			    	<a href="javascript:goPage(${x });">${x }</a>
			    </c:otherwise>
		    </c:choose>
		</c:forEach>
		<c:choose>
			<c:when test="${page.lastPage}"> 
				<a style="background: #798883; border: 1px #798883 solid;">最后一页</a>
		    </c:when>
		    <c:otherwise>  
		    	<a href="javascript:goPage(${page.totalPages});">最后一页</a>
		    </c:otherwise>
	    </c:choose>
	</aside>
</c:if>
