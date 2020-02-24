<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<c:import url="../layout/bootStrap.jsp" />
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:import url="../layout/nav.jsp" />
<div class="container">
		<h2>Admin Update</h2>
		<form action="./adminUpdate" method="post">
		
		<div class="form-group" >
				<label for="id" class="control-label col-sm-2">ID:</label>
				<div class="col-sm-10">
					<input type="text" name="admin_id" required="required"
						class="form-control" readonly="readonly" id="id" value="${dto.admin_id}">
				</div>
			</div>
			<div class="form-group">
				<label for="pw" class="control-label col-sm-2">Password:</label>
				<div class="col-sm-10">
					<input type="password" name="admin_pw" required="required"
						class="form-control" id="pw">
				</div>
			</div>
			<div class="form-group">
				<label for="pw2" class="control-label col-sm-2">PasswordConfirm:</label>
				<div class="col-sm-10">
					<input type="password" name="admin_pw2" required="required"
						class="form-control" id="pw2">
				</div>
			<div class="alert alert-success" id="alert-success">비밀번호가
					일치합니다.</div>
				<div class="alert alert-danger" id="alert-danger">비밀번호가 일치하지
					않습니다.</div>
			</div>
			<div class="form-group">
				<label for="name" class="control-label col-sm-2">Name:</label>
				<div class="col-sm-10">
					<input type="text" name="admin_name" required="required"
						class="form-control" value="${dto.admin_name}" id="name">
				</div>
			</div>
			<button type="submit" id="submit" class="btn btn-primary">Submit</button>
		</form>
	</div>

</body>

<script type="text/javascript">
$(function() {
	$("#alert-success").hide();
	$("#alert-danger").hide();
	$("input").keyup(function() {
		var pw = $("#pw").val();
		var pw2 = $("#pw2").val();
		if (pw != "" || pw2 != "") {
			if (pw == pw2) {
				$("#alert-success").show();
				$("#alert-danger").hide();
				$("#submit").removeAttr("disabled");
			} else {
				$("#alert-success").hide();
				$("#alert-danger").show();
				$("#submit").attr("disabled", "disabled");
			}
		}
	});
});
</script>
</html>