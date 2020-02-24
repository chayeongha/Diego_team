<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:import url="../../layout/bootStrap.jsp"/>
<form class="form-horizontal" action="wishListInsert" method="post" enctype="multipart/form-data">
  <div class="form-group">
    <label class="control-label col-sm-2" for="image">image</label>
    <div class="col-sm-10">
      <input type="file" class="form-control" id="fname" name="fname">
    </div>
  </div>
    <div class="form-group">
    <label class="control-label col-sm-2" for="id">ID</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" id="id" value="${member.id }" readonly="readonly" name = "id">
    </div>
  </div>
      <div class="form-group">
    <label class="control-label col-sm-2" for="pro_num">pro_num</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" id="pro_num" placeholder="pro_num" name="pro_num" value="99999">
    </div>
  </div>
      <div class="form-group">
    <label class="control-label col-sm-2" for="pro_info">pro_info</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" id="pro_info" placeholder="pro_info" name="pro_info" value="WishTest">
    </div>
  </div>
      <div class="form-group">
    <label class="control-label col-sm-2" for="price">PRICE</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" id="price" placeholder="price" name="price" value="50000">
    </div>
  </div>
      <div class="form-group">
    <label class="control-label col-sm-2" for="delivery_cost">DEL_COST</label>
    <div class="col-sm-10">
      <select class="form-control" name="delivery_cost">
      	<option value="무료">그외지역</option>
      	<option value="3000">제주</option>
      </select>
    </div>
  </div>

  
  <div class="form-group">
    <div class="col-sm-offset-2 col-sm-10">
      <button type="submit" class="btn btn-success" id="wishInsert">추가</button>
    </div>
  </div>
</form>
</body>
</html>