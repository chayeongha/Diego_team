<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link href="../resources/css/member.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>
<c:import url="../layout/header.jsp"/>
<section style="height: 1045px;">
<div class="login-img">
	<img alt="로그인 대문" src="../resources/images/login_bg.jpg" style="width: 100%; height: 100%">
</div>
<div class="login">
	<div class="login-form">
		<div class="login-form-tt">
<!--ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ-->
			<div class="login-form-tt-box">
				<div class="login-form-tt-name">
					<h1 style="padding-bottom: 15px;">Member Login</h1>
					<span style="font-size: 17px; line-height: 20px; font-weight: normal;">
					Please eneter your ID and password<br>to identify yourself
					</span>
				</div>
			</div>
<!--ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ-->
			<div class="login-form-table">
				<div class="login-form-id">
					<div class="login-form-lavel">
						<label style="color: #2e2e2e; font-size: 14px;">Your ID</label>
					</div>
					<div>
						<input class="login-form-id-ip" type="text" id="id" autofocus="autofocus">
					</div>
				</div>
				<div class="login-form-pw">
					<div class="login-form-lavel">
						<label style="color: #2e2e2e;font-size: 14px;">Password</label>
					</div>
					<div>
					<input class="login-form-id-ip" type="password" id="pw">
					</div>
				</div>
				<div class="login-form-btn">
				<button class="btn-login" style="margin-right: 2%;" id="login">로그인</button>
				<button class="btn-login" id="insert">회원가입</button>
				</div>
<!--ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ-->
				<div class="login-form-find">
				<a href="#" style="text-decoration:none; border-right: 1px solid #cfcfcf; color: #cfcfcf;">&nbsp;아이디 찾기  &nbsp;</a>
				<a href="#" style="text-decoration:none; border-right: 1px solid #cfcfcf;  color: #cfcfcf;">&nbsp;비밀번호 찾기 &nbsp;</a>
				<a href="#" style="text-decoration:none;  color: #cfcfcf;">&nbsp;비회원 주문조회</a>
				</div>
				
				<ul class="sns-area">
					<li>
						<a class="sns-btn" href="#" onclick="MemberAction.snsLogin('naver', '%2F')" style="background-color: #00c720; color: #fff;">NAVER LOGIN</a>
					</li>
					<li >
						<a class="sns-btn" href="#" onclick="MemberAction.snsLogin('kakao', '%2F')" style="background-color: #fbeb06; color: #000;">KAKAO LOGIN</a>
					</li>
					<li>
						<a class="sns-btn" href="#" onclick="MemberAction.snsLogin('facebook', '%2F')" style="background-color: #5267a7; color: #fff;">FACEBOOK LOGIN</a>
					</li>
					<li>
						<a class="sns-btn" href="#" onclick="MemberAction.snsLogin('googleplus', '%2F')"style="background-color: #e74437; color: #fff;">GOOGLE LOGIN</a>
					</li>
				</ul>
			</div>
<!--ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ-->			
		</div>
	</div>
</div>
</section>
<c:import url="../layout/footer.jsp"/>
<script type="text/javascript">
	
	$("#login").click(function() {
		$.ajax({
			type : "POST",
			url : "memberLogin",
			data : {
				id : $("#id").val(),
				pw : $("#pw").val()
			},
			success : function(data) {
				data = data.trim();
				if (data == "1") {
					location.href="/mid/makeDiv";
				}else{
					alert("똑바로 치세요");
				}
			}
		});
	});

	$("#insert").click(function() {
		location.href="/mid/member/memberInsert";
	});
	
	
	function login() {
		$.ajax({
			type : "POST",
			url : "memberLogin",
			data : {
				id : $("#id").val(),
				pw : $("#pw").val()
			},
			success : function(data) {
				data = data.trim();
				if (data == "1") {
					location.href="/mid/makeDiv";
				}else{
					alert("아이디와 비밀번호를 확인해주세요.");
				}
			}
		});
	}
	
	$("#pw").keyup(function(e){
		if(e.keyCode == 13){
			login(); 
			}
		});

		
		
</script>

</body>
</html>