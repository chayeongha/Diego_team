<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 수정</title>
</head>
<body>
<c:import url="../../layout/bootStrap.jsp"/>
<form class="form-horizontal" method="post" action="orderUpdate">
<div class="form-group">
    <label class="control-label col-sm-2" for="order_num">주문번호</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" id="order_num" value="${orders.order_num }" readonly="readonly" name="order_num">
    </div>
  </div>
  <div class="form-group">
    <label class="control-label col-sm-2" for="id">ID</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" id="id" value="${orders.id }" readonly="readonly" name="id">
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
      <input type="text" class="form-control" id="pro_count"  value="${orders.pro_count }" name="pro_count">
    </div>
  </div>
  <div class="form-group">
    <label class="control-label col-sm-2" for="price">가격</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" id="price" value="${orders.price }"  readonly="readonly" name="price">
    </div>
  </div>
  <div class="form-group">
    <div class="col-sm-offset-2 col-sm-10">
    <input type="hidden" class="form-control" id="order_num" value="${orders.order_result }" readonly="readonly" name="order_result">
    <input type="hidden" class="form-control" id="order_num" value="${orders.order_status }" readonly="readonly" name="order_status">
      <button type="submit" id="orderUpdate" class="btn btn-warning">수정</button>
    </div>
  </div>
</form>

</body>
</html>