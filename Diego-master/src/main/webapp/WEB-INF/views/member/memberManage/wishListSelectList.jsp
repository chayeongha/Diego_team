<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관심 상품</title>
<link href="../../resources/css/member.css" rel="stylesheet">
</head>
<body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<c:import url="../../layout/header.jsp"/>
<section>
<div class="main" style="min-height: 700px;">
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
			<li ><a href="#" style="color: black;">Wish list</a></li>
			<li ><a href="pointMyList">Mileage</a></li>
			<li ><a href="#">My board</a></li>
			<li ><a href="#">Delivery</a></li>
		</ul>
	</div>
</div>
<!--ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->
<div class="right" style="min-height: 600px; overflow: hidden;">
	<h1 class="right-h1" style="color: #353535;">관심상품</h1>
<!--ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->
	<div class="ws-ajax" style="width: 100%; min-height: 300px; overflow: hidden;">
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
						<a href="../../product/productSelect?pro_num=${wish.pro_num }" style="font-weight: bold; color: black; text-decoration: none;">${wish.pro_info } </a>
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
					<button type="button" class="wish-btn wish-order-btn" value="${wish.pro_num }" title="X">주문하기</button><br>
					<button type="button" class="wish-btn wish-cart-btn" value="${wish.pro_num }">장바구니담기</button><br>
					<button type="button" class="wish-btn wish-del-btn" value="${wish.wish_num }">삭제</button><br>
					</td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
	<c:if test="${wishList.size() eq 0 }">
		<p class="no-order">관심상품이 없습니다.</p>
	</c:if>
<!--ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->		
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
<!--ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->
	</div>
</div>
<!--ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->
</div>
</section>
<c:import url="../../layout/footer.jsp"/>
<script type="text/javascript">
var check = false;
var all = 0;

$(".ws-ajax").on("click","#checkAll", function() {
	if (check == false) {
	$(".wishCheck").prop("checked","true");
	check = true;
	all = ${wishList.size()};
	}else{
		$(".wishCheck").prop("checked","");
		check= false;
	}
});

$(".ws-ajax").on("click",".wishCheck", function() {
	all = 0;
	var size = ${wishList.size()};
	for (var i = 0; i < size; i++) {
		if ($(".wish"+i).prop("checked") == true) {
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


$(".ws-ajax").on("click","#wish-del-check", function() {
	if (all == 0) {
		alert("삭제할 항목을 선택해주세요");
	}else {
		
		if (confirm("삭제하시겠습니까?")) {
			
		jQuery.ajaxSettings.traditional = true;
			var size = ${wishList.size()};
				for (var i = 0; i < size; i++) {
					
					var num = new Array();
					var index = 0;
					for (var i = 0; i < size; i++) {
						if ($(".wish"+i).prop("checked") == true) {
						num[index] = $(".wish"+i).val();
						index++;
							}
						} 
					
					}
				
				$.ajax({
					type	: "POST",
					url		: "wishListDelete",
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
	
	
	$(".ws-ajax").on("click",".btn-pager", function() {
		var id = "${member.id}";
		var curP = $(this).prop("title");
			$.ajax({
			type	: "GET",
			url		: "wishListAjax",
			data	: {
				id : id,
				curPage : curP
			},
			success	: function(data) {
				$(".ws-ajax").html(data);
				all = 0;
				size = ${wishList.size()};
			}
		});
	});
	
	$(".ws-ajax").on("click",".wish-order-btn", function() {
		var pro_num = $(this).val();
		open("orderInsertAjax?pro_num="+pro_num,"_blank","width=600px, height=480px, top=200px,left=600px");
	});
	
	$(".ws-ajax").on("click",".wish-del-btn", function() {
		if (confirm("삭제하시겠습니까?")) {
			
		jQuery.ajaxSettings.traditional = true;
		
				var num = new Array();
				
					num[0] = $(this).val();
			
			$.ajax({
				type	: "POST",
				url		: "wishListDelete",
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
	
	
	$(".ws-ajax").on("click","#wish-del-all", function() {
		if (confirm("wishList를 비우시겠습니까?")) {
			$.ajax({
				type	: "POST",
				url		: "wishListClean",
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
	
	$(".wish-cart-btn").click(function() {
		var id = "${member.id}";
		var pro_num = $(this).val();
		
		if (confirm("장바구니에 담으시겠습니까?")) {
			$.ajax({
				type	: "POST",
				url		: "cartAjaxInsert",
				data	: {
					id		: id,
					pro_num	: pro_num
				},
				success	: function(d) {
					d = d.trim();
					if (d == 1) {
						if (confirm("장바구니에 담았습니다. 장바구니로 이동하시겠습니까?")) {
							location.href = "cartList";
						}
					}else{
						alert("이미 담겨 있습니다.");
					}
				}
			});
		}
		
	});
	
	$(".ws-ajax").on("click","#wish-cart-check", function() {
		if (confirm("선택 상품을 장바구니에 담으시겠습니까?")) {
			jQuery.ajaxSettings.traditional = true;
			var goods = new Array();
			var count = 0;
			var size = ${wishList.size()};
			var id = "${member.id}";
			
				for (var i = 0; i < size; i++) {
					if ($(".wish"+i).prop("checked")==true) {
						goods[count] = $(".wish"+i).prop("title");
						count++;
					}
				}
				
			$.ajax({
				type	: "POST",
				url		: "cartCheckInsert",
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
	});
</script>
</body>
</html>