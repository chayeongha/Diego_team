<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link href="../resources/css/adminCss/adminLogin.css" rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>Admin Login</title>
</head>
<body>
	<c:import url="../layout/header.jsp" />
	<div id="listcontentWrap3">
		<div id="listcontent2">
			<div id="wrap">
			<!-- 왼쪽배경이미지 -->
				<div class="login_bg"> </div>
			</div>
			<form id="" name="" action="./adminLogin" method="post">
				<div id="login_wrap" class="loginbox ">
					<div class="login">
						<div id="logintitle">
							<h2 class="playfonts">Admin Login</h2>
							<span>Please eneter Admin ID and password<br />
							only Admin
							</span>
						</div>
						<fieldset>
							<div class="id_box box_con">
								<label class="idbox first" title="아이디">Admin ID</label>
								<div class="id_inputbox">
									<input id="admin_id" name="admin_id" class="inputTypeText" type="text" />
								</div>
							</div>
							<div class="pw_box box_con">
								<label class="pwbox" title="비밀번호">Password</label>
								<div class="pw_inputbox">
									<input id="admin_pw" name="admin_pw" type="password" />
								</div>
							</div>
							<div class="go_wrap">
								<div class="goShop">
									<button type="submit" style="cursor:pointer" class="btn btn-default">로그인</button>
								</div>
							</div>
						</fieldset>
					</div>
				</div>
			</form>
		</div>
	</div>

	<script>
	$(".pw_inputbox input").addClass("inputTypeText2");
	    
	$(".inputTypeText").on("focus", function () {
	    $(this).addClass("input_under"); 
	});
	
	$(".inputTypeText").on("blur", function () {
	    $(this).removeClass("input_under");
	});
	    
	$(".inputTypeText2").on("focus", function () {
	    $(this).addClass("input_under");
	});
	
	$(".inputTypeText2").on("blur", function () {
	    $(this).removeClass("input_under");
	}); 

    </script>

	<c:import url="../layout/footer.jsp" />
</body>


</html>