<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html>
<html>
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>Review List</title>
	<style type="text/css">
			.modal-content{
					
					width: 1057px;
					height: 769px;
			}
			
			.
	
	
	</style>
<c:import url="../layout/bootStrap.jsp" />
</head>
<body>
	<c:import url="../layout/header.jsp" />
	<div class="container">
		<c:import url="../layout/leftList.jsp" />
		<div class="jumbotron page-header">

			<h1>Review List</h1>
		</div>


		<c:forEach items="${reviewList}" var="review" varStatus="status">
			
			<p><img src="../resources/product/images/${review.pro_main}"	style="width: 70%; height: 20%;"></p>
			
			<br>
			<p>상품명: ${review.pro_name}</p>
			<p>가격: ${review.pro_price}원</p>
			<p>상품넘버: ${review.pro_num}</p>
			<p>평균평점: <b style="font-size: 20px">${review.totalStar}</b></p>
			<p><b style="color: blue">${review.totalReview}</b>개의 리뷰</p>
			<hr>
			
			<c:forEach items="${review.reviewVO}" var="rev" varStatus="status" begin="0" end="2" step="1">
			
<%-- 				<p>${review.revFilesVO[status.index].fname}</p> --%>
			
				<c:forEach items="${review.revFilesVO}" var="ref" varStatus="status2" >
						
						<c:if test="${rev.rev_num eq ref.rev_num and ref.fnum ne 0}" >
							
							<a href="./selectReview?rev_num=${ref.rev_num}"><img src="../resources/product/photoReview/${ref.fname}" style="width: 70px; height: 70px;"></a>
							
						</c:if>				
				</c:forEach>
			
			
				
				<a href="./selectReview?rev_num=${rev.rev_num}"><p style="color: red;">${rev.rev_contents}</p></a>
				
				<!-- Modal -->
  				<div class="modal fade" id="modalReview" role="dialog">
    				<div class="modal-dialog modal-lg">
      					<div class="modal-content">
        					<div class="modal-header">
          							<button type="button" class="close" data-dismiss="modal">&times;</button>
          							<h4 class="modal-title">Modal Header</h4>
        					</div>
        					<div class="modal-body">
          						 <div class="form-group">
		 								<label for="reviewImage" class="control-label">이미지:</label>
		    							<img id="reviewImage" alt="" src="">
		  						</div>
		  
		  						<div class="form-group">
		 	   							<label for="reviewMessage" class="control-label">Message:</label>
		    							<textarea class="form-control" id="reviewMessage"></textarea>
		  						</div>
          							
          							
        					</div>
        				<div class="modal-footer">
          							<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        				</div>
      					</div>
    				</div>
  				</div>
			
		
				<hr>
				
			</c:forEach>

			

		</c:forEach>






		<div>
			<form action="./reviewList" id="frm">
				<input type="hidden" id="curPage" value="1" name="curPage">
				<select id="kind" name="kind">
					<option id="kt" value="kt">작성자</option>
					<option id="kw" value="kw">제목</option>
					<option id="kc" value="kc">내용</option>
				</select> <input type="text" id="search" name="search"
					value="${pager.search}">

				<button>찾기</button>
			</form>
		</div>

		<div>
			<ul class="pagination">
				<c:if test="${pager.curBlock gt 1}">
					<li><span id="${pager.startNum-1}" class="list">이전</span></li>
				</c:if>
				<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
					<li><span id="${i}" class="list">${i}</span></li>
				</c:forEach>
				<c:if test="${pager.curBlock lt pager.totalBlock}">
					<li><span id="${pager.lastNum+1}" class="list">다음</span></li>
				</c:if>
			</ul>
		</div>


	</div>

	

	<script type="text/javascript">
		//서치	
		var kind = '${pager.kind}'
		if (kind == '') {
			kind = "kt";
		}
		$("#" + kind).prop("selected", true);

		//페이징리스트
		$(".list").click(function() {
			$("#curPage").val($(this).attr("id"));
			$("#frm").submit();
		});
	</script>

	<c:import url="../layout/footer.jsp" />
</body>
</html>