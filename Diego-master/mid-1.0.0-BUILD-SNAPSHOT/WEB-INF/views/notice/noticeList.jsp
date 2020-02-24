<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link href="../resources/css/noticeCss/noticeList.css" rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>Notice List</title>
</head>
<body>
	<c:import url="../layout/header.jsp" />

	<div id="listcontentWrap2">
		<c:import url="../layout/leftList.jsp" />

		<div id="listcontent2">
			<div class=" board_listpackage xans-board-1002 ">
				<div class="">
					<div class="titleArea">
						<h2>
							<font color="#555555">Notice</font>
						</h2>
					</div>
				</div>
				<div class="boardSort">
					<span class=""></span>
				</div>
				<div class="base_table typeList gBorder">
					<table border="1" summary="">
						<caption></caption>
						<colgroup class="">
							<col style="width: 70px;" />
							<col style="width: auto;" />
							<col style="width: 84px;" />
							<col style="width: 77px;" class="" />
						</colgroup>
						<thead class="">
							<tr style="">
								<th scope="col">번호</th>
								<th scope="col">제목</th>
								<th scope="col">작성자</th>
								<th scope="col" class="">작성일</th>
							</tr>
						</thead>
						<tbody class="center">
						<c:forEach items="${list}" var="dto" varStatus="st">
							<tr style="background-color: #FFFFFF; color: #555555;" class="nbc">
								<td>${dto.not_num}</td>
								<td class="subject left txtBreak"><strong> <a
										href="noticeSelect?not_num=${dto.not_num}" style="color: #555555;">${dto.title}</a> <span
										class="txtEm"></span></strong></td>
								<td>${dto.admin_name}</td>
								<td class=""><span class="txtNum">${dto.not_date}</span></td>
							</tr>
							</c:forEach>
						</tbody>
					</table>
					<p class=""></p>
				</div>
				<%-- <c:if test="${admin ne null}"> --%>
				<div style="text-align: right; float: right; margin-top: 30px"
					class="typeBG">
					<a href="./noticeWrite" class="write">글쓰기</a>
				</div>
				<%-- </c:if> --%>
			</div> 

			<ul class="pagination paging">
				
					<li><span id="${pager.startNum-1}" style="cursor:pointer" class="list listimg"><img alt="뒤로" src="../resources/images/page_prev.gif"></span></li>
				<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
					<li><span id="${i}" class="list listnum" style="cursor:pointer">${i}</span></li>
				</c:forEach>
				<c:if test="${pager.curBlock < pager.totalBlock}">
					<li><span id="${pager.lastNum+1}" style="cursor:pointer" class="list"><img alt="다음" src="../resources/images/page_next.gif"></span></li>
				</c:if>
					<li><span id="${pager.lastNum}" style="cursor:pointer" class="list"><img alt="다음" src="../resources/images/page_next.gif"></span></li>
			</ul>

			<form id="frm" action="./noticeList">
			<div class="outsearch">
				<input type="hidden" value="1" id="curPage" name="curPage">
				<div class="form-group col-xs-2">
					<select name="kind" class="form-control searchop">
						<option id="kt" value="kt">Title</option>
						<option id="kc" value="kc">Contents</option>
						<option id="kw" value="kw">Writer</option>
					</select>
					<input type="text" class="form-control searchinp" placeholder="Search" name="search" value="${pager.search}">
						<button class="btn btn-primary" style="cursor:pointer" type="submit">
							<img alt="찾기버튼" src="../resources/images/button/btn_find.gif">
						</button>
				</div>
			</div>
		</form>
		</div>
	</div>

	<script type="text/javascript">
		var kind = '${pager.kind}';
		if (kind == '') {
			kind = "kt";
		}
		$("#" + kind).prop("selected", true);
		$(".list").click(function() {
			$("#curPage").val($(this).attr("id"));
			$("#frm").submit();
		});
	</script>
	  
	<script>
	/* 마우스 오버  */
	$('.listnum').mouseenter(function() {
		$(this).addClass("mousehover")
	});
	/* 마우스 리브  */
	$('.listnum').mouseleave(function() {
		$(this).removeClass("mousehover")
	});
	</script>

	<c:import url="../layout/footer.jsp" />
</body>


</html>