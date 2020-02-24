<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link href="../resources/css/faqCss/faqList.css" rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>FAQ List</title>
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
							<font color="333333"><a href="./faqList" >FAQ</a></font>
						</h2>
					</div>
				</div>
				<div class="faqMenu">
					<ul id="nav">
						<li><a href="./faqList" class="active">전체보기</a></li>
						<li><a href="./faqList?fcat_code=100">회원</a></li>
						<li><a href="./faqList?fcat_code=200">주문/결제/배송</a></li>
           				<li><a href="./faqList?fcat_code=300">취소/환불/교환</a></li>
           				<li><a href="./faqList?fcat_code=400">상품/포인트/기타</a></li>
					</ul>
					<!-- 찾기 -->
					<form id="frm" action="./faqList">
					<div class="outsearch">
						<input type="hidden" value="1" id="curPage" name="curPage">
						<div class="form-group col-xs-2">
							<select name="kind" class="form-control searchop">
								<option id="kt" value="kt">Title</option>
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
				</div>
				<div class="base_table typeList gBorder faqList">
					<table border="1" summary="">
						<!-- faq 게시판 -->
						<colgroup
							class="">
							<col style="width: 70px;" />
							<col style="width: 135px;" class="" />
							<col style="width: auto;" />
							<col style="width: 100px;" />
							<col style="width: 100px;" class="" />
							<col style="width: 55px;" class="displaynone" />
							<col style="width: 80px;" class="displaynone" />
						</colgroup>
						<tbody class="center">
							<tr style="">
								<td colspan="5">
									<div class="subjectList">
										<ul class="navMenu2">
											<c:forEach items="${list}" var="dto" varStatus="st">
												<li class="main ani3">
													<p class="cate">${dto.faqCategoryVO.fcat_name}</p> <a>${dto.faq_title}</a>
													<div class="subMenu" style="display: none;">
														<ul>
															<li>
																<div class="answerTxt">
																	${dto.faq_contents}
																	</br>
																	</br>
																	</br>
																	 <a href="./faqDelete?faq_num=${dto.faq_num}"><img src="../resources/images/button/btn_delete.gif"alt="삭제" /></a>
																	 <a href="./faqUpdate?faq_num=${dto.faq_num}"><img src="../resources/images/button/btn_modify.gif" alt="수정" /></a>
																</div>
															</li>
														</ul>
													</div>
												</li>
											</c:forEach>
										</ul>
									</div>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="typeBG">
					<%-- <c:if test="${admin ne null}"> --%>
					<span class="gRight">
						<a href="./faqWrite" class="ani3">글쓰기</a>
					</span>
					<%-- </c:if> --%>
				</div>
			</div>
			<ul class="pagination paging">
				
					<li><span id="${pager.startNum-1}" style="cursor:pointer" class="list listimg"><img alt="뒤로" src="../resources/images/page_prev.gif"></span></li>
				<c:forEach begin="${pager.startNum}"  end="${pager.lastNum}" var="i">
					<li><span id="${i}" class="list listnum" style="cursor:pointer">${i}</span></li>
				</c:forEach>
				<c:if test="${pager.curBlock < pager.totalBlock}">
					<li><span id="${pager.lastNum+1}" style="cursor:pointer" class="list"><img alt="다음" src="../resources/images/page_next.gif"></span></li>
				</c:if>
					<li><span id="${pager.lastNum}" style="cursor:pointer" class="list"><img alt="다음" src="../resources/images/page_next.gif"></span></li>
			</ul>
 
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