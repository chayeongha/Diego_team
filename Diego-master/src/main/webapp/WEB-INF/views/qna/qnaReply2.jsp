<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../layout/bootStrap.jsp" />
<c:import url="../layout/summerNote.jsp"></c:import>
</head>
<body>
	<c:import url="../layout/nav.jsp" />
	
	<div class="container">
		
		<div class="jumbotron page-header">
			<h1>QNA REPLY PAGE</h1>
		</div>
		
		<form action="./qnaReply?qna_num=${qna.qna_num}&pro_num=${qna.pro_num}" method="post" onsubmit="true">
			
			<div class="form-group">
				<label for="title">제목 : </label> 
				<input type="text" class="form-control" id="title" name="title" readonly="readonly" value="${qna.title}">
			</div>		
					
					
			<div class="form-group">
				<label for="witer">Writer : </label> 
				<input type="text" class="form-control" id="writer" name="writer" readonly="readonly" value="${admin.admin_id}">
			</div>

			
			<div class="form-group">
				<label for="contents">Contents:</label>
				<textarea class="form-control" rows="30" id="contents" name="contents"></textarea>
			</div>

			<button  class="btn btn-primary">등록</button>
			<a href="./qnaList" class="btn btn-default">List</a>
		
		</form>
	</div>
	
	<script type="text/javascript">
	
	//섬머노트
	$("#contents").summernote({
		height : 120,

	});
	
	$("#contents").summernote('code','[ Original Message ]${qna.contents}');
	
	</script>
</body>
</html>