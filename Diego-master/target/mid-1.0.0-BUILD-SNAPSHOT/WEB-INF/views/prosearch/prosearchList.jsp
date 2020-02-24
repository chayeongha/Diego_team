<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link href="../resources/css/searchCss/prosearch.css" rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:import url="../layout/header.jsp" />

	<div class="outsearch" style="display: none;">
		<form id="frm" action="./prosearchList">
			<input type="hidden" value="1" id="curPage" name="curPage">
			<div class="form-group col-xs-2">
				<select name="kind" class="form-control searchop">
					<option id="kw" value="kw">Writer</option>
				</select> <input type="text" class="form-control searchinp"
					placeholder="Search" name="search" value="${pager.search}">
				<button class="btn btn-primary" style="cursor: pointer"
					type="submit">
					<img alt="찾기버튼" src="../resources/images/button/btn_find.gif">
				</button>
			</div>
		</form>
	</div>

	<div id="listcontentWrap">
		<c:if test="${productsize eq 0}">
		<div id="listcontent">
			<div class="titleArea">
				<h2>SEARCH</h2>
			</div>
			<div class="noData"> 
			<strong class="warning">검색결과가 없습니다.</strong>
			<strong>정확한 검색어 인지 확인하시고 다시 검색해 주세요.</strong>
			<ul>
				<li>검색어/제외검색어의 입력이 정확한지 확인해 보세요.</li>
				<li>두 단어 이상의 검색어인 경우, 띄어쓰기를 확인해 보세요.</li>
			</ul>
			</div>
			</div>
		</c:if>
		<c:if test="${productsize ne 0}">
		<div id="listcontent">
			<div class="titleArea"> 
				<h2>SEARCH</h2>
			</div>
			<div class="xans-element- xans-search xans-search-result ga09list">

				<ul class="grid4">
				<c:forEach items="${productList}" var="product" varStatus="p">
					<li id="" class="">
						<div class="prdpadding">
							<div class="prdline">
								<a href="../product/productSelect?pro_num=${product.pro_num}"><div style="position: relative;">
										<div id="ga09img2">
											<img
												src="../resources/product/images/${product.pro_main}"
												width="100%" class="ga09img2" />
										</div>
									</div> <img
									src="../resources/product/images/${product.pro_main}"
									width="100%" class="ga09img" /></a>
							</div>
							<p class="name">
								<strong><a href="../product/productSelect?pro_num=${product.pro_num}" class="">
											<span style="font-size: 14px; color: #000000;">${product.pro_name}</span></a></strong>
							</p>

							<div class="icon"></div>
						</div>
					</li>
					</c:forEach>
				</ul>
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

		</div>
</c:if>
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