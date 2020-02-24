<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../layout/bootStrap.jsp"/>
</head>
<body>
	<c:import url="../layout/nav.jsp" />
	<div class="container">
		<h2>FAQ Update Page</h2>
		<form action="./faqUpdate" method="post">
		<input type="text" name = "faq_num" value="${dto.faq_num}" hidden="" readonly="readonly">
			<div class="form-group">
				<label for="title">Title : </label> <input type="text"
					class="form-control" id="faq_title" value="${dto.faq_title}" name="faq_title">
			</div>
			<div class="form-group">
				<label>Category</label> 
				<select class="category" name="fcat_code">
				<c:forEach var="category" items="${category}">
					<option value="${category.fcat_code}">${category.fcat_name}</option>
					</c:forEach>
				</select> 
			</div>
			<div class="form-group">
				<label for="contents">Contents:</label>
				
				<textarea class="form-control" rows="30" id="contents"
					name="faq_contents">${dto.faq_contents}</textarea>
			</div>			
			<button type="submit" class="btn btn-default">Update</button>
		</form>
	</div>

</body>
</html>