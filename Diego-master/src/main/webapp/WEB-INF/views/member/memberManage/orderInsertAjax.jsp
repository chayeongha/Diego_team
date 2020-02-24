<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
* {
	margin: 0;
	padding: 0;
	font-size: 12px;
	color: #555555;
}

.opt-div p {
	margin-left: 16px;
	margin-bottom: 7px;
	height: 20px;
	line-height: 20px;
}

#count-up:hover {
	border: 1px solid #008bcc;
	border-bottom: none;
}

#count-down:hover {
	border: 1px solid #008bcc;
	border-top: none;
}

#order-insert {
	width: 100px;
	height: 30px;
	background: #555555;
	color: white;
	border: 1px solid #555555;
	margin-top: 20px;
	"
}

#order-insert:hover {
	border: 2px solid #555555;
	background: white;
	color: #555555;
	font-weight: bold;
}

#cart-insert {
	width: 100px;
	height: 30px;
	color: #555555;
	border: 1px solid #555555;
	margin-top: 20px;
	background: white;
}

#cart-insert:hover {
	border: 2px solid #555555;
	font-weight: bold;
}
</style>
</head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<body>
	<div class="open-main-div"
		style="background: #2e2e2e; height: 45px; width: 100%; text-align: left;">
		<h3
			style="color: white; font-weight: bold; line-height: 45px; font-size: 14px; margin-left: 20px;">옵션
			선택</h3>
	</div>
	<div
		style="width: 550px; min-height: 400px; overflow: hidden; margin: 20px 25px 0 25px;">
		<h3 style="color: #555555;">${proVO.pro_name }</h3>
		<br>
		<hr>
		<br>
		<div style="width: 20%; float: left; height: 200px;">
			<img src="../../resources/product/images/${proVO.pro_image }"
				height="82px" width="82px" style="margin: 20px 0 0 20px;">
		</div>
		<div class="opt-div" style="width: 80%; float: right; height: 200px;">
			<div style="width: 30%; float: left; margin-top: 20px;">
				<p>OPTION</p>
				<p>가격</p>
				<p>주문수량</p>
				<p>사용가능 포인트</p>
				<p>사용 예정 포인트</p>
				<p>보유 쿠폰 목록</p>
			</div>

			<div class="value-div"
				style="width: 70%; float: left; margin-top: 20px;">
				<p>
					<select style="width: 58%;" id="pro_opt">
						<option>A TYPE</option>
						<option>B TYPE</option>
					</select>
				</p>

				<p style="color: #008bcc; font-weight: bold;">
					<fmt:formatNumber type="number" value="${proVO.pro_price }"></fmt:formatNumber>
					원
				</p>
				<p style="position: relative;">
					<input type="text" id="pro_count" value="1"> <img
						alt="count-up"
						src="../../resources/images/button/btn_count_up.gif"
						style="position: absolute; top: 1px; height: 10px; left: 150px;"
						id="count-up"> <img alt="count-up"
						src="../../resources/images/button/btn_count_down.gif"
						style="position: absolute; bottom: -1px; height: 10px; left: 150px;"
						id="count-down">



				</p>

				<p>
					<fmt:formatNumber type="number" value="${point.total_point }"></fmt:formatNumber>
					포인트
				</p>
				<p>
					<input type="number" min="0" style="width: 165px;" value="0"
						id="point_value">
				</p>
				<p>
					<select style="width: 58%;" id="coupon">
						<option value="1">사용할 쿠폰을 선택하세요</option>
						<c:forEach items="${couponList }" var="coupon" varStatus="i">
							<option value="${coupon.sales_value}" title="${coupon.coup_num }"
								class="opt">${coupon.coup_name }(${coupon.discount }%)</option>
						</c:forEach>
					</select> <input type="hidden" id="param" value="9999">
				</p>
			</div>
		</div>

		<div
			style="width: 100%; margin: 10px 0; clear: both; height: 24px; border-top: 1px solid #eaeaea; border-bottom: 1px solid #eaeaea;">
			<p style="font-size: 11px; margin-left: 18px;">
				총 주문 금액<span style="font-size: 9px;"> (수량)</span> : <span
					style="color: #008bcc; font-size: 14px; font-weight: bold;"
					id="order_sum" title="${proVO.pro_price }"> <fmt:formatNumber
						type='number'>${proVO.pro_price }</fmt:formatNumber>
				</span>원<span style="color: #008bcc; font-size: 9px;">(수량)</span>
			</p>
		</div>
		<div
			style="width: 100%; clear: both; min-height: 100px; overflow: hidden; text-align: center; margin-top: 10px;">

			<button id="order-insert">주문하기</button>
			<button id="cart-insert">장바구니담기</button>
		</div>
	</div>
	<script type="text/javascript">
	
	var orderPass = true;

	
	function getSum() {
		var price = ${proVO.pro_price}*1;
		var total = ${point.total_point}*1;
		var point = $("#point_value").val()*1;
		if (total < point) {
			orderPass = false;
			alert("안통해!");
			$("#point_value").prop("value","0");
			point = 0;
			var sum = price * $("#pro_count").val() * $("#coupon").val() - point;
			$("#order_sum").text(sum);
			$("#point_value").focus();
		}else{
			orderPass = true;
		var sum = price * $("#pro_count").val() * $("#coupon").val() - point;
		$("#order_sum").text(sum);
		}
	}
	
$(".value-div").change(function() {
	getSum();
});

$("#count-up").click(function() {
	$("#pro_count").prop("value",$("#pro_count").val()*1+1);
	getSum();
});

$("#count-down").click(function() {
	if ($("#pro_count").val() == 1) {
		alert("최소 주문수량은 1개 입니다.");
	}else{
	$("#pro_count").prop("value",$("#pro_count").val()*1-1);
	getSum();		
	}
	
});

$("#coupon").change(function() {
	$(".opt").each(function() {
		if ($(this).prop("selected")) {
			$("#param").prop("value",$(this).prop("title"));
		}
	});
});

$("#order-insert").click(function() {
	if (orderPass) {
		var id = "${member.id}";
		var pro_num	= ${proVO.pro_num};
		var pro_info = "${proVO.pro_name}";
		var price = ${proVO.pro_price};
		var coup_num = $("#param").val();
		var total_point = ${point.total_point};
		$.ajax({
			type	: "POST",
			url		: "orderInsertAjax",
			data	: {
				id : id,
				pro_num		: pro_num,
				pro_info 	: pro_info,
				pro_count	: $("#pro_count").val(),
				price		: price,
				point_value	: $("#point_value").val(),
				coup_num	: coup_num,
				total_point : total_point
				
			},
			success	: function(data) {
				data = data.trim();
				if (data == "1") {
					$(".wish-order-btn",opener.document).prop("title","O");
					alert("주문 성공");
					self.close();
				}else{
					$(".wish-order-btn",opener.document).prop("title","X");
					alert("주문 실패");
					self.close();
				}
			}
		});
	}else{
		alert("주문 금액을 다시 확인해 주세요");
	}
});
	
	$("#point_value").change(function() {
		if ($(this).val()==0) {
			$(this).prop("value",0);
		}
	});

	$("#cart-insert").click(function() {
			var id = "${member.id}";
			var pro_num	= ${proVO.pro_num};
			
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
						alert("장바구니에 담겼습니다.");
					}else{
						alert("이미 담겨있습니다.");
					}
				}
				
			});
		}
	}); 
	
</script>
</body>
</html>
