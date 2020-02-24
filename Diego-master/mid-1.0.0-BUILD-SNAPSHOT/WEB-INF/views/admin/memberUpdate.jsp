<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link href="../resources/css/adminCss/memberUpdate.css" rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>Member Update Page</title>
</head>
<body>
	<c:import url="../layout/header.jsp" />
<div id="listcontentWrap2">
	<c:import url="../admin/adminLeftList.jsp" />
		<div id="listcontent2">
			<div class="">
				<div class="">
					<div class="titleArea">
						<h2>
							<font color="#555555">Member Update</font>
						</h2>
					</div>
				</div>
				<form id="boardWriteForm" name="" action="./memberUpdate" method="post" target="_self" enctype="multipart/form-data">
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
										<th scope="row">ID</th>
										<td><input type="text" class="form-control" id="id" value="${dto.id }" readonly="readonly" name="id"></td>
									</tr>
									<tr class="displaynone writer">
										<th scope="row">Name</th>
										<td><input type="text" class="form-control" id="name" value="${dto.name }" name="name"></td>
									</tr>
									<tr class="displaynone writer">
										<th scope="row">우편번호</th>
										<td> <input type="text" class="form-control" id="address_pn" value="${dto.address_pn}" name="address_pn" ></td>
									</tr>
									<tr class="displaynone writer">
										<th scope="row">기본주소</th>
										<td> <input type="text" class="form-control" id="address_ba" value="${dto.address_ba}" name="address_ba" ></td>
									</tr>
									<tr class="displaynone writer">
										<th scope="row">상세주소</th>
										<td> <input type="text" class="form-control" id="address_da" value="${dto.address_da}" name="address_da" ></td>
									</tr>
									<tr class="displaynone writer">
										<th scope="row">연락처</th>
										<td> <input type="text" class="form-control" id="phone" value="${dto.phone}" name="phone" ></td>
									</tr>
									<tr class="displaynone writer">
										<th scope="row">이메일</th>
										<td><input type="email" class="form-control" id="email" value="${dto.email}" name="email" ></td>
									</tr>
									<tr class="displaynone writer">
										<th scope="row">생일</th>
										<td> <input type="date" class="form-control" id="ad_birth" value="${dto.ad_birth}" name="ad_birth" ></td>
									</tr>
									<tr class="displaynone writer">
										<th scope="row">맴버 등급</th>
										<td>  <input type="text" class="form-control" id="mem_rank" value="${dto.mem_rank}" name="mem_rank" ></td>
									</tr>
									<tr class="displaynone writer">
										<th scope="row">거주지역</th>
										<td><input type="text" class="form-control" id="ad_local" value="${dto.ad_local }" name="ad_local" ></td>
									</tr>
									<tr class="displaynone writer">
										<th scope="row">LEVEL</th>
										<td>  <input type="text" class="form-control" id="lev" value="${dto.lev}" name="lev" ></td>
									</tr>
								</tbody>
							</table>
						</div>
						<div class="base_button">
							<span class="gLeft"> 
								<a href="./memberList"><img src="../resources/images/button/btn_list.gif" alt="목록" /></a>
							</span> 
							<span class="gRight"> 
								<button type="submit" class="btn">
									<img src="../resources/images/button/btn_register.gif" alt="등록" /></button>
									<a href="./memberList"><img src="../resources/images/button/btn_cancel.gif" alt="취소" /></a>
							</span>
						</div>
					</div>
				</form>
			</div>
		</div>
</div>
	<c:import url="../layout/footer.jsp" />
</body>


</html>