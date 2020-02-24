<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 조회</title>
</head>
<body>
<c:import url="../../layout/bootStrap.jsp"/>
<form class="form-horizontal" method="post" action="orderInsert" enctype="multipart/form-data">
  <div class="form-group">
    <label class="control-label col-sm-2" for="id">ID</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" id="id" value="${orders.id }" readonly="readonly">
    </div>
  </div>
    <div class="form-group">
    <label class="control-label col-sm-2" for="image">상품사진</label>
    <div class="col-sm-10">
      <img src="/mid/resources/product/orders/${orders.image }" width="50%" height="50%">
    </div>
  </div>
  <div class="form-group">
    <label class="control-label col-sm-2" for="pro_num">상품번호</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" id="pro_num" value="${orders.pro_num }" readonly="readonly">
    </div>
  </div>
  <div class="form-group">
    <label class="control-label col-sm-2" for="pro_info">상품정보</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" id="pro_info" value="${orders.pro_info }"  readonly="readonly">
    </div>
  </div>
  <div class="form-group">
    <label class="control-label col-sm-2" for="pro_count">주문수량</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" id="pro_count"  value="${orders.pro_count }"  readonly="readonly">
    </div>
  </div>
  <div class="form-group">
    <label class="control-label col-sm-2" for="price">상품가격</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" id="price" value="${orders.price }"  readonly="readonly">
    </div>
  </div>
  <div class="form-group">
    <label class="control-label col-sm-2" for="order_sum">주문금액</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" id="order_sum" value="${orders.order_sum }"  readonly="readonly">
    </div>
  </div>
  <div class="form-group">
    <div class="col-sm-offset-2 col-sm-10">
      <a href="/mid/member/memberManage/orderUpdate?order_num=${orders.order_num }" id="orderUpdate" class="btn btn-warning">수정</a>
      <button type="button" class="btn btn-danger" id="orderDel">취소</button>
    </div>
  </div>
</form>
<script type="text/javascript">
	$("#orderDel").click(function() {
		if (confirm("취소하시겠습니까?")) {
			$.ajax({
				type	: "POST",
				url 	: "orderCancel",
				data	: {
					order_num	: "${orders.order_num}",
					id 			: "${member.id}"
				},
				success : function(data) {
					data = data.trim();
					if (data == 1) {
						alert("성공적으로 취소됐습니다");
						location.href="orderMyList";
					}else{
						alert("다시 시도해 주세요");
					}
				}
			});
		}
	});

</script>
</body>
</html>