<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 주문 목록</title>
<link href="../../resources/css/member.css" rel="stylesheet">
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<c:import url="../../common/calendar.jsp"/>
</head>
<body>
<c:import url="../../layout/header.jsp"/>
<section style="width: 100%; overflow: hidden;">
<div class="main" style="height: auto;">
<!--ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->
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
			<li ><a href="#" style="color: black;">Order</a></li>
			<li ><a href="wishListSelectList">Wish list</a></li>
			<li ><a href="pointMyList">Mileage</a></li>
			<li ><a href="#">My board</a></li>
			<li ><a href="#">Delivery</a></li>
		</ul>
	</div>
</div>
<!--ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->
<div class="right">
	<h1 class="right-h1">주문 조회</h1>
<!--ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->
	<div class="ajax-bar">
	<ul style="border-bottom:1px solid #cbcdce; width: 100%; height: 42px;">
	<li><button id="all-list" class="btn-list-sel" title="orderAllList" name="AL">주문내역조회 </button></li>
	<li><button id="can-list" class="btn-list" title="orderCancelList" name="CL">취소/반품/교환 내역</button></li>
	</ul>
	</div>
<!--ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->
	<div class="cal-bar">
		<div class="search-div">
		<form action="" method="get" class="search-form">
			<div>
				<select id="order_status" name="order_status" >
					<option value="AL" selected="selected">전체 주문처리상태</option>
					<option value="WP">입금전</option>
					<option value="WD">배송준비중</option>
					<option value="DV">배송중</option>
					<option value="DC">배송완료</option>
					<option value="OC">취소</option>
					<option value="OX">교환</option>
					<option value="OR">반품</option>
				</select>
			</div>
			<div style="margin: 0 10px 0 0;">
				<button type="button" class="btn-search" value="0">오늘</button>
				<button type="button" class="btn-search" value="7">1주일</button>
				<button type="button" class="btn-search" value="30">1개월</button>
				<button type="button" class="btn-search" value="90">3개월</button>
				<button type="button" class="btn-search" value="180">6개월</button>
			</div>
			<div>
				<input type="text" class="ip-cal" id="cal-left" name="order_date" readonly="readonly"> <span>&nbsp;~&nbsp;</span>
				<input type="text" class="ip-cal" id="cal-right" readonly="readonly">
			</div>
			<div>
				<button type="button" id="sel" style="vertical-align: middle; background: #495164; border: none; color: white; width: 39px; height: 24px; margin-left: 10px; font-size: 11px; border-radius: 2px;">조회</button>
			</div>
		</form>
		</div>
		<div style="height: 36px; margin-top: 10px; width: 100%; font-size: 11px; color: #939393; line-height: 1.5;">
			<ul>
				<li>&nbsp;* 기본적으로 최근 3개월간의 자료가 조회되며, 기간 검색시 지난 주문내역을 조회하실 수 있습니다.</li>
				<li>&nbsp;* 주문번호를 클릭하시면 해당 주문에 대한 상세내역을 확인하실 수 있습니다.</li>
			</ul>
		</div>
	</div>
<!--ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->
<div class="ajax-table">
	<div class="order-title">
		<h3 style="height: 16px; font-size: 12px;">주문 상품 정보</h3>
	</div>
	<div style="margin-top: 10px; width: 100%; min-height: 220px;">
		<table class="order-table">
			<thead>
				<tr>
					<th class="or-order_num" style="border-left: none;">주문일자 <br>[주문번호]</th>
					<th class="or-image">이미지</th>
					<th class="or-pro_info">상품정보</th>
					<th class="or-pro_count">수량</th>
					<th class="or-price">상품구매금액</th>
					<th class="or-order_status">주문처리상태</th>
					<th class="or-order_result" style="border-right: none;">취소/교환/반품</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach items="${orderList }" var="ord" varStatus="i">
				<tr>
					<td class="or-order_num" style="border-left: none;">
						${ord.order_date }<br>
						[<a href="#">${ord.order_num }</a>]<br><br>
						<img alt="" src="../../resources/images/btn_order_cancel2.gif" style="cursor: pointer;" class="or-cancel" title="${ord.order_num }">
					</td>
					<td class="or-image">
						<a href="#">
							<img alt="상품사진" src="../../resources/product/images/${ord.image }" width="80px" height="116px">
						</a>
					</td>
					<td class="or-pro_info" style="text-align: left; padding: 14px 10px 15px; vertical-align: sub;">
						<a href="#" style="font-weight: bold;">${ord.pro_info }</a> <br>
						<p>[ord.pro_option]</p>
					</td>
					<td class="or-pro_count">
						${ord.pro_count }
					</td>
					<td class="or-price">
					<fmt:formatNumber value="${ord.order_sum }" type="number"></fmt:formatNumber>원</td>
					<td class="or-order_status">
						${ord.order_status }
					</td>
					<td class="or-order_result" style="border-right: none;">
					-
					</td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
<c:if test="${orderList.size() eq 0 }">
	<p class="no-order"> 주문 내역이 없습니다</p>
</c:if>
	</div>
<!--ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->
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
</div>	
<!--ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->
</div>
<!--ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->
</div>
</section>


<c:import url="../../layout/footer.jsp"/>

<script type="text/javascript">


	$(document).ready(function() {
		
	var today = new Date().toISOString().substr(0, 10).replace('T', ' ');
 	$("#cal-right").prop("value", today);
 	today = new Date();
	var day = 1000*60*60*24*90;
	day = today.getTime() - day;
	today.setTime(day);
	today = new Date(today).toISOString().substr(0, 10).replace('T', ' ');
 	$("#cal-left").prop("value", today);
 	
 	
	});
	
 	today = new Date();
	
 	$(".btn-search").on("click", function() {
 		var day = new Date();
 		day.setDate(today.getDate()-$(this).val());
 		day = new Date(day).toISOString().substr(0, 10).replace('T', ' ');
 		
 	 	$("#cal-left").prop("value", day);
	});
	

	
		$(function() {
		    $("#cal-left").datepicker({
		    	dateFormat : "yy-mm-dd"
		    });
		});
		
	$(".ajax-table").on("click",".or-cancel", function() {
		if (confirm("취소하시겠습니까?")) {
			$.ajax({
				type : "POST",
				url : "orderCancel",
				data : {
					order_num 	: $(this).prop("title"),
					id 			: "${member.id}"
				},
				success : function(data) {
					data = data.trim();
					if (data == 1) {
						alert("주문이 취소됐습니다.");
						location.reload();
					}else{
						alert("다시 시도해 주세요.")
						}
					}
			});
		}
	});
	
	
	$("#all-list").click(function() {

		list("orderAllList",1,$(this).prop("name"));
	});
	
	$("#can-list").click(function() {

		list("orderCancelList",1,$(this).prop("name"));
	});
	
	
	$("#sel").click(function() {
		list($(".btn-list-sel").prop("title"),1,$(".btn-list-sel").prop("name"));
		

	});
	
		
	
	function list(url,curPage,name) {
		var d = $("#cal-left").val();
		var status = $("#order_status").val();
		$.ajax({
			type	: "GET",
			url		: url,
			data	: {
				id		: "${member.id}",
				order_date : d,
				curPage : curPage,
				order_status : status
			},
			success	: function(data) {
					
				if (name == "CL" || name =="OX" || name == "OR") {
					$(".ajax-table").html(data);
					$("#can-list").prop("class", "btn-list-sel");
					$("#all-list").prop("class", "btn-list");
					$("#order_status").prop("hidden", true);
				}else{
					$(".ajax-table").html(data);
					$("#all-list").prop("class", "btn-list-sel");
					$("#can-list").prop("class", "btn-list");
					$("#order_status").prop("hidden", false);
				}
				
				
			}
		});
	}
	
	
	$(".ajax-table").on("click",".btn-pager", function() {
		list($(".btn-list-sel").prop("title"),$(this).prop("title"),$(".btn-list-sel").prop("name"));
	}) ;
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
		
</script>
</body>
</html>