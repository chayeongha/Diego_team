<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<link href="../resources/css/qnaCss/qnaWrite.css" rel="stylesheet">
<c:import url="../layout/bootStrap.jsp" />
<c:import url="../layout/summerNote.jsp" />
<meta charset="UTF-8">
<title>QNA Write</title>
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
							<font color="#555555">QNA Write</font>
						</h2>
					</div>
					<form id="boardWriteForm" name="" action="./qnaWrite" method="post" enctype="multipart/form-data">
							<!-- 상품정보 -->
							<div class="review_prd  ">
								<div class="prdThumb">
									<a href=""><img id="iPrdImg" src=""
										onerror="this.src='http://img.echosting.cafe24.com/thumb/75x75.gif'"
										alt="" /></a>
								</div>
								<div class="prdInfo">
									<p class="name">
										<input type="text" readonly="readonly" id="sPrdName">
									</p>
									<p class="price">
										<input type="text" id="sPrdPrice"  readonly="readonly">
										<input type="text" id="sProNum" name="pro_num" readonly="readonly" style="display: none;">
									</p>
									<div class="button">
										<c:if test="${param.pro_num ne null}">
										<span id="iPrdView" class="">
										<a href="/product/detail.html?product_no=0" id="aPrdLink"
											target="_blank" class="photoreview-bt2 size1">상품상세보기</a></span></c:if>
											 <span class=""><a href="#none" onclick="window.open('/mid/product/proSearch','제품 선택','width=680,height=520,location=no,status=no,scrollbars=yes')"
											class="photoreview-bt2 size1">상품정보선택</a></span>
								</div>
								<div style="clear: both"></div>
							</div>
							<!-- 상품정보 -->
							<div class="ec-base-table typeWrite ">
								<table border="1" summary="">
									<colgroup>
										<col style="width: 130px;" />
										<col style="width: auto;" />
									</colgroup>
									<tbody>
										<tr>
											<th scope="row">제목</th>
											<td><select id="title" name="title">
													<option value="상품 문의 드립니다">상품 문의 드립니다</option>
													<option value="배송 문의 드립니다">배송 문의 드립니다</option>
													<option value="기타 문의 드립니다">기타 문의 드립니다</option>
											</select></td>
										</tr>
										<tr class="" style="display: none;">
											<th scope="row">작성자</th>
											<td><input type="text"  class="form-control" id="writer" name="writer" readonly="readonly" value="${member.id}"></td>
										</tr>
										<tr>
										<td colspan="2" class="clear">
											<textarea class="form-control" rows="30" id="contents" name="contents"></textarea>
										</td>
										</tr>
									
									</tbody>
									
									
									<tbody>
										<tr class="">
											<th scope="row">비밀번호</th>
											<td><input id="password" name="sec_num" fw-filter="isFill" fw-label="비밀번호" fw-msg="" value=""
												type="password" /></td>
										</tr>
										<tr class="">
											<th scope="row">비밀글설정</th>
											<td><input id="secure0" name="secret" fw-filter="isFill"
												fw-label="비밀글설정" fw-msg="" value="N" type="radio"
												checked="checked" /><label for="secure0">공개글</label> <input
												id="secure1" name="secret" fw-filter="isFill"
												fw-label="비밀글설정" fw-msg="" value="Y" type="radio" /><label
												for="secure1">비밀글</label></td>
										</tr>
									</tbody>
								</table>
							</div>
							<div class="base_button ">
								<span class="gLeft"> 
								<a href="/board/qa/6/"><img src="../resources/images/button/btn_list.gif" alt="목록" /></a>
								</span> 
								<span class="gRight"><button type="submit" class="btn">
								<img src="../resources/images/button/btn_register.gif" alt="등록" /> </button>
								<a href="./faqList"><img src="../resources/images/button/btn_cancel.gif" alt="취소" /></a>
								</span>
							</div>
						</div>
					</form>
				</div>

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