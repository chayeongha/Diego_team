<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link href="resources/css/header.css" rel="stylesheet">
<nav class="navbar navbar-inverse">
<div id="tophover">
	<div class="container-fluid" id="menubar">
		<div class="navbar-header">
			<a class="navbar-brand" href="${pageContext.request.contextPath}/">marciodiego</a>
		</div>
		<ul class="nav navbar-nav menu_list">
			<li class=""><a href="${pageContext.request.contextPath}">신상품</a></li>
			<li><a href=""><span>신상품</span></a></li>
			<li><a href=""><span>레더</span></a>
				<ul class="menu_depth">
					<li><a>지갑</a></li>
					<li><a>가방</a></li>
				</ul></li>
			<li><a href=""> <span>코스메틱</span></a>
				<ul class="menu_depth">
					<li><a>페이스</a></li>
					<li><a>바디</a></li>
				</ul></li>
			<li><a href=""> <span>의류</span></a>
				<ul class="menu_depth">
					<li><a>티셔츠</a></li>
					<li><a>셔츠</a></li>
					<li><a>팬츠</a></li>
					<li><a>슈트</a></li>
				</ul></li>
			<li><a href=""> <span>언더웨어</span></a></li>
			<li><a href=""> <span>이벤트</span>
			</a></li>
			<li><a href=""> <span>고객센터</span>
			</a>
				<ul class="menu_depth">
					<li><a>Notice</a></li>
					<li><a>FAQ</a></li>
					<li><a>Q&A</a></li>
					<li><a>review</a></li>
					<li><a>FAQ</a></li>
				</ul></li>

			<li><a href="${pageContext.request.contextPath}/faq/faqList">FAQ</a></li>
		</ul>
		<ul class="nav navbar-nav navbar-right">
			<c:if test="${not empty sessionScope.admin}">
				<li><a
					href="${pageContext.request.contextPath}/admin/adminMypage"><span
						class="glyphicon glyphicon-user"></span> My Page</a></li>
				<li><a
					href="${pageContext.request.contextPath}/admin/adminLogout"><span
						class="glyphicon glyphicon-log-out"></span> Logout</a></li>
			</c:if>
			<c:if test="${empty admin}">
				<li><a
					href="${pageContext.request.contextPath}/admin/adminJoin"><span
						class="glyphicon glyphicon-user"></span> Sign up</a></li>
				<li><a
					href="${pageContext.request.contextPath}/admin/adminLogin"><span
						class="glyphicon glyphicon-log-in"></span> Login</a></li>
			</c:if>
		</ul>
	</div>
</div>	
</nav>

