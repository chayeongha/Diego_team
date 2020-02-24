<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Coupon List</title>
</head>
<body>
<c:import url="../../layout/bootStrap.jsp"/>
<div class="container">
  <h2>My 쿠폰 리스트</h2>            
  <table class="table table-hover">
    <thead>
      <tr>
        <th>쿠폰번호</th>
        <th>쿠폰이름</th>
        <th>마감일</th>
        <th>세일</th>
      </tr>
    </thead>
    <tbody>
    <c:forEach items="${couponList }" var="coupon" varStatus="i">
      <tr>
        <td>${coupon.coup_num }</td>
        <td>${coupon.coup_name }</td>
        <td>${coupon.deadline }</td>
        <td>${coupon.discount }</td>
      </tr>
      </c:forEach>
    </tbody>
  </table>

</div>


</body>
</html>