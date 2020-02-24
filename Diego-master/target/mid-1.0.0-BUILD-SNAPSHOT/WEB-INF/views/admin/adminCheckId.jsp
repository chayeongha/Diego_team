<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<c:import url="../layout/bootStrap.jsp" />
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>${param.admin_id} ${result}</h1>
	<div class="container">
		<form class="form-inline" action="./adminCheckId">
   		 	<div class="form-group">
     		 	<label for="id">Id:</label>
      			<input type="text" value="${param.admin_id}" class="form-control" id="admin_id" name="admin_id">
   			</div>

    <button type="submit" class="btn btn-default">중복확인</button>
    <c:if test="${empty dto}">
    	<input type="button" class="btn btn-primary" id="useId" value="사용하기">
    </c:if>
 	 </form>
	</div>

</body>
<script type="text/javascript">
$("#useId").click(function() {
	var admin_id = $("#admin_id").val();
	
	$("#admin_id", opener.document).val(admin_id);
	
	window.self.close();
});
</script>
</html>