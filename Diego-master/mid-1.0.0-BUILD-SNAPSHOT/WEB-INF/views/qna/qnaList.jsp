<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>Qna List</title>
<c:import url="../layout/bootStrap.jsp" />
</head>
<body>
		<c:import url="../layout/header.jsp" />
		<div class="container">
			<c:import url="../layout/leftList.jsp" />
		<div class="jumbotron page-header">
			<h1>Qna List</h1>
		</div>
		
		<table class="table"  >
			<thead >
				<tr class="info">
					
					<th>Num</th>
					<th>Title</th>
					<th>Writer</th>
					<th>Date</th>
				
				</tr>

			</thead>

			<tbody>
				
				<c:forEach items="${qnaList}" var="qna" varStatus="q" >
					<tr class="warning">	
						<td>${count-(pager.curPage-1)*pager.perPage-q.index}</td>
						<td>
						<c:catch>
							 <c:forEach begin="1" end="${qna.depth}">↳답변:</c:forEach>
						</c:catch>
						<a href="./qnaSelect?qna_num=${qna.qna_num}&pro_num=${qna.pro_num}">${qna.title}</a></td>
						<td>${qna.writer}</td>
						<td>${qna.qna_date}</td>
					</tr>
			
				</c:forEach>

			</tbody>
		</table>
		
		<div >
			<form action="./qnaList" id="frm">
				<input type="hidden" id="curPage" value="1" name="curPage">
				<select id="kind" name="kind">
					<option id="kt" value="kt">작성자</option>
					<option id="kw" value="kw">제목</option>
					<option id="kc" value="kc">내용</option>
				</select> 
				
				<input type="text" id="search" name="search" value="${pager.search}">
				
				<button>찾기</button>
			</form>
		</div>
		
		<div >
			<ul class="pagination">
				<c:if test="${pager.curBlock gt 1}">
					<li><span id="${pager.startNum-1}" class="list">이전</span></li>
				</c:if>
				<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
					<li><span id="${i}" class="list">${i}</span></li>
				</c:forEach>
				<c:if test="${pager.curBlock lt pager.totalBlock}">
					<li><span id="${pager.lastNum+1}" class="list">다음</span></li>
				</c:if>
			</ul>
		</div>
		
	
		</div>
		
		<script type="text/javascript">
		//서치
		var kind = '${pager.kind}'
		if(kind == ''){
			kind = "kt";
		}
		$("#"+kind).prop("selected", true);
	 	
		$(".list").click(function() {
			$("#curPage").val($(this).attr("id"));
			$("#frm").submit();
		});
		
		
		</script>
		
		<c:import url="../layout/footer.jsp" />
		
</body>
</html>