<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<select name="cat_ref" id="kinds" onchange="location.href=this.value">

<c:choose>
	<c:when test="${qe eq 0}">
		<option>선택하세요</option>
		<option value="proManageList?cat_ref=%%">all</option>
	</c:when>
	
	<c:otherwise>
	
	<c:forEach items="${kind}" var="i" varStatus="v">
		
			<option value="proManageList?cat_ref=${result+v.count-1}" >${i}</option>
	
	</c:forEach>
	</c:otherwise>


</c:choose>

</select>