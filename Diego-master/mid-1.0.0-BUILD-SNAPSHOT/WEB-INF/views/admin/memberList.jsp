<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link href="../resources/css/adminCss/memberList.css" rel="stylesheet">
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<meta charset="UTF-8">
<title>회원관리 페이지</title>
</head>
<body>
	<c:import url="../layout/header.jsp" />
	<div id="listcontentWrap2">
		<c:import url="../admin/adminLeftList.jsp" />
		<div id="listcontent2">
			<div class=" board_listpackage">
				<div class="">
					<div class="titleArea">
						<h2>
							<font color="#555555">Member List</font>
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
							<col style="width: 80px;"/>
							<col style="width: 84px;" />
							<col style="width: auto;" />
							<col style="width: 100px;" />
							<col style="width: 150px;" />
							<col style="width: 100px;" />
							<col style="width: 100px;" />
							<col style="width: 80px;" />
							<col style="width: 80px;" />
							<col style="width: 100px;" />
							<col style="width: 80px;" />
							<col style="width: 80px;" />
							
						</colgroup>
						<thead class="">
							<tr style="">
								<th scope="col">ID</th>
								<th scope="col">NAME</th>
								<th scope="col">ADRESS</th>
								<th scope="col">PHONE</th>
								<th scope="col">EMAIL</th>
								<th scope="col">BIRTH</th>
								<th scope="col">LOCAL</th>
								<th scope="col">RANK</th>
								<th scope="col">TOTAL PAY</th>
								<th scope="col">JOIN DATE</th>
								<th scope="col">LEVEL</th>
								<th scope="col">MANAGE</th>
							</tr>
						</thead>
						<tbody class="center">
							<c:forEach items="${list}" var="dto" varStatus="st">
								<tr>
									<td class="th1">${dto.id}</td>
									<td class="th1">${dto.name}</td>
									<td class="th1 txtBreak">${dto.address_pn} ${dto.address_ba} ${dto.address_da}</td>
									<td class="th1">${dto.phone}</td>
									<td class="th1">${dto.email}</td>
									<td class="th1">
									${dto.ad_birth.toString()} 
									</td>
									<td class="th1">${dto.ad_local}</td>
									<td class="th1">${dto.mem_rank}</td>
									<td class="th1">${dto.total_pay}</td>
									<td class="th1">${dto.join_date}</td>
									<td class="th1">${dto.lev}</td>
									<td class="th1"><a href="./memberUpdate?id=${dto.id}">정보 수정</a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>

			<ul class="pagination paging">

				<li><span id="${pager.startNum-1}" style="cursor: pointer"
					class="list listimg"><img alt="뒤로"
						src="../resources/images/page_prev.gif"></span></li>
				<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
					<li><span id="${i}" class="list listnum"
						style="cursor: pointer">${i}</span></li>
				</c:forEach>
				<c:if test="${pager.curBlock < pager.totalBlock}">
					<li><span id="${pager.lastNum+1}" style="cursor: pointer"
						class="list"><img alt="다음"
							src="../resources/images/page_next.gif"></span></li>
				</c:if>
				<li><span id="${pager.lastNum}" style="cursor: pointer"
					class="list"><img alt="다음"
						src="../resources/images/page_next.gif"></span></li>
			</ul>

			<form id="frm" action="./memberList">
				<div class="outsearch">
					<input type="hidden" value="1" id="curPage" name="curPage">
					<div class="form-group col-xs-2">
						<select name="kind" class="form-control searchop">
							<option id="kt" value="kt">ID</option>
							<option id="kw" value="kw">NAME</option>
							<option id="kc" value="kc">RANK</option>
						</select> 
						<input type="text" class="form-control searchinp"
							placeholder="Search" name="search" value="${pager.search}">
						<button class="btn btn-primary" style="cursor: pointer"
							type="submit">
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
	<c:import url="../layout/footer.jsp" />
</body>


</html>