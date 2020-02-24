<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<link href="../resources/css/noticeCss/noticeWrite.css"
	rel="stylesheet">
	<c:import url="../layout/bootStrap.jsp"/>
	<c:import url="../layout/summerNote.jsp"/> 
<meta charset="UTF-8">
<title>Notice Write</title>
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
							<font color="#555555">Notice Write</font>
						</h2>
					</div>
				</div>
				<form id="boardWriteForm" name="" action="./noticeWrite" method="post" target="_self" enctype="multipart/form-data">
					<div class="">
						<div class="typeWrite ">
							<table border="1" summary="">
								<caption></caption>
								<colgroup>
									<col style="width: 130px;" />
									<col style="width: auto;" />
								</colgroup>
								<tbody>
									<tr>
										<th scope="row">제목</th>
										<td><input type="text" class="form-control subject" id="title" name="title"></td>
									</tr>
									<tr class="displaynone writer" style="display: none;">
										<th scope="row">관리자 아이디</th>
										<td><input type="text" class="form-control" id="admin_id" name="admin_id" readonly="readonly" value="${admin.admin_id}"></td>
									</tr>
									<tr class="displaynone writer">
										<th scope="row">작성자</th>
										<td><input type="text" class="form-control" id="admin_name" name="admin_name" readonly="readonly" value="${admin.admin_name}"></td>
									</tr>
									<tr>
										<td colspan="2" class="clear">
												<textarea class="form-control" rows="30" id="contents" name="contents"></textarea>
											</td>
									</tr>
								</tbody>
							</table>
						</div>
						<div class="base_button">
							<span class="gLeft"> 
								<a href="./noticeList"><img src="../resources/images/button/btn_list.gif" alt="목록" /></a>
							</span> 
							<span class="gRight"> 
								<button type="submit" class="btn">
									<img src="../resources/images/button/btn_register.gif" alt="등록" /></button>
									<a href="./noticeList"><img src="../resources/images/button/btn_cancel.gif" alt="취소" /></a>
							</span>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>

	<c:import url="../layout/footer.jsp" />
</body>
	<script type="text/javascript">
	$("#contents").summernote({
		height : 400,
	});
	</script>


</html>