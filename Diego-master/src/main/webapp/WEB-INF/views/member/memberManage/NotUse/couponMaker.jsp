<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:import url="../../layout/bootStrap.jsp"/>
<form class="form-horizontal" method="post" action="couponMaker">
  <div class="form-group">
    <label class="control-label col-sm-2" for="coup_name">쿠폰 이름</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" id="coup_name" placeholder="쿠폰이름을 입력하세요" name="coup_name">
    </div>
  </div>
    <div class="form-group">
    <label class="control-label col-sm-2" for="ID">ID</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" id="id" value="admin" readonly="readonly" name="id">
    </div>
  </div>
      <div class="form-group">
    <label class="control-label col-sm-2" for="discount">할인률</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" id="discount" placeholder="할인률을 입력하세요" name="discount">
    </div>
  </div>

  <div class="form-group">
    <div class="col-sm-offset-2 col-sm-10">
      <button type="submit" class="btn btn-success" id="couponMaker">추가</button>
    </div>
  </div>
</form>
</body>
</html>