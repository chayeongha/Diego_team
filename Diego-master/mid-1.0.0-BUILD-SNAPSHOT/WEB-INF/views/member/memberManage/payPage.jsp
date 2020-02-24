<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 추가하기</title>
<link href="../../resources/css/member.css" rel="stylesheet">
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<body>
<c:import url="../../layout/header.jsp"/>
<section>
<div class="main" style="min-height: 1325px;">
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
			<li ><a href="orderMyList">Order</a></li>
			<li ><a href="wishListSelectList">Wish list</a></li>
			<li ><a href="pointList">Mileage</a></li>
			<li ><a href="#">My board</a></li>
			<li ><a href="#">Delivery</a></li>
		</ul>
	</div>
</div>
<!--ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->
<div class="right">
	<h1 class="right-h1" style="color: #353535;">주문서 작성</h1>
		<div class="cart-mem-info">
		<div class="cart-info-h1">
			<p style="color: #404040; font-size: 12px; line-height: 71px; font-weight: bold;">혜택정보</p>
		</div>
		<div class="cart-info-mem">
			<p><strong>${member.name }</strong>님은, [${member.mem_rank }] 회원이십니다. </p>
			<p style="margin-bottom: 10px;">
				<strong><fmt:formatNumber type="number">${up }</fmt:formatNumber></strong>원 이상 구매시 <strong>${x }</strong>% 추가적립 받으실수 있습니다. </p>
			<hr>
			<p style="margin-top: 10px;">
				<span style="margin-right: 30px;">가용 적립금 : <strong><fmt:formatNumber type="number">${point.total_point }</fmt:formatNumber></strong>원 &nbsp;</span>
				<span>쿠폰 : <strong id="cart-coupon-ajax" onmousedown="viewCoup(this)" onmouseup="viewCount(this)">${coupon.size() }</strong>&nbsp;개</span> </p>
				<span id="cart-coupon-view">
				<c:forEach items="${coupon }" var="coup" varStatus="c">
					${c.count }. ${coup.coup_name } (${coup.discount }%)<br>
				</c:forEach>
				</span>
			<br>
		</div>
		</div>
	<div class="cart-ajax">
		<div class="cart-ajax-bar">
			<ul style="border-bottom:1px solid #cbcdce; width: 100%; height: 42px;">
			<li><button id="all-list" class="btn-list-sel">국내배송상품(${cartList.size()})</button></li>
			</ul>
		</div>
<!--ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->
		<div class="cart-ajax-table">
			<div class="cart-table-title">
				<p>일반상품(${cartList.size()})</p>
			</div>
			<div class="cart-table-div" style="width: 100%; text-align: center;">
				<table class="cart-table">
					<thead>
						<tr>
							<th class="cart-checkBox" style="border-left: 0;"><input type="checkbox" id="checkAll" size="13px" width="80px"></th>
							<th class="cart-image">이미지</th>
							<th class="cart-pro_info" width="1000px">상품정보</th>
							<th class="cart-price" style="width: 200px;">판매가</th>
							<th class="cart-count">수량</th>
							<th class="cart-point" style="width: 200px;">적립금</th>
							<th class="cart-deli-cost" style="border-right: 0;">배송비</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${list }" var="pro" varStatus="i">
							<tr>
								<td class="cart-checkBox" style="border-left:0; width: 80px;">
									<input type="checkbox" class="cartCheck cart${i.index }" value="${pro.pro_num }" title="${i.index }">
								</td>
								<td class="cart-image">
									<img alt="장바구니 사진" src="../../resources/product/images/${pro.pro_image }" height="116px" width="80px">
								</td>
								<td class="cart-pro_info" style="text-align: left; width: 1000px;">
									<a href="../../product/productSelect?pro_num=${pro.pro_num }" style="font-weight: bold; color: black; text-decoration: none; margin-left: 10px;">${pro.pro_name} </a>
								</td>
								<td class="cart-price" style="width: 200px;">
									<input type="hidden" class="cart-pro_price${i.index }" value="${pro.pro_price }">
									<strong><fmt:formatNumber value="${pro.pro_price }" type="number"></fmt:formatNumber>원</strong>
								</td>
								<td class="cart-count">
									<p style="position: relative;">
									<input type="number" min="1" class="cart-pro_count${i.index } count-check" value="1" style="height: 21px; width: 29px; border-radius: 3px; line-height: 21px; border: 1px solid #eaeaea;">
									</p>
								</td>
								<td class="cart-point" style="width: 200px;">
									<span style="background: #b88cc5; color: white; border: 0; border-radius: 3px; font-size: 8px; height: 12px;">적</span>
									<input type="hidden" class="point-saves" value="${ps * 0.01 * pro.pro_price}">
									<fmt:formatNumber value="${ps * 0.01 * pro.pro_price}" type="number"></fmt:formatNumber>원
								</td>
								<td class="cart-deli-cost" style="border-right: 0;">무료</td>
							</tr>
						
						</c:forEach>
					</tbody>
				</table>
<!--ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->
				<h1 style="margin:20px 20px 0; text-align: center; font-size: 13px; color: #555555;">상품구매금액 <span class="cart-sum-sp" style="color: black;"></span>원 + 배송비 0 (무료) x&nbsp;
				<span>
					<select class="coup_num" id="coupon">
						<option value="1">사용할 쿠폰을 선택하세요</option>
						<c:forEach items="${coupon }" var="coupon" varStatus="i">
							<option value="${coupon.sales_value}" title="${coupon.coup_num }"
								class="copt">${coupon.coup_name }(${coupon.discount }%)</option>
						</c:forEach>
					</select> 
				</span>= 합계 : <strong style="font-size: 17px; color: black;"><span class="cart-sum-final" ></span></strong>원 </h1>
				<p style="text-align: left;"><button id="pay-check-del">삭제하기</button></p>
<!--ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->
				<div class="cart-warning">
					<p style="margin-left: 33px; padding: 8px 0; color: #f76560">
					<span style="border: 1px solid #eaeaea; color: red; padding: 1px 4px; font-size: 11px; border-radius: 3px;">!</span>&nbsp;상품의 옵션 및 수량 변경은 상품상세 또는 장바구니에서 가능합니다.</p>
				</div>
				
<!--ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->
			<br><p style="color: black; font-size: 12px; margin-left: 20px; font-weight: bold; text-align: left;">배송정보</p><br>
<!--ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->
				<div>
					<table class="info-table">
						<tr>
							<th>받으시는분<img alt="필수" src="../../resources/images/ico_required.gif"></th>
							<td><input type="text" name="name" placeholder="Enter name" value="${member.name }"></td>
						</tr>
						<tr>
							<th>주소</th>
							<td><input id="pn" name="address_pn" readonly="readonly" style="width: 50px;" value="${member.address_pn }"> <img alt="우편" src="../../resources/images/btn_zipcode.gif" style="vertical-align: middle; cursor: pointer;" onclick="postNum()">
							<br><input id="ba" name="address_ba" readonly="readonly" style="margin-top: 5px; width: 280px;" value="${member.address_ba }"><span> 기본주소</span>
							<br><input id="da" name="address_da" style="margin-top: 5px; width: 280px;" value="${member.address_da }"><span> 상세주소</span>
							</td>
						</tr>
						<tr>
							<th>휴대전화<img alt="필수" src="../../resources/images/ico_required.gif"></th>
							<td>
							<select class="phone" style="height: 24px; width: 60px; vertical-align: middle; border: 1px solid #eaeaea;">
										   	<option class="opt">010</option>
									      	<option class="opt">011</option>
									      	<option class="opt">016</option>
									      	<option class="opt">017</option>
									      	<option class="opt">018</option>
									      	<option class="opt">019</option>
									      </select>
									      <span class="phone">-</span>
									      <input id="phone" class="phone" type="text" maxlength="4" value="${p2 }" required="required">
									      <span class="phone">-</span>
									      <input id="phone" class="phone" type="text" maxlength="4" value="${p3 }" required="required">
									      <input type="hidden" name="phone" id="ph-number">
							</td>
						</tr>
						<tr>
							<th>이메일<img alt="필수" src="../../resources/images/ico_required.gif"></th>
							<td>
								<input type="text" name="email" value="${member.email }" required="required">
								<p style="color: #707070;">이메일을 통해 주문처리과정을 보내드립니다.</p>
								<p style="color: #707070;">이메일 주소란에는 반드시 수신가능한 이메일주소를 입력해 주세요.</p>
							</td>
						</tr>
						<tr>
							<th>배송 메시지</th>
							<td>
								<select style="vertical-align: middle; border: 1px solid #eaeaea; height: 24px; width: 280px;">
									<option>부재시 경비실에 맡겨주세요.</option>
									<option>도착 10분전에 연락해주세요.</option>
									<option>문앞에 놔두고 가주세요.</option>
									<option>배송 출발 전 연락해주세요.</option>
								</select>
							</td>
						</tr>
					</table>
				</div>
<!--ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->			
			<br><p style="color: black; font-size: 12px; margin-left: 20px; font-weight: bold; text-align: left;">결제 예정 금액</p>
				<div class="cart-check-view" style="display: block;">
					<table class="cart-view-table">
						<thead>
							<tr>
								<th class="cart-view-pro" style="border-left: 0;">총 상품금액</th>
								<th class="cart-view-deli">총 할인금액</th>
								<th class="cart-view-price" style="border-right: 0;">총 결제예정금액</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td class="cart-view-pro" style="border-left: 0;"><span class="cart-view-sp"></span>원</td>
								<td class="cart-view-deli">-<span class="cart-view-sp1">0</span>원</td>
								<td class="cart-view-price" style="border-right: 0;"><span class="cart-view-sp2"></span>원</td>
							</tr>
						</tbody>
					</table>
					<table class="info-table">
						<tr>
							<th>적립금</th>
							<td> <input id="pay-point_value" name="point_value" type="number" min="0" width="200px" style="text-align: right;" value="0">원 <span>(총 사용가능 적립금 : <span style="color: #f76560;">${point.total_point }</span>원)</span><br>
								<p>- 적립금은 최소 1,000 이상일 때 결제가 가능합니다.</p>
								<p>- 최대 사용금액은 제한이 없습니다.</p>
								<p>- 적립금으로만 결제할 경우, 결제금액이 0으로 보여지는 것은 정상이며 [결제하기] 버튼을 누르면 주문이 완료됩니다.</p>
							</td>
						</tr>
					</table>
				</div>
<!--ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->
			</div>
		</div>
	<div class="cart-using-info">
		<table class="cart-using-table">
			<thead>
				<tr>
					<th>무이자 할부 이용안내</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td style="height: 60px;">
						<p>- 무이자할부가 적용되지 않은 상품과 무이자할부가 가능한 상품을 동시에 구매할 경우 전체 주문 상품 금액에 대해 무이자할부가 적용되지 않습니다.</p>
						<p>- 무이자할부를 원하시는 경우 장바구니에서 무이자할부 상품만 선택하여 주문하여 주시기 바랍니다.</p>
					</td>
				</tr>
			</tbody>
		</table>
		<br>
	</div>
<!--ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->
	<div class="kakao-pay-div">
	<br><p style="color: black; font-size: 12px; margin-left: 20px; font-weight: bold; text-align: left;">결제 수단</p>
	<table class="cart-view-table" style="margin: 10px 0 20px 20px;">
		<thead>
			<tr>
				<th width="1290px">
					<input type="radio" checked="checked">&nbsp;카카오페이
				</th>
				<th style="width: 260px;">
					카카오페이(간편결제) 최종결제금액
				</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td width="1290px;">
					<p style="margin-left: 33px; padding: 8px 0; font-size: 12px;">
						<span style="border: 1px solid #eaeaea; color: red; padding: 1px 4px; font-size: 11px; border-radius: 3px;">!</span>
						&nbsp;휴대폰에 설치된 카카오톡 앱에서 비밀번호 입력만으로 빠르고 안전하게 결제가 가능한 서비스 입니다.</p>
					<p style="margin-left: 33px; padding: 8px 0; font-size: 12px;">
						<span style="border: 1px solid #eaeaea; color: red; padding: 1px 4px; font-size: 11px; border-radius: 3px;">!</span>
						&nbsp;안드로이드의 경우 구글 플레이, 아이폰의 경우 앱 스토어에서 카카오톡 앱을 설치 한 후, 최초 1회 카드 및 계좌 정보를 등록하셔야 사용 가능합니다.</p>
					<p style="margin-left: 33px; padding: 8px 0; font-size: 12px;">
						<span style="border: 1px solid #eaeaea; color: red; padding: 1px 4px; font-size: 11px; border-radius: 3px;">!</span>
						&nbsp;인터넷 익스플로러의 경우 8 이상에서만 결제 가능합니다.</p>
					<p style="margin-left: 33px; padding: 8px 0; font-size: 12px;">
						<span style="border: 1px solid #eaeaea; color: red; padding: 1px 4px; font-size: 11px; border-radius: 3px;">!</span>
						&nbsp;BC카드 중 신한, 하나, 국민카드는 결제가 불가능합니다.</p>
				</td>
				<td style="font-size: 12px; width: 260px; text-align: center;">
					<p style="text-align: right; font-size: 30px; font-weight: bold; color: black;"><span class="kakao-pay-final">0</span> 원</p>
					<br>
					<form action="kakaoPay" method="post" onsubmit="return kPay()" >
<!--ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ히든그룹 -->
					<input type="hidden" name="id" value="${member.id }">
					<c:choose>
						<c:when test="${list.size() eq 1 }">
							<input type="hidden" name="pro_info" value="${list.get(0).getPro_name() }">
						</c:when>
						<c:otherwise>
							<input type="hidden" name="pro_info" value="${list.get(0).getPro_name() }외 ${list.size()-1} 건">
						</c:otherwise>
					</c:choose>
					<input type="hidden" name="pro_count" value="${list.size() }">
					<input type="hidden" name="order_sum" id="pay-order_sum" value="">
					<input type="hidden" name ="image" id="pro_image" value="${list.get(0).getPro_image() }">
					<input type="hidden" name ="pro_num" id="pro_num" value="${list.get(0).getPro_num() }">
					<input type="hidden" name="price" id="order-price">
					<input type="hidden" name="coup_num" id="param" value="9999">
					<input type="hidden" name="point_save" id="pt-sv">
					<input id="param-point_value" name="point_value" type="hidden" value="0">
					<input type="hidden" name="total_point" value="${point.total_point }">
					<button type="submit" id="kakao-pay-btn">결제하기</button><br>
<!--ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ히든그룹 -->
					</form>
					<br>
					<p style="text-align: left; margin-left: 30px;">총 적립예정금액 <span class="final-point-save" style="color: #f76560;"></span>원</p>
					<br>
				</td>
			</tr>
		</tbody>
	</table>
	</div>

<!--ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->
	<div class="cart-using-info">
		<table class="cart-using-table">
			<thead>
				<tr>
					<th>이용안내</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>
						<br>
						<h4>WindowXP 서비스팩2를 설치하신후 결제가 정상적인 단계로 처리되지 않는경우, 아래의 절차에 따라 해결하시기 바랍니다.내</h4>
						<br>
						<p><span class="cart-using-sp">1</span>&nbsp;안심클릭 결제모듈이 설치되지 않은 경우 ActiveX 수동설치</p>
						<p><span class="cart-using-sp">2</span>&nbsp;Service Pack 2에 대한 Microsoft사의 상세안내</p>
						<br>
						<h4>아래의 쇼핑몰일 경우에는 모든 브라우저 사용이 가능합니다.</h4>
						<br>
						<p><span class="cart-using-sp">1</span>&nbsp;KG이니시스, KCP, LG U+를 사용하는 쇼핑몰일 경우</p>
						<p><span class="cart-using-sp">2</span>&nbsp;결제가능브라우저 : 크롬,파이어폭스,사파리,오페라 브라우저에서 결제 가능</p>
						<p style="margin-left: 20px;">(단, window os 사용자에 한하며 리눅스/mac os 사용자는 사용불가)</p>
						<p><span class="cart-using-sp">3</span>&nbsp;최초 결제 시도시에는 플러그인을 추가 설치 후 반드시 브라우저 종료 후 재시작해야만 결제가 가능합니다.</p>
						<p style="margin-left: 20px;">(무통장, 휴대폰결제 포함)</p>
						<br>
						<h4>세금계산서 발행 안내</h4>
						<br>
						<p><span class="cart-using-sp">1</span>&nbsp;부가가치세법 제 54조에 의거하여 세금계산서는 배송완료일로부터 다음달 10일까지만 요청하실 수 있습니다.</p>
						<p><span class="cart-using-sp">2</span>&nbsp;세금계산서는 사업자만 신청하실 수 있습니다.</p>
						<p><span class="cart-using-sp">3</span>&nbsp;배송이 완료된 주문에 한하여 세금계산서 발행신청이 가능합니다.</p>
						<p><span class="cart-using-sp">4</span>&nbsp;[세금계산서 신청]버튼을 눌러 세금계산서 신청양식을 작성한 후 팩스로 사업자등록증사본을 보내셔야 세금계산서 발생이 가능합니다.</p>
						<p><span class="cart-using-sp">5</span>&nbsp;[세금계산서 인쇄]버튼을 누르면 발행된 세금계산서를 인쇄하실 수 있습니다.</p>
						<br>
						<h4>부가가치세법 변경에 따른 신용카드매출전표 및 세금계산서 변경안내</h4>
						<br>
						<p><span class="cart-using-sp">1</span>&nbsp;변경된 부가가치세법에 의거, 2004.7.1 이후 신용카드로 결제하신 주문에 대해서는 세금계산서 발행이 불가하며</p>
						<p><span class="cart-using-sp">2</span>&nbsp;신용카드매출전표로 부가가치세 신고를 하셔야 합니다.(부가가치세법 시행령 57조)</p>
						<p><span class="cart-using-sp">3</span>&nbsp;상기 부가가치세법 변경내용에 따라 신용카드 이외의 결제건에 대해서만 세금계산서 발행이 가능함을 양지하여 주시기 바랍니다.</p>
						<br>
						<h4>현금영수증 이용안내</h4>
						<br>
						<p><span class="cart-using-sp">1</span>&nbsp;현금영수증은 1원 이상의 현금성거래(무통장입금, 실시간계좌이체, 에스크로, 예치금)에 대해 발행이 됩니다.</p>
						<p><span class="cart-using-sp">2</span>&nbsp;현금영수증 발행 금액에는 배송비는 포함되고, 적립금사용액은 포함되지 않습니다.</p>
						<p><span class="cart-using-sp">3</span>&nbsp;발행신청 기간제한 현금영수증은 입금확인일로 부터 48시간안에 발행을 해야 합니다.</p>
						<p><span class="cart-using-sp">4</span>&nbsp;현금영수증 발행 취소의 경우는 시간 제한이 없습니다. (국세청의 정책에 따라 변경 될 수 있습니다.)</p>
						<p><span class="cart-using-sp">5</span>&nbsp;현금영수증이나 세금계산서 중 하나만 발행 가능 합니다.</p>
					</td>
				</tr>
			</tbody>
			
		
		</table>
	</div>
<!--ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->
	</div>
</div>
<!--ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->
</div>


</section>	
<c:import url="../../layout/footer.jsp"/>	
<script type="text/javascript">
  var checkSize = ${list.size()};
  var checkAll = 0;
  
  $("#pay-check-del").click(function() {
	  if (checkSize==1) {
		
		$(".cartCheck").each(function() {
			if ($(this).prop("checked")) {
				$(this).parent().parent().remove();
				checkSize--;
				alert("주문을 취소하셨습니다.");
				location.href = "/mid/makeDiv";
			}
		});
		
	}else{
		
		$(".cartCheck").each(function() {
			if ($(this).prop("checked")) {
				$(this).parent().parent().remove();
				checkSize--;
				if (checkSize==0) {
					alert("주문을 취소하셨습니다.");					
					location.href = "/mid/makeDiv";	
					}
				}
			});
		
		}
	  getPay();
	});
  
  $("#checkAll").click(function() {
	  if (!$(this).prop("checked")) {
		  $(".cartCheck").prop("checked",false);
		  	checkAll = 0;
		}else{
			$(".cartCheck").prop("checked","checked");
			checkAll = checkSize;
		}
	});
  
  $(".cartCheck").click(function() {
	  checkAll=0;
	  $(".cartCheck").each(function() {
			if ($(this).prop("checked")) {
				checkAll++;
			}else{
				checkAll--;
			}
		});
	  
	  	if (checkAll == checkSize) {
			$("#checkAll").prop("checked",true);
		}else{
			$("#checkAll").prop("checked",false);			
		}
	});
  
  $(".cart-table-div").change(function() {
		getPay();
	});
  
  $("#pay-point_value").change(function() {
	  var tp = ${point.total_point};
	  if ($(this).val() > tp) {
			$(this).prop("value",tp);
			$("#param-point_value").prop("value",tp);
		}else{
			$("#param-point_value").prop("value",$(this).val());
		}
			getPay();
		});
  
  	function getPay() {
  		var coup = $("#coupon").val()*1;
		var sum = getSum();
		var pay = sum * coup;
		var point = $("#pay-point_value").val()*1;
	 	$(".cart-sum-final").text(pay);
	 	$(".cart-view-sp").text(sum);
	 	$(".cart-view-sp1").text(sum-pay);
	 	$(".cart-view-sp2").text(pay);
	 	$(".kakao-pay-final").text(pay-point);
	 	$("#pay-order_sum").prop("value",pay-point);
	}	
  
  	
  	$(document).ready(function() {
		$(".cart-sum-final").text(getSum());
		$(".cart-view-sp").text(getSum());
		$(".cart-view-sp2").text(getSum());
		$(".kakao-pay-final").text(getSum());
		var fps = 0;
		$(".point-saves").each(function() {
			fps = fps + $(this).val()*1;
		});
		$(".final-point-save").text(fps);
		$("#pt-sv").prop("value",fps);
		$("#pay-order_sum").prop("value",getSum());
		$("#order-price").prop("value",getSum());
	});
  	
  function getSum() {
  		var size = ${list.size()};
  	  var sum = 0;
  	  for (var i = 0; i < size; i++) {
  		  if ($(".cart-pro_price"+i).val()!=null) {
	  		var price = $(".cart-pro_price"+i).val()*1;
	  		var count = $(".cart-pro_count"+i).val()*1;
	  		sum = sum + price * count;
	  		
			}
  		}
  		$(".cart-sum-sp").text(sum);
  		var fps = 0;
		$(".point-saves").each(function() {
			fps = fps + $(this).val()*1;
		});
		$(".final-point-save").text(fps);
  		return sum;
	}
  
  function kPay() {
	  if (confirm("카카오페이로 연결하시겠습니까?")) {
			return true;
		}else{
			return false;		
		}
	}
  $("#coupon").change(function() {
		$(".copt").each(function() {
			if ($(this).prop("selected")) {
				$("#param").prop("value",$(this).prop("title"));
				console.log($("#param").val());
			}
		});
	});
</script>
</body>
</html>
