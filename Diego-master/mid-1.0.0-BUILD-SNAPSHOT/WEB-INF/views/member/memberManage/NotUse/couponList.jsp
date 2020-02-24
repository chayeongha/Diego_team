<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Coupon List</title>
</head>
<body>
<c:import url="../../layout/bootStrap.jsp"/>
<div class="container">
  <h2>쿠폰 리스트</h2>            
  <table class="table table-hover">
    <thead>
      <tr>
        <th>쿠폰번호</th>
        <th>쿠폰이름</th>
        <th>마감일</th>
        <th>세일</th>
        <th></th>
      </tr>
    </thead>
    <tbody>
    <c:forEach items="${couponList }" var="coupon" varStatus="i">
      <tr>
        <td>${coupon.coup_num }</td>
        <td>${coupon.coup_name }</td>
        <td>${coupon.deadline }</td>
        <td>${coupon.discount }</td>
        <td>
        <button type="button" class="btn btn-danger" value="${coupon.coup_num }">삭제</button>
        <button type="button" class="btn btn-success" value="${coupon.coup_num }">발급</button>
        </td>
      </tr>
      </c:forEach>
    </tbody>
  </table>
    <a href="couponMaker" class="btn btn-info">생성</a>
</div>
<script type="text/javascript">
	$(".btn-danger").click(function() {
		if (confirm("삭제하시겠습니까?")) {
			$.ajax({
				type	: "GET",
				url		: "couponDelete",
				data 	: {
					coup_num	: $(this).val()
				},
				success	: function(data) {
					data = data.trim();
					if (data == 1) {
						alert("성공");
						location.reload();
					}else{
						alert("실패");
					}
				}
			});
		}
	});
	
	$(".btn-success").click(function() {
		$.ajax({
			type	: "GET",
			url		: "couponInsert",
			data	: {
				coup_num	: $(this).val()
			},
			success	: function(data) {
				data = data.trim();
				if (data == 1) {
					alert("발급 되었습니다.");
					location.reload();
				}else{
					alert("이미 발급 받으셨습니다.");
				}
			}
		});
	});



</script>
</body>
</html>