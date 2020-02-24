<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="order-title">
<c:choose>
	<c:when test="${h1 ne 'IC' }">
		<h3 style="height: 16px; font-size: 12px;">주문 상품 조회</h3>
	</c:when>
	<c:otherwise>
		<h3 style="height: 16px; font-size: 12px;">취소/반품/교환</h3>
	</c:otherwise>
</c:choose>
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
						<c:if test="${h1 ne 'IC'}">
						<img alt="" src="../../resources/images/btn_order_cancel2.gif" style="cursor: pointer;" class="or-cancel" title="${ord.order_num }">
						</c:if>
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