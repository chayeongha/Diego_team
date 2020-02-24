<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<link href="../resources/css/qnaCss/qnaList.css" rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>QNA List</title>
</head>
<body>
	<c:import url="../layout/header.jsp" />
		<div id="listcontentWrap2">
		<c:import url="../layout/leftList.jsp" />
	<div id="listcontent2">
		<div class="listpackage">
			<div class="ada">
				<div class="title">
					<h2>
						<font color="333333"><a href="./qnaList" >Q&A</a></font>
					</h2>
				</div>
			</div>
			<div class="boardSort">
				<span class="s"></span>
			</div>
			<div class="boardList">
				<div id="ga09photoreview-list">
					<table border="1" summary="">
						<colgroup class="">
							<col style="width: 70px;" />
							<col style="width: auto;" />
							<col style="width: auto;" />
							<col style="width: 100px;" />
							<col style="width: 100px;" />
						</colgroup>
						<tbody class="">
						<c:forEach items="${qnaList}" var="qna" varStatus="q" >
							<tr class="xans-record-">
								<td class="number">${count-(pager.curPage-1)*pager.perPage-q.index}</td>

								<td class="thumb"><a href="/mid/product/productSelect?pro_num=${qna.productVO.pro_num}"><img alt="썸네일이미지" src="../resources/product/images/${qna.imagesVO.sumnale}"></a></td>

								<td class="infobox" style="padding-top: 15px">
									<div>
										<span class="prdname2"><a href="/mid/product/productSelect?pro_num=${qna.productVO.pro_num}">${qna.productVO.pro_name}</a></span>
										<div style="clear: both"></div>
									</div>
									<div class="subject2">
									<c:if test="${qna.secret eq 'Y'}">
									<img src="../resources/images/button/ico_lock.gif" alt="비밀글" class="" />
										</c:if>
										<c:if test="${qna.depth ne 0}">
											<img src="../resources/images/button/icon_rep0.png" alt="답변" class="ec-common-rwd-image" />
										</c:if> 
										<a href="../qna/qnaSelect?qna_num=${qna.qna_num}&pro_num=${qna.productVO.pro_num}">${qna.title}
										<c:if test="${qna.secret eq 'Y'}">
										<img src="../resources/images/button/ico_lock.gif" alt="비밀글" class="" />
										</c:if>
										</a>
										<span class="comment"></span>
									</div>
								</td>

								<td style="text-align: center;">
									<div class="writer2">
									<c:set var="writerLength" value="${fn:length(qna.writer)}"/>
									<c:choose>
									<c:when test="${qna.depth ne 0}"><c:out value="${fn:substring(qna.writer,1+1, writerLength)}"/></c:when>
									<c:otherwise>
									<c:out value="${fn:substring(qna.writer,0,1)}"/>*<c:out value="${fn:substring(qna.writer,1+1, writerLength)}"/>
									</c:otherwise>
									</c:choose>
									</div>
								</td>

								<td style="text-align: right; padding-right: 20px">
									<div class="date">
										<span class="">${qna.qna_date}</span>
									</div>
								</td>
							</tr>
							
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
			
			<div style="text-align: right; float: right; margin-top: 30px"
				class="gRight">
				<a href="../qna/qnaWrite" class=""><b>글쓰기</b></a>
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




			<form id="frm" action="./qnaList">
					<div class="outsearch">
						<input type="hidden" value="1" id="curPage" name="curPage">
						<div class="form-group col-xs-2">
							<select name="kind" class="form-control searchop">
								<option id="kt" value="kt">Title</option>
								<option id="kw" value="kw">Writer</option>
								<option id="kc" value="kc">Contents</option>
							</select> 
							<span class="inputbox">
								<input type="text" class="form-control searchinp"
									placeholder="Search" name="search" value="${pager.search}">
								<input type="text" style="display: none;" name="fcat_code" value="${pager.fcat_code}">
								<button class="btn" type="submit">
									<img alt="찾기버튼" src="../resources/images/button/board_search_btn.png">
								</button>
							</span>
						</div>
					</div>
					</form>
		<!-- 관리자 전용 메뉴 -->

		<!-- //관리자 전용 메뉴 -->
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
	$(".subjectList a").click(function(){
		$(".subMenu").slideUp();
        $(".subjectList .main").removeClass("activeA");
		if(!$(this).next().is(":visible"))
		{
			$(this).next().slideDown();
            $(this).parent().addClass("activeA");
		}
	})
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