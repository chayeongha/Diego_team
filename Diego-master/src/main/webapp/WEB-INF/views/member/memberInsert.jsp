<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입</title>
<link href="../resources/css/member.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>
<c:import url="../layout/header.jsp"/>
<section style="width: 100%; height: 1500px;">
<div class="main" style="margin-top: 150px;">
	<div class="left">
<!--ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->
	<div class="left-menu">
		<ul class="left-list">
			<li style="height: 30px; font-size: 13px; color: black;">Community</li>
			<li ><a href="/mid/notice/noticeList">Notice</a></li> 
			<li ><a href="/mid/faq/faqList">FAQ</a></li> 
			<li ><a href="/mid/admin/qnaList">Q&amp;A</a></li> 
			<li ><a href="#">Photo review</a></li> 
			<li ><a href="#">Review</a></li> 
		</ul>
		<ul class="left-list">
			<li style="height: 30px;"><a href="#" style="color: black; font-size: 13px;">Event</a></li>
		</ul>
		<ul class="left-list">
			<li style="height: 30px;"><a href="#" style="color: black; font-size: 13px;">My page</a></li>
			<c:if test="${!empty member }">
			<li ><a href="memberUpdate">My info</a></li></c:if>
			<li ><a href="memberManage/orderMyList">Order</a></li>
			<li ><a href="memberManage/wishListSelectList">Wish list</a></li>
			<li ><a href="memberManage/pointList">Mileage</a></li>
			<li ><a href="#">My board</a></li>
			<li ><a href="#">Delivery</a></li>
		</ul>
	</div>
<!--ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->
	</div>
<!--ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->
	<div class="right" style="height: auto;">
		<h1 style="color: black; margin-bottom: 55px; text-align: center; font-size: 20px; font-weight: normal;">회원 가입</h1>
		<div style="height: 1285px;">
<!--ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->		
			<form action="memberInsert" method="post" id="join-from" onsubmit="go()">
<!--ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->
				<table class="join-table">
					<tr>
					<th>아이디 <img alt="필수" src="../resources/images/ico_required.gif">
					</th>
					<td><input name="id" id="id" type="text" placeholder="Enter id" maxlength="16" required="required">
					<span>아이디를 입력해주세요</span>
					 (영문소문자/숫자, 4~16자)</td>
					</tr>
					<tr>
					<th>비밀번호 <img alt="필수" src="../resources/images/ico_required.gif"></th>
					<td><input name="pw" id="pw" type="password" placeholder="Enter pw" maxlength="16" required="required">
					<span></span>
					 (영문소문자/숫자, 4~16자)</td>
					</tr>
					<tr>
					<th>비밀번호 확인 <img alt="필수" src="../resources/images/ico_required.gif"></th>
					<td><input type="password" id="pw-re" placeholder="Enter pw"></td>
					</tr>
					<tr>
					<th>이름 <img alt="필수" src="../resources/images/ico_required.gif"></th>
					<td><input name="name" type="text" id="name" placeholder="Enter name" maxlength="6" required="required"></td>
					</tr>
					<tr>
					<th>휴대전화</th>
					<td>      
					<select class="phone" style="height: 24px; width: 60px;">
					   	<option>010</option>
				      	<option>011</option>
				      	<option>016</option>
				      	<option>017</option>
				      	<option>018</option>
				      	<option>019</option>
				      </select>
				      <span class="phone">-</span>
				      <input id="phone" class="phone" type="text" maxlength="4" required="required">
				      <span class="phone">-</span>
				      <input id="phone" class="phone" type="text" maxlength="4" required="required">
				      <input type="hidden" name="phone" id="ph-number">
				    </td>
					</tr>
					<tr>
					<th>이메일 <img alt="필수" src="../resources/images/ico_required.gif"></th>
					<td><input type="email" class="form-control" id="email" placeholder="Enter email" name="email" required="required"></td>
					</tr>
				</table>
<!--ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->
				<h1 style="padding: 50px 0 10px; font-size: 16px; color: black; text-align: left; font-weight: normal;">전체 동의</h1>
				<div style="width: 100%; color: black;">
					<div class="join-all-check">
					<p class="join-check-p"><input type="checkbox" id="all-check" style="width: 22px; height: 22px;" required="required">
					<strong>&nbsp;이용약관 및 개인정보수집 및 이용, 쇼핑정보 수신(선택)에 모두 동의합니다.</strong>
					</p>
					</div>
					<div class="join-check">
						<h4>[필수] 이용약관 동의</h4>
						<div class="join-check-comment">
            			<c:import url="../common/check1.jsp"/>
						</div>
						<p style="padding-top: 7px;">
						<span>이용약관에 동의하십니까?</span>
						<input type="checkbox" id="check1" style="vertical-align: middle;" required="required">
						<span>동의함</span>
						</p>
					</div>
					<div class="join-check">
						<h4>[필수] 개인정보 수집 및 이용 동의</h4>
						<div class="join-check-comment">
            			<c:import url="../common/check2.jsp"/>
						</div>
						<p style="padding-top: 7px;">
						<span>개인정보 수집 및 이용에 동의하십니까?</span>
						<input type="checkbox" id="check2" style="vertical-align: middle;" required="required">
						<span>동의함</span>
						</p>
					</div>
					<div class="join-check">
						<h4>[선택] 쇼핑정보 수신 동의</h4>
						<div class="join-check-comment">
							<br>
							<p>할인쿠폰 및 혜택, 이벤트, 신상품 소식 등 쇼핑몰에서 제공하는 유익한 쇼핑정보를 SMS나 이메일로 받아보실 수 있습니다.</p>
							<br>
				            <p>단, 주문/거래 정보 및 주요 정책과 관련된 내용은 수신동의 여부와 관계없이 발송됩니다.</p>
				            <br>
				            <p>선택 약관에 동의하지 않으셔도 회원가입은 가능하며, 회원가입 후 회원정보수정 페이지에서 언제든지 수신여부를 변경하실 수 있습니다.</p>
				            <br>
						</div>
						<p style="padding-top: 7px;">
						<span>이메일 수신을 동의하십니까?</span>
						<input type="checkbox" id="check3" style="vertical-align: middle;">
						<span>동의함</span>
						</p>
					</div>
<!--ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->
					<div class="join-btn">
					<button id="btn" class="btn" type="submit" style="background: #555555; color: white; border-radius: 3px; width: 150px; height: 35px; border: 0;">회원가입</button>
					</div>
				</div>
<!--ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->
			</form>
<!--ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->
		</div>
	</div>
</div>
</section>      
<!--ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->
<c:import url="../layout/footer.jsp"/>
<script type="text/javascript">
		var phone =  "";
		
		function go() {
			
			$(".phone").each(function() {
				phone = phone + $(this).val();
			});
				$("#ph-number").prop("value",phone);
		}
</script>

</body>
</html>