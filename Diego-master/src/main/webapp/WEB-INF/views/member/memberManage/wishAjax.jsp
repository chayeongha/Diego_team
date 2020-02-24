<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<table class="ws-table">
			<thead>
				<tr>
					<th class="ws-checkBox" style="border-left: 0;">
						<input type="checkbox" id="checkAll" size="13px">
					</th>
					<th class="ws-image">이미지
					</th>
					<th class="ws-pro_info">상품정보</th>
					<th class="ws-pro_price">판매가</th>
					<th class="ws-point">적립금</th>
					<th class="ws-deli">배송구분</th>
					<th class="ws-deli_cost">배송비</th>
					<th class="ws-pro_sum">합계</th>
					<th class="ws-btn" style="border-right: 0;">선택</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach items="${wishList }" var="wish" varStatus="i">
				<tr>
					<td class="ws-checkBox" style="border-left: 0; height: 116px;">
						<input type="checkbox" class="wishCheck wish${i.index }" value="${wish.wish_num }" title="${wish.pro_num }">
					</td>
					<td class="ws-image">
						<img alt="위시리스트 사진" src="../../resources/product/images/${wish.image }" height="116px" width="80px">
					</td>
					<td class="ws-pro_info" style="text-align: left; padding-left: 10px;">
						<a href="#" style="font-weight: bold; color: black; text-decoration: none;">${wish.pro_info } </a>
					</td>
					<td class="ws-pro_price">
					<strong><fmt:formatNumber value="${wish.price }" type="number"></fmt:formatNumber>원</strong>
					</td>
					<td class="ws-point">
						<span style="background: #b88cc5; color: white; border: 0; border-radius: 3px; font-size: 8px; height: 12px;">적</span>
						<fmt:formatNumber value="${ps * 0.01 * wish.price}" type="number"></fmt:formatNumber>원
					</td>
					<td class="ws-deli"> ${wish.delivery } </td>
					<td class="ws-deli_cost"> ${wish.delivery_cost } </td>
					<td class="ws-pro_sum">
					<strong><fmt:formatNumber value="${wish.price }" type="number"></fmt:formatNumber>원</strong>
					</td>
					<td class="ws-btn" style="border-right: 0;">
					<button type="button" class="wish-btn wish-order-btn" value="${wish.pro_num }">주문하기</button><br>
					<button type="button" class="wish-btn wish-cart-btn" value="${wish.pro_num }">장바구니담기</button><br>
					<button type="button" class="wish-btn wish-del-btn" value="${wish.wish_num }">삭제</button><br>
					</td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
		<div class="wish-btn-group">
			<span style="float: left;">
			<button id="wish-del-check">삭제하기</button>
			<button id="wish-cart-check">장바구니담기</button>
			</span>
			<span style="float: right;">
			<button id="wish-del-all">관심상품비우기</button>
			</span>
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