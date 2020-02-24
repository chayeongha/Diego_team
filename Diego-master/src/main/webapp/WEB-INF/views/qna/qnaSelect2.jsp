<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../layout/bootStrap.jsp" />
</head>
<body>
	<c:import url="../layout/nav.jsp" />

	<div class="container">
		<div class="jumbotron page-header">
			<h1>QNA</h1>

		</div>
		<div class="form-group">
			<label for="pro_num">상품번호:</label> 
			<b>${qna.pro_num}</b>
		</div>
		
		<div class="form-group">
			<label for="pro_name">상품명:</label> 
			<b>${product.pro_name}</b>
		</div>
		
		<div class="form-group">
			<label for="pro_main">MAIN 이미지:</label> 
		</div>
				<img src="../resources/product/images/${images.pro_main}"style="width: 30%; height: 30%;"> 	
		
		
		<div class="form-group">
			<label for="title">제목:</label> <b>${qna.title}</b>
		</div>

		<div class="form-group">
			<label for="writer">작성자:</label> <b>${qna.writer}</b>
		</div>

		<div class="form-group">
			<label for="qna_date">작성일</label> <b>${qna.qna_date}</b>
		</div>

		<div class="form-group">
			<label for="contents">내용</label> 
			
			<div class="well" id="contents">${qna.contents}</div>
			
		</div>

		
		


		<a href="./qnaList?qna_num=${qna.qna_num}" class="btn btn-default">목록</a>
		<a href="./qnaReply?qna_num=${qna.qna_num}&pro_num=${qna.pro_num}" class="btn btn-primary">답변</a>
		<a href="./qnaDelete?qna_num=${qna.qna_num}" class="btn btn-danger">삭제</a>
			<a href="./qnaUpdate?qna_num=${qna.qna_num}&pro_num=${qna.pro_num}" class="btn btn-warning">수정</a>
	</div>







</body>
</html>