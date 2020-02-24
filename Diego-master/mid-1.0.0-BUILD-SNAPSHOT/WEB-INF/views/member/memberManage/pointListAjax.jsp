<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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