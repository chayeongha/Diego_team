<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>notice title here</title>
<c:import url="../layout/bootStrap.jsp"/>

</head>
<body>
	<c:import url="../layout/nav.jsp" />
	<div class="container" >
	<h1 class="title_n">FAQ</h1> 
		<table class="table ">
			<thead>
				<tr>
					<th class="th1">Category</th><th class="th1">Title</th><th class="th1">Date</th>
				</tr>
			</thead> 
			<tbody> 
				<tr>
					<td class="th1">${category.fcat_name}</td><td id="title1">${dto.faq_title}</td><td class="th1 date">${dto.faq_date}</td>
				</tr>
				<tr>
					<td colspan="4"><div class="con1">${dto.faq_contents}</div></td>
				</tr>
			</tbody>
		</table>
		
		
		<a href="faqList" class="btn btn-primary">글목록</a>
		
			<a class="btn btn-primary" href="faqUpdate?faq_num=${dto.faq_num}">Update</a>
			<a class="btn btn-danger" href="faqDelete?faq_num=${dto.faq_num}">Delete</a>

	</div>
	
	
</body>
</html>