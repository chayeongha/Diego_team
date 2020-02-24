<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:import url="../../layout/bootStrap.jsp" />
	<form class="form-horizontal">
		<div class="form-group">
			<label class="control-label col-sm-2" for="id">ID</label>
			<div class="col-sm-10">
				<input type="text" class="form-control" id="id" value="${member.id}"
					readonly="readonly">
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-sm-2" for="point_value">point</label>
			<div class="col-sm-10"> 
				<input type="text" class="form-control" id="point_value" value="" placeholder="사용할 포인트를 입력하세요">
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-sm-2" for="contents">contents</label>
			<div class="col-sm-10">
				<input type="text" class="form-control" id="contents" placeholder="사용 물품">
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-sm-2" for="total_point">total point</label>
			<div class="col-sm-10">
				<input type="text" class="form-control" id="total_point" value="${point.total_point }" readonly="readonly">
			</div>
		</div>
		<div class="form-group">
			<div class="col-sm-offset-2 col-sm-10">
				<button type="button" class="btn btn-success" id="pointUse">USE</button>
			</div>
		</div>
	</form>

	<script type="text/javascript">

	$("#pointUse").click(function() {
		$.ajax({
			type	:	"POST",
			url		:	"pointUse",
			data	:	{
					id			:	$("#id").val(),
					point_value	:	$("#point_value").val(),
					contents 	:	$("#contents").val(),
					total_point	:	$("#total_point").val()
			},
			success: function(data) {
				data = data.trim();
				if (data == 1) {
					alert("성공");
					location.href = "/mid/diego";
				}else{
					alert("POINT가 부족합니다");	
				}
			}
		});
	});



</script>
</body>
</html>