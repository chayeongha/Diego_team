<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니</title>
<link href="../../resources/css/member.css" rel="stylesheet">
</head>
<body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
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
	<h1 class="right-h1" style="color: #353535;">장바구니</h1>
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
							<th class="cart-checkBox" style="border-left: 0;"><input type="checkbox" id="checkAll" size="13px"></th>
							<th class="cart-image">이미지</th>
							<th class="cart-pro_info">상품정보</th>
							<th class="cart-price">판매가</th>
							<th class="cart-count">수량</th>
							<th class="cart-point">적립금</th>
							<th class="cart-deli">배송구분</th>
							<th class="cart-deli-cost">배송비</th>
							<th class="cart-sum">합계</th>
							<th class="cart-btn-group" style="border-right: 0;">선택</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${cartList }" var="cart" varStatus="i">
							<tr>
								<td class="cart-checkBox" style="border-left:0;">
									<input type="checkbox" class="cartCheck cart${i.index }" value="${cart.cart_num }" title="${i.index }" name="${cart.pro_num }">
								</td>
								<td class="cart-image">
									<img alt="장바구니 사진" src="../../resources/product/images/${cart.pro_image }" height="116px" width="80px">
								</td>
								<td class="cart-pro_info" style="text-align: left;">
									<a href="../../product/productSelect?pro_num=${cart.pro_num }" style="font-weight: bold; color: black; text-decoration: none; margin-left: 10px;">${cart.pro_info } </a>
								</td>
								<td class="cart-price">
									<input type="hidden" class="cart-pro_price${i.index }" value="${cart.pro_price }">
									<strong><fmt:formatNumber value="${cart.pro_price }" type="number"></fmt:formatNumber>원</strong>
								</td>
								<td class="cart-count">
									<p style="position: relative;">
									<input type="number" min="1" class="cart-pro_count${i.index } count-check" value="1" style="height: 21px; width: 29px; border-radius: 3px; line-height: 21px; border: 1px solid #eaeaea;">
									</p>
								</td>
								<td class="cart-point" >
									<span style="background: #b88cc5; color: white; border: 0; border-radius: 3px; font-size: 8px; height: 12px;">적</span>
									<fmt:formatNumber value="${ps * 0.01 * cart.pro_price}" type="number"></fmt:formatNumber>원
								</td>
								<td class="cart-deli">${cart.delivery }</td>
								<td class="cart-deli-cost">${cart.delivery_cost }</td>
								<td class="cart-sum">
									<strong><fmt:formatNumber value="${cart.pro_price }" type="number"></fmt:formatNumber>원</strong>
								</td>
								<td class="cart-btn-group" style="border-right: 0;">
									<button type="button" class="cart-btn cart-order-btn" value="${cart.pro_num }" title="X">주문하기</button><br>
									<button type="button" class="cart-btn cart-wish-btn" value="${cart.pro_num }">관심상품등록</button><br>
									<button type="button" class="cart-btn cart-del-btn" value="${cart.cart_num }">삭제</button><br>
								</td>
							
							
							</tr>
						
						</c:forEach>
					</tbody>
				</table>
				<c:if test="${cartList.size() eq 0 }">
					<p class="no-order">장바구니가 비었습니다 ㅠㅠ</p>
				</c:if>
				<h1 style="margin:20px 20px 0; text-align: right; font-size: 13px; color: #555555;">상품구매금액 <span class="cart-sum-sp" style="color: black;"></span>원 + 배송비 0 (무료) = 합계 : <strong style="font-size: 17px; color: black;"><span class="cart-sum-sp" ></span></strong>원 </h1>
				<div class="cart-warning">
					<p style="margin-left: 33px; padding: 8px 0;">
					<span style="border: 1px solid #eaeaea; color: red; padding: 1px 4px; font-size: 11px; border-radius: 3px;">!</span>&nbsp;할인 적용 금액은 주문서작성의 결제예정금액에서 확인 가능합니다.</p>
				</div>
				<div class="cart-btn-menu1" style="text-align: left;">
					<button id="cart-del-check">삭제하기</button>
					<button id="cart-wish-check">관심상품등록</button>
					<button id="cart-del-all" class="cart-big-btn">장바구니 비우기</button>
				</div>
<!--ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->
				<div class="cart-check-view" >
					<table class="cart-view-table">
						<thead>
							<tr>
								<th class="cart-view-pro" style="border-left: 0;">총 상품금액</th>
								<th class="cart-view-deli">총 배송비</th>
								<th class="cart-view-price" style="border-right: 0;">결제예정금액</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td class="cart-view-pro" style="border-left: 0;"><span class="cart-view-sp">0</span>원</td>
								<td class="cart-view-deli">+ 0원</td>
								<td class="cart-view-price" style="border-right: 0;"><span class="cart-view-sp2">0</span>원</td>
							</tr>
						</tbody>
					</table>
				</div>
<!--ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->
				<div class="cart-btn-menu2">
					<button class="cart-big-btn" id="cart-order-all">전체상품주문</button>
					<button class="cart-big-btn" id="cart-order-check">선택상품주문</button>
					<button class="cart-big-btn" id="cart-shoping">쇼핑계속하기</button>
				</div>
			</div>
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
						<h4>장바구니 이용안내</h4>
						<br>
						<p><span class="cart-using-sp">1</span>&nbsp;해외배송 상품과 국내배송 상품은 함께 결제하실 수 없으니 장바구니 별로 따로 결제해 주시기 바랍니다.</p>
						<p><span class="cart-using-sp">2</span>&nbsp;해외배송 가능 상품의 경우 국내배송 장바구니에 담았다가 해외배송 장바구니로 이동하여 결제하실 수 있습니다.</p>
						<p><span class="cart-using-sp">3</span>&nbsp;선택하신 상품의 수량을 변경하시려면 수량변경 후 [변경] 버튼을 누르시면 됩니다.</p>
						<p><span class="cart-using-sp">4</span>&nbsp;[쇼핑계속하기] 버튼을 누르시면 쇼핑을 계속 하실 수 있습니다.</p>
						<p><span class="cart-using-sp">5</span>&nbsp;장바구니와 관심상품을 이용하여 원하시는 상품만 주문하거나 관심상품으로 등록하실 수 있습니다.</p>
						<p><span class="cart-using-sp">6</span>&nbsp;파일첨부 옵션은 동일상품을 장바구니에 추가할 경우 마지막에 업로드 한 파일로 교체됩니다.</p>
						<br>
						<br>
						<h4>무이자할부 이용안내</h4>
						<br>
						<p><span class="cart-using-sp">1</span>&nbsp;상품별 무이자할부 혜택을 받으시려면 무이자할부 상품만 선택하여 [주문하기] 버튼을 눌러 주문/결제 하시면 됩니다.</p>
						<p><span class="cart-using-sp">2</span>&nbsp;[전체 상품 주문] 버튼을 누르시면 장바구니의 구분없이 선택된 모든 상품에 대한 주문/결제가 이루어집니다.</p>
						<p><span class="cart-using-sp">3</span>&nbsp;단, 전체 상품을 주문/결제하실 경우, 상품별 무이자할부 혜택을 받으실 수 없습니다.</p>
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
//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ뷰체커ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
	var viewCheck = 0;
//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ뷰체커ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
	function taVal() {
		var size = ${cartList.size()};
		var sum = 0;
		for (var i = 0; i < size; i++) {
			var price = $(".cart-pro_price"+i).val();
			var count = $(".cart-pro_count"+i).val();
			sum = sum + price*count;
			
		}
		
		$(".cart-sum-sp").text(sum);
		
		return sum;
	}
	
	$(document).ready(function() {
		taVal();
	});
	
	$(".cart-table-div").change(function() {
		taVal();
	});
	
	var check = false;
	var all = 0;
	
	$("#checkAll").click(function() {
		var size = ${cartList.size()};
		if (check == false) {
		$(".cartCheck").prop("checked","true");
		check = true;
		getSpan();
		all = size;
		}else{
			$(".cartCheck"). prop("checked","");
			check= false;
			viewCheck=0;
			$(".cart-view-sp").text(0);
			$(".cart-check-view").css("display","none");
		}
	});
	
	
	$(".cartCheck").click(function() {
		all = 0;
		var size = ${cartList.size()};
		for (var i = 0; i < size; i++) {
			if ($(".cart"+i).prop("checked") == true) {
				all++;
			}
		}
		if (all == size) {
			$("#checkAll").prop("checked","true");
			check = true;
		}else{
			$("#checkAll").prop("checked","");
			check = false;
		}
	});

	$(".cart-table-div").on("click","#cart-del-check", function() {
		if (all == 0) {
			alert("삭제할 항목을 선택해주세요");
		}else {
			
			if (confirm("삭제하시겠습니까?")) {
				
			jQuery.ajaxSettings.traditional = true;
				var size = ${cartList.size()};
					for (var i = 0; i < size; i++) {
						
						var num = new Array();
						var index = 0;
						for (var i = 0; i < size; i++) {
							if ($(".cart"+i).prop("checked") == true) {
							num[index] = $(".cart"+i).val();
							index++;
								}
							} 
						
						}
					
					$.ajax({
						type	: "POST",
						url		: "cartDelete",
						data	: {
							id : "${member.id}",
							num : num
							
						},
						success	: function(data) {
							if (data == 1) {
								location.reload();
								}else{
									alert("다시 시도하세요.")
								}
						}
					});
				
				}
			}
		});
		
		
		$(".cart-table-div").on("click",".cart-order-btn", function() {
			var pro_num = $(this).val();
			open("orderInsertAjax?pro_num="+pro_num,"_blank","width=600px, height=480px, top=200px,left=600px");
		});
		
		$(".cart-table-div").on("click",".cart-del-btn", function() {
			if (confirm("삭제하시겠습니까?")) {
				
			jQuery.ajaxSettings.traditional = true;
			
					var num = new Array();
					
						num[0] = $(this).val();
				
				$.ajax({
					type	: "POST",
					url		: "cartDelete",
					data	: {
						id : "${member.id}",
						num : num
						
					},
					success	: function(data) {
						if (data == 1) {
							location.reload();
							}else{
								alert("다시 시도하세요.")
							}
					}
				});
			}
		});
		
		
		$(".cart-table-div").on("click","#cart-del-all", function() {
			if (confirm("장바구니를 비우시겠습니까?")) {
				$.ajax({
					type	: "POST",
					url		: "cartClean",
					data	: {
						id	:	"${member.id}"
					},
					success	:	function(data) {
						data = data.trim();
						if (data == 1) {
							location.reload();
						}else{
							alert("다시 시도해주세요");
						}
					}
				});
			}
		});
		
		
		$(".cartCheck").click(function() {
				var i = $(this).prop("title");
				var price = $(".cart-pro_price"+i).val()*1;
				var count = $(".cart-pro_count"+i).val()*1;
				var sumPrice = $(".cart-view-sp").text()*1;
				
			if ($(this).prop("checked")) {			
				sumPrice = sumPrice + price * count;
				$(".cart-view-sp").text(sumPrice);
				$(".cart-view-sp2").text(sumPrice);
				viewCheck++;
			}else{
				sumPrice = sumPrice - price * count;
				$(".cart-view-sp").text(sumPrice);
				$(".cart-view-sp2").text(sumPrice);
				viewCheck--;
			}
			
			
			if (viewCheck > 0) {
				$(".cart-check-view").css("display","block");
			}else{
				$(".cart-check-view").css("display","none");
				$(".cart-view-sp").text(0);
			}
			
		});
		
		function getSpan() {
				var sumPrice = 0;
			$(".cartCheck").each(function() {
				
				var i = $(this).prop("title");
				var price = $(".cart-pro_price"+i).val()*1;
				var count = $(".cart-pro_count"+i).val()*1;
				
				if ($(this).prop("checked")) {			
					sumPrice = sumPrice + price * count;
					$(".cart-view-sp").text(sumPrice);
					$(".cart-view-sp2").text(sumPrice);
					viewCheck++;
				}else{
					sumPrice = sumPrice - price * count;
					$(".cart-view-sp").text(sumPrice);
					$(".cart-view-sp2").text(sumPrice);
					viewCheck--;
				}
			
			
				if (viewCheck > 0) {
					$(".cart-check-view").css("display","block");
				}else{
					$(".cart-check-view").css("display","none");
					$(".cart-view-sp").text(0);
				}
				
			});
		}

		$(".count-check").change(function() {
			$(".count-check").each(function() {
				if ($(this).val()==0) {
					$(this).prop("value",1);
				}
			});
		});
		
		
		$(".cart-wish-btn").click(function() {
			var id = "${member.id}";
			var pro_num = $(this).val();
			
			if (confirm("관심상품으로 등록하시겠습니까?")) {
				$.ajax({
					type	: "POST",
					url		: "wishAjaxInsert",
					data	: {
						id : id,
						pro_num	: pro_num
					},
					success	: function(d) {
						d = d.trim();
						if (d == 1) {
							alert("추가되었습니다.");
						}else{
							alert("이미 추가된 상품입니다.");
						}
					}
				});
			}
			
		});
		
		
		
		$("#cart-wish-check").click(function() {
			if (all==0) {
				alert("등록할 상품을 선택해주세요");
				
			}else{
				
				if (confirm("선택 상품을 관심물품에 등록하시겠습니까?")) {
					jQuery.ajaxSettings.traditional = true;
					var goods = new Array();
					var count = 0;
					var size = ${cartList.size()};
					var id = "${member.id}";
					
						for (var i = 0; i < size; i++) {
							if ($(".cart"+i).prop("checked")==true) {
								goods[count] = $(".cart"+i).prop("name");
								count++;
							}
						}
						
					$.ajax({
						type	: "POST",
						url		: "wishListCheckInsert",
						data	: {
							id 		: id,
							num		: goods
						},
						success	: function(d) {
							d = d.trim();
							if (d==1) {
								alert("추가 되었습니다.");
							}else{
								alert("다시 시도해주세요.");
							}
						}
					});
				}
			}
		});
		
		function viewCoup(s) {
			s.innerHTML = $("#cart-coupon-view").text();
		}
		
		function viewCount(s){
			var size = ${coupon.size()};
			s.innerHTML = size;
		}
		
		
		$("#cart-order-all").click(function() {
					jQuery.ajaxSettings.traditional = true;
					var id = "${member.id}";
					var size = ${cartList.size()};
					var num = new Array();
					
			if (confirm("전체 상품을 주문하시겠습니까?")) {
				
				
				
// 					var name = $(".cart"+i).attr("name");
					
// 					//num[i] = name;
// 					num.push(name);
// 					console.log(num[i]+", "+i);

					$(".cartCheck").each(function() {
						var name = $(this).attr("name");
						num.push(name);
					});
				
				
				
				location.href="payPage?num="+num;
			}
		});
		
		$("#cart-order-check").click(function() {
			jQuery.ajaxSettings.traditional = true;
			var id = "${member.id}";
			var size = ${cartList.size()};
			var num = new Array();
			if (viewCheck != 0) {
				
				if (confirm("선택하신 상품을 주문하시겠습니까?")) {
					
						$(".cartCheck").each(function() {
							if ($(this).prop("checked")) {
							var name = $(this).attr("name");
							num.push(name);					
							}
						});
			}		
		
		
		
				location.href="payPage?num="+num;
		}else{
			alert("주문하실 상품을 선택해주세요");
		}
			
		});
		
		
</script>
</body>
</html>