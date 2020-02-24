<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Member Home</title>
<style type="text/css">
	*{
	text-align: center;
	}
	a{	
		font-size: 30px;
		text-decoration: none;
	}
	a:hover{
		text-decoration: underline;
	}

</style>
</head>
<body>
	<h1>MEMBER</h1>
	<c:choose>
	<c:when test="${empty member }">
	<a href="${pageContext.request.contextPath}/member/memberLogin">로그인</a>
	<br>
	</c:when>
	<c:otherwise>
	<a href="${pageContext.request.contextPath}/member/memberLogout">로그아웃</a>
	<br>
	</c:otherwise>
	</c:choose>
	<a href="${pageContext.request.contextPath}/member/memberUpdate">update</a>
	<br>
	<a href="${pageContext.request.contextPath}/member/memberSelect">mypage</a>
	<br>
	<a href="${pageContext.request.contextPath}/member/memberInsert">join</a>
	<br>
	<br>
	<h1>CART</h1>
	<a href="${pageContext.request.contextPath}/member/memberManage/cartList" >CTL</a>
	<br>
	<br>
	<h1>POINT</h1>
	<a href="${pageContext.request.contextPath}/member/memberManage/pointInsert" >PI</a>
	<br>
	<a href="${pageContext.request.contextPath}/member/memberManage/pointUse">PU</a>
	<br>
	<a href="${pageContext.request.contextPath}/member/memberManage/pointMyList">PML</a>
	<br>
	<a href="${pageContext.request.contextPath}/member/memberManage/pointList">PL</a>
	<br>
	<br>
	<h1>WISHLIST</h1>
	<a href="${pageContext.request.contextPath}/member/memberManage/wishListInsert">WLI</a>
	<br>
	<a href="${pageContext.request.contextPath}/member/memberManage/wishListSelectList">WLSL</a>	
	<br>
	<br>
	<h1>ORDER</h1>
	<a href="${pageContext.request.contextPath}/member/memberManage/orderInsert">OI</a>
	<br>
	<a href="${pageContext.request.contextPath}/member/memberManage/orderSeleet">OS</a>
	<br>
	<a href="${pageContext.request.contextPath}/member/memberManage/orderMyList">OML</a>
	<br>
	<a href="${pageContext.request.contextPath}/member/memberManage/orderList">OL</a>
	<br>
	<a href="${pageContext.request.contextPath}/member/memberManage/orderDelete">OD</a>
	<br>
	<br>
	<h1>COUPON</h1>
	<a href="${pageContext.request.contextPath}/member/memberManage/couponMaker">CM</a>
	<br>
	<a href="${pageContext.request.contextPath}/member/memberManage/couponInsert">CI</a>
	<br>
	<a href="${pageContext.request.contextPath}/member/memberManage/couponSelect">CS</a>
	<br>
	<a href="${pageContext.request.contextPath}/member/memberManage/couponMyList">CML</a>
	<br>
	<a href="${pageContext.request.contextPath}/member/memberManage/couponList">CL</a>
	<br>
	<a href="${pageContext.request.contextPath}/member/memberManage/couponDelete">CD</a>
	<br>
	<br>
	<a href="${pageContext.request.contextPath}/mainProduct">프로덕트</a>
	<br>
	
</body>
</html>