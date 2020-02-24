<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="../../resources/css/member.css" rel="stylesheet">
<title>Mileage</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>
<c:import url="../../layout/header.jsp"/>
<section>
<div class="main" style="min-height: 640px;">
<!--ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ-->
<div class="left">
	<div class="left-menu">
		<ul class="left-list">
			<li style="height: 30px; font-size: 13px; font-weight: bold; color: black;">Community</li>
			<li ><a href="/mid/notice/noticeList">Notice</a></li> 
			<li ><a href="/mid/faq/faqList">FAQ</a></li> 
			<li ><a href="/mid/admin/qnaList">Q&amp;A</a></li> 
			<li ><a href="#">Photo review</a></li> 
			<li ><a href="#">Review</a></li> 
		</ul>
		<ul class="left-list">
			<li style="height: 30px;"><a href="#" style="color: black; font-size: 13px; font-weight: bold;">Event</a></li>
		</ul>
		<ul class="left-list">
			<li style="height: 30px;"><a href="#" style="color: black; font-size: 13px; font-weight: bold;">My page</a></li>
			<c:if test="${!empty member }">
			<li ><a href="../memberUpdate">My info</a></li></c:if>
			<li ><a href="orderMyList">Order</a></li>
			<li ><a href="wishListSelectList">Wish list</a></li>
			<li ><a href="#" style="color: black;">Mileage</a></li>
			<li ><a href="#">My board</a></li>
			<li ><a href="#">Delivery</a></li>
		</ul>
	</div>
</div>
<!--ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ-->
<div class="right">
	<h1 class="right-h1" style="color: #353535">적립금</h1>
	<div class="ptList-title">
		<h3>사용가능 적립금 : <span style="color: black; font-weight: bold; font-size: 20px;"><fmt:formatNumber value="${pointList.get(0).total_point }" type="number"></fmt:formatNumber></span>원
		</h3>
	</div>
<!--ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ-->
	<div class="pt-menu-bar">
		<button class="pt-menu-btn">적립내역</button>
	</div>
<!--ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ-->
	<div class="pt-ajax-table">
		<table class="pt-table">
			<thead>
				<tr>
					<th class="pt-date">적립날짜</th>
					<th class="pt-orderNum">주문 번호</th>
					<th class="pt-value">사용 적립금</th>
					<th class="pt-save">주문 적립금</th>
					<th class="pt-contents">내용</th>
					<th class="pt-totalPoint" style="border-right: 0;">총 적립금</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${pointList }" var="pt" varStatus="p">
					<tr>
						<td class="pt-date">${pt.point_date }</td>
						<td class="pt-orderNum">${pt.order_num }</td>
						<td class="pt-value">
							<fmt:formatNumber value="${pt.point_value }" type="number"></fmt:formatNumber>원
						</td>
						<td class="pt-save">
							<fmt:formatNumber value="${pt.point_save }" type="number"></fmt:formatNumber>원
						</td>
						<td class="pt-contens" style="text-align: left; padding-left: 20px;">${pt.contents }</td>
						<td class="pt-totalPoint" style="border-right: 0;">
							<fmt:formatNumber value="${pt.total_point }" type="number"></fmt:formatNumber>원
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
<!--ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ-->
		<div class="or-pager">
			<c:if test="${pager.curBlock gt 1 }">
				<button type="button" class="btn-pager" id="none-hover"> << </button>
			</c:if>
			<c:if test="${pager.curBlock ne 1 }">
				<button type="button" class="btn-pager" id="none-hover"> < </button>
			</c:if>
			<c:forEach begin="${pager.startNum }" end="${pager.lastNum}" var="p">
			<c:choose>
				<c:when test="${pager.curPage eq p }">
					<button type="button" style="color: black; font-weight: bold;" title="${p }" class="btn-pager"> ${p } </button>
				</c:when>
				<c:otherwise>
					<button type="button" title="${p }"  class="btn-pager"> ${p } </button>
				</c:otherwise>
			</c:choose>
			
			</c:forEach>
			<c:if test="${pager.curBlock lt pager.totalBlock }">
				<button type="button" class="btn-pager" id="none-hover"> > </button>
				<c:if test="${pager.totalBlock gt pager.curBlock+1 }">
					<button type="button" class="btn-pager" id="none-hover"> >> </button>
				</c:if>
			</c:if>
		</div>
<!--ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ-->
	</div>
<!--ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ-->
	<div class="cart-using-info" style="margin-bottom: 50px;">
			<table class="cart-using-table">
				<thead>
					<tr>
						<th>이용안내</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td style="height: 66px;">
							<br>
							<p><span class="cart-using-sp">1</span>&nbsp;주문으로 발생한 적립금은 배송완료 후 7일 부터 실제 사용 가능한 적립금으로 전환됩니다. 배송완료 시점으로부터 7일 동안은 미가용 적립금으로 분류됩니다.</p>
							<p><span class="cart-using-sp">2</span>&nbsp;미가용 적립금은 반품, 구매취소 등을 대비한 임시 적립금으로 사용가능 적립금으로 전환되기까지 상품구매에 사용하실 수 없습니다.</p>
							<p><span class="cart-using-sp">3</span>&nbsp;사용가능 적립금(총적립금 - 사용된적립금 - 미가용적립금)은 상품구매 시 바로 사용가능합니다.</p>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
<!--ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ-->
</div>
<!--ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ-->
</section>
<c:import url="../../layout/footer.jsp"/>
<script type="text/javascript">

	$(".pt-ajax-table").on("click",".btn-pager", function() {
		var id = "${member.id}";
		var curPage = $(this).prop("title");
		$.ajax({
			type	: "POST",
			url		: "pointListAjax",
			data	: {
				id		: id,
				curPage	: curPage
			},
			success	: function(d) {
				$(".pt-ajax-table").html(d);
			}
			
		});
	});

</script>
</body>
</html>