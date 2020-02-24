<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link href="../resources/css/adminCss/adminPage.css" rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>Admin Page</title>
</head>
<body>
	<c:import url="../layout/header.jsp" />
<div id="listcontentWrap2">
	<c:import url="../admin/adminLeftList.jsp" />
	<div id="listcontent2">
	<h1>관리자 정보</h1>
	<p>아이디 : ${dto.admin_id}</p>
	<p>이름 : ${dto.admin_name}</p>
	<p>레벨 : ${dto.lev}</p>
</div>
</div>
	<c:import url="../layout/footer.jsp" />
</body>


</html>