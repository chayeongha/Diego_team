<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		<p>작성자: ${review.name}</p> 
		<p>리뷰넘버:${review.rev_num}</p>
		<p>도움: ${review.help}</p>
		<p>평점:${review.star}</p>
		<p>리뷰콘텐츠: ${review.rev_contents}</p>
		
	
	
	
</body>
</html>