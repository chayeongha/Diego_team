<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:import url="../layout/bootStrap.jsp"/>
<form class="form-horizontal">
  <div class="form-group">
    <label class="control-label col-sm-2" for="ID">ID</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" id="id" value="${member.id }" readonly="readonly" name="id">
    </div>
  </div>
    <div class="form-group">
    <label class="control-label col-sm-2" for="name">Name</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" id="name" value="${member.name }" readonly="readonly" name="name">
    </div>
  </div>
      <div class="form-group">
    <label class="control-label col-sm-2" for="address_pn">우편번호</label>
    <div class="col-sm-10">
      <input value="${member.address_pn}" type="text" class="form-control" id="address_pn" readonly="readonly" name="address_pn" >
    </div>
  </div>
      <div class="form-group">
    <label class="control-label col-sm-2" for="address_ba">기본주소</label>
    <div class="col-sm-10">
      <input value="${member.address_ba}" type="text" class="form-control" id="address_ba" readonly="readonly" name="address_ba" >
    </div>
  </div>
        <div class="form-group">
    <label class="control-label col-sm-2" for="address_da">상세주소</label>
    <div class="col-sm-10">
      <input value="${member.address_da}" type="text" class="form-control" id="address_da" readonly="readonly" name="address_da" >
    </div>
  </div>
        <div class="form-group">
    <label class="control-label col-sm-2" for="phone">연락처</label>
    <div class="col-sm-10">
      <input value="${member.phone}" type="text" class="form-control" id="phone" readonly="readonly" name="phone" >
    </div>
  </div>
        <div class="form-group">
    <label class="control-label col-sm-2" for="email">이메일</label>
    <div class="col-sm-10">
      <input value="${member.email}" type="email" class="form-control" id="email" readonly="readonly" name="email" >
    </div>
  </div>
        <div class="form-group">
    <label class="control-label col-sm-2" for="ad_birth">생년월일</label>
    <div class="col-sm-10">
      <input value="${member.ad_birth}" type="text" class="form-control" id="ad_birth" readonly="readonly" name="ad_birth" >
    </div>
  </div>
  <div class="form-group">
    <label class="control-label col-sm-2" for="total_pay">총 구매금액</label>
    <div class="col-sm-10">
      <input value="${member.total_pay}원" type="text" class="form-control" id="total_pay" readonly="readonly" name="total_pay" >
      
    </div>
  </div>
        <div class="form-group">
    <label class="control-label col-sm-2" for="ad_local">거주지역</label>
    <div class="col-sm-10">
      <input value="${member.ad_local}" type="text" class="form-control" id="ad_local" readonly="readonly" name="ad_local" >
    </div>
  </div>
<!--   <div class="form-group"> -->
<!--    	<label class="control-label col-sm-2" for="@@@@@@">@@@@@@</label> -->
<!--   		<div class="col-sm-10"> -->
<!--       		<input type="text" class="form-control" id="" name="" > -->
<!--     </div> -->
<!--   </div> -->
    
  <div class="form-group">
    <div class="col-sm-offset-2 col-sm-10">
      <button type="button" class="btn btn-warning" id="update">수정</button>
      <button type="button" class="btn btn-danger" id="delete">삭제</button>
    </div>
  </div>
  

</form>

<script type="text/javascript">
$("#update").click(function() {
	location.href="memberUpdate";
});

$("#delete").click(function() {
	if (confirm("삭제 하시겠습니까?")) {
	$.ajax({
		type : "GET",
		url : "memberDelete",
		data : {
			id : $("#id").val()
		},
		success : function(data) {
			data = data.trim();
			if (data == 1) {
				alert("탈퇴 성공했습니다!")
				location.href="/mid/";
			}else{
				alert("들어갈땐 쉽지만 나갈땐 아니랍니다!");
			}
		}
	});		
	}
});


</script>
</body>
</html>