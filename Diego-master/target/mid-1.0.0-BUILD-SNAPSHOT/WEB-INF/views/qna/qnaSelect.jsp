<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<link href="../resources/css/qnaCss/qnaSelect.css" rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>qna Select</title>
</head>
<body>
	<c:import url="../layout/header.jsp" />

	<div id="listcontentWrap2">
		<c:import url="../layout/leftList.jsp" />

		<div id="listcontent2">
			<div class="">
				<div class="">
					<div class="titleArea">
						<h2>
							<font color="333333">Q&A</font>
						</h2>
					</div>
				</div>
				<div class="ec-base-box typeProduct">
					<p class="thumbnail">
						<a href="/mid/product/productSelect?pro_num=${qna.pro_num}">
						<img src="../resources/product/images/${images.pro_main}"
							alt="" onerror="this.src='//img.echosting.cafe24.com/thumb/75x75.gif'" /></a>
					</p>
					<div class="information">
						<h3>
							<a href="/mid/product/productSelect?pro_num=${qna.pro_num}">${product.pro_name}</a>
						</h3>
						<p class="price">${product.pro_price} <span id="sPrdTaxText"></span>
						</p>
						<p class="button">
							<a href="/mid/product/productSelect?pro_num=${qna.pro_num}" title="새창으로 이동"><img
								src="//img.echosting.cafe24.com/skin/base_ko_KR/board/btn_prd_detail.gif"
								alt="상품상세보기" /></a>
						</p>
					</div>
				</div>
				
						<div class="ec-base-table typeWrite ">
							<table border="1" summary="">
								<caption>상품 게시판 상세</caption>
								<colgroup>
									<col style="width: 130px;" />
									<col style="width: auto;" />
								</colgroup>
								<tbody>
									<tr>
										<th scope="row">제목</th>
										<td>${qna.title}</td>
									</tr>
									<tr>
										<th scope="row">작성자</th>
										<td><div class="writer2"><c:set var="writerLength" value="${fn:length(qna.writer)}"/>
											<c:choose>
											<c:when test="${qna.depth ne 0}"><c:out value="${fn:substring(qna.writer,1+1, writerLength)}"/></c:when>
											<c:otherwise>
											<c:out value="${fn:substring(qna.writer,0,1)}"/>*<c:out value="${fn:substring(qna.writer,1+1, writerLength)}"/>
											</c:otherwise>
											</c:choose></div></td>
									</tr>
									<tr>
										<td colspan="2">
											<ul class="etcArea">
												<li class=""><strong>작성일</strong> <span class="txtNum">${qna.qna_date}</span>
												</li>
											</ul>
											<div class="detail">${qna.contents}</div>
										</td>
									</tr>
									<tr class=" ">
										<th scope="row">비밀번호</th>
										<td><input id="password" name="password" fw-filter=""
											fw-label="비밀번호" fw-msg=""
											onkeydown="if (event.keyCode == 13 || event.which == 13) { return false; }"
											value="" type="password" /> <span
											class="ec-base-help txtInfo">삭제하려면 비밀번호를 입력하세요.</span></td>
									</tr>
								</tbody>
							</table>
						</div>
						<div class="ec-base-button ">
							<span class="gLeft">
							<a href="../admin/qnaList">
							<img src="//img.echosting.cafe24.com/skin/base_ko_KR/board/btn_list.gif" alt="목록" /></a>
							</span> <span class="gRight"> 
							<a href="./qnaDelete?qna_num=${qna.qna_num}" class="displaynone">
							<img src="//img.echosting.cafe24.com/skin/base_ko_KR/board/btn_delete.gif"
									alt="삭제" /></a> 
									<a href="./qnaUpdate?qna_num=${qna.qna_num}&pro_num=${qna.pro_num}" class="displaynone">
									<img src="//img.echosting.cafe24.com/skin/base_ko_KR/board/btn_modify.gif"
									alt="수정" /></a> 
									<a href="./qnaReply?qna_num=${qna.qna_num}&pro_num=${qna.pro_num}" class="">
									<img src="//img.echosting.cafe24.com/skin/base_ko_KR/board/btn_reply.gif"
									alt="답변" /></a>
							</span>
						</div>
					</div>
			</div>

		</div>





	<c:import url="../layout/footer.jsp" />
</body>


</html>