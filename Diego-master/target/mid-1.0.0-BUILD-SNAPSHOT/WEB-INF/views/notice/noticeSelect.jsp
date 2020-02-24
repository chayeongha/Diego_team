<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link href="../resources/css/noticeCss/noticeSelect.css" rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>Notice Select</title>
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
							<font color="#555555">Notice</font>
						</h2>
					</div>
				</div>
				<!-- 글 내용-->
				<form id="BoardDelForm" name="" action="" method="post" target="_self" enctype="multipart/form-data">
					<div class="">
						<div class="typeWrite">
							<table border="1" summary="">
								<caption></caption>
								<colgroup>
									<col style="width: 130px;" />
									<col style="width: auto;" />
								</colgroup>
								<tbody>
									<tr>
										<th scope="row">제목</th>
										<td>${dto.title}</td>
									</tr>
									<tr>
										<th scope="row">작성자</th>
										<td>${dto.admin_name}</td>
									</tr>
									<tr>
										<td colspan="2">
											<ul class="etcArea">
												<li class=""><strong>작성일</strong> <span class="txtNum">${dto.not_date}</span></li>
											</ul>
											<div class="detail">
												<!-- 글 안의내용  -->
												${dto.contents}
											</div>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
						<div class="base_button">
						<span class="gLeft">
							<a href="./noticeList"><img src="../resources/images/button/btn_list.gif" alt="목록" /></a>
						</span>
							<!-- 관리자 아니면 안보이게 하기 -->
							<%-- <c:if test="${admin ne null}"> --%>
							<span class="gRight">
							 <a href="./noticeDelete?not_num=${dto.not_num}" onclick="" class="displaynone"><img src="../resources/images/button/btn_delete.gif"alt="삭제" /></a> 
							 	<a href="./noticeUpdate?not_num=${dto.not_num}" class="displaynone"><img src="../resources/images/button/btn_modify.gif" alt="수정" /></a> 
							</span>
							<%-- </c:if> --%>
						</div>
					</div>
				</form>
			</div>
</div>


		</div>






		<c:import url="../layout/footer.jsp" />
</body>


</html>