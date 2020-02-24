<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 수정</title>
<link href="../resources/css/member.css" rel="stylesheet">
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<c:import url="../common/calendar.jsp"/>
<link>
</head>
<body>
<c:import url="../layout/header.jsp"/>
<section style="width: 100%; height: 1200px; overflow: hidden;">
<div class="main">
<!--ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->
<div class="left" style="height: 985px;">
	<div class="left-menu">
		<ul class="left-list">
			<li style="height: 30px; font-size: 13px; font-weight: bold;">Community</li>
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
			<li ><a href="#" style="color: black;">My info</a></li></c:if>
			<li ><a href="memberManage/orderMyList">Order</a></li>
			<li ><a href="memberManage/wishListSelectList">Wish list</a></li>
			<li ><a href="memberManage/pointMyList">Mileage</a></li>
			<li ><a href="#">My board</a></li>
			<li ><a href="#">Delivery</a></li>
		</ul>
	</div>
</div>
<!--ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->
<div class="right" style="height: 985px;">
	<h1 class="right-h1">회원 정보 수정</h1>
	<div class="info">
		<div class="info-image">
			<img alt="프사" src="../resources/images/img_member_default.gif">
		</div>
		<div class="info-rank">
		<p>저희 쇼핑몰을 이용해 주셔서 감사합니다. <strong>${member.name }</strong> 님은 <strong>${member.mem_rank }</strong> 회원이십니다.</p>
		<p><strong><fmt:formatNumber value="${up }" type="number"/>원</strong> 이상 구매시 <strong>${x }%</strong>을 추가적립 받으실 수 있습니다.</p>
		</div>
		
	</div>
<!--ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->
	<form action="memberUpdate" method="post" onsubmit="go()">
	<table class="info-table">
	<tr>
		<th>아이디<img alt="필수" src="../resources/images/ico_required.gif"></th>
		<td><input name="id" id="id" type="text" placeholder="Enter id" maxlength="16" readonly="readonly" value="${member.id }" style="background-color: #ebebe4">
		</td>
	</tr>
	<tr>
		<th>비밀번호 <img alt="필수" src="../resources/images/ico_required.gif"></th>
		<td><input name="pw" id="pw" type="password" placeholder="Enter pw" maxlength="16" required="required">
		<span></span>
		 (영문소문자/숫자, 4~16자)</td>
		</tr>

	<tr>
		<th>비밀번호 확인<img alt="필수" src="../resources/images/ico_required.gif"></th>
		<td><input type="password" id="pw-re" placeholder="Enter pw"></td>
	</tr>
	<tr>
		<th>이름<img alt="필수" src="../resources/images/ico_required.gif"></th>
		<td><input type="text" name="name" placeholder="Enter name" value="${member.name }"></td>
	</tr>
	<tr>
		<th>주소</th>
		<td><input id="pn" name="address_pn" readonly="readonly" style="width: 50px;" value="${member.address_pn }"> <img alt="우편" src="../resources/images/btn_zipcode.gif" style="vertical-align: middle; cursor: pointer;" onclick="postNum()">
		<br><input id="ba" name="address_ba" readonly="readonly" style="margin-top: 5px; width: 280px;" value="${member.address_ba }"><span> 기본주소</span>
		<br><input id="da" name="address_da" style="margin-top: 5px; width: 280px;" value="${member.address_da }"><span> 상세주소</span>
		</td>
	</tr>
	<tr>
		<th>휴대전화<img alt="필수" src="../resources/images/ico_required.gif"></th>
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
		<th>이메일<img alt="필수" src="../resources/images/ico_required.gif"></th>
		<td><input type="text" name="email" value="${member.email }" required="required"></td>
	</tr>
	<tr>
		<th>이메일 수신여부<img alt="필수" src="../resources/images/ico_required.gif"></th>
		<td><input type="radio" name="email_chk" checked="checked" value="O"> 수신함 <input type="radio" name="email_chk" value="X"> 수신안함
		<p>쇼핑몰에서 제공하는 유익한 이벤트 소식을 이메일로 받으실 수 있습니다.</p></td>
	</tr>
	</table>
	<h1 style="padding: 50px 0.5% 10px; font-size: 16px; color: black; text-align: left; font-weight: normal;">추가정보</h1>
	<table class="info-table">
	<tr>
	<th>기념일</th>
	<td><input type="text" name="ad_birth" value="${member.ad_birth }" id="ad_birth">
	</td>
	</tr>
	<tr>
	<th>지역</th>
	<td>
	<select name="ad_local"  style="height: 24px; width: 150px; vertical-align: middle; border: 1px solid #eaeaea;">
		<option value="-">선택</option>
		<option class="loc">경기</option>
		<option class="loc">서울</option>
		<option class="loc">인천</option>
		<option class="loc">강원</option>
		<option class="loc">충남</option>
		<option class="loc">충북</option>
		<option class="loc">대전</option>
		<option class="loc">경북</option>
		<option class="loc">경남</option>
		<option class="loc">대구</option>
		<option class="loc">부산</option>
		<option class="loc">울산</option>
		<option class="loc">전북</option>
		<option class="loc">전남</option>
		<option class="loc">광주</option>
		<option class="loc">제주</option>
		<option class="loc">해외</option>
	</select>
	</td>
	</tr>
	</table>
	<div class="join-btn">
		<button id="member-btn" type="submit">회원정보수정</button>
		<button class="mem-btn" onclick="back()">취소</button>
		<button class="mem-btn" onclick="del()" style="float: right;">회원 탈퇴</button>
		
	</div>
	</form>
</div>
<!--ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->
</div>
</section>
<c:import url="../layout/footer.jsp"/>
<script type="text/javascript">

	$(".opt").each(function() {
		if ($(this).val() == "${p1}") {
			$(this).prop("selected", true);
		}
	});
	
	$(".loc").each(function() {
		if ($(this).val()=="${member.ad_local}") {
			$(this).prop("selected", true);
		}
	});
	
	function back() {
		location.href="/mid/diego";
	}
	
	function del() {
		$.ajax({ 
			type 	: "POST",
			url		: "memberDelete",
			data	: {
				id : ${member.id} 
			},
			success	: function(data) {
				data = data.trim();
				if (data == 1) {
					alert("다음에 다시만나요~");
					location.href = "/mid/diego"
				}
			}
		});
	}
	
	function postNum() {
		
		    new daum.Postcode({
		        oncomplete: function(data) {
		        	$("#pn").prop("value", data.zonecode);
		        	$("#ba").prop("value", data.roadAddress);
		        }
		    }).open();
	
	}
	
	
	function go() {
		var phone =  "";
		
		$(".phone").each(function() {
			phone = phone + $(this).val();
		});
			$("#ph-number").prop("value",phone);
	}
	
	$(function() {
	    $("#ad_birth").datepicker({
	    	dateFormat : "yy-mm-dd"
	    });
	});
</script>
</body>
</html>