<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../layout/bootStrap.jsp" />
</head>
<body>

		<div class="container">
				<form action="./reviewUpdate" method="post"  enctype="multipart/form-data"> 
					
					<div class="form-group">
						<input type="text" value="${review.id}" name="id" readonly="readonly" id="review_id">
						<input type="text" value="${review.rev_num}" name="rev_num" id="review_revnum">
						<input type="text" value="${review.name}" name="name" id="review_name">
						<input type="text" value="${review.help }" name="help" id="review_help"> 
						
						<div>
						<label for="contents">Review</label> 
					
						<textarea class="form-control" rows="10" id="rev_contents"name="rev_contents" ></textarea>
						
						</div>
						<br>
						
						<div id="filebox">
							<div class="form-group" title="parent" >
									<label for="reviewImages">+ 사진추가</label> 
									<div class="col-sm-9">
										<input type="file" id="reviewImages" name="file"> 
									</div>
									<div class="col-sm-1">
										<input type="button" class="form-control btn btn-danger del_file" value="삭제">
									</div>
							</div>						
						</div>
						
						<input type="button" value="add file" class="btn btn-primary" id="add_file">
						
						<div class="container">
							<select name="star" id="review_star">
								<option value="5">★★★★★  아주 좋아요</option>
								<option value="4">★★★★☆  맘에 들어요</option>
								<option value="3">★★★☆☆  보통이에요</option>
								<option value="2">★★☆☆☆  그냥 그래요</option>
								<option value="1">★☆☆☆☆  별로에요</option>
							</select>
						</div>
							<div>
								<button class="btn btn-primary rwrite" id="review_write">ⓥ 리뷰 등록하기</button>
							</div>
					</div>
				
		</form>


			</div>

<script type="text/javascript">
var filebox= $('#filebox').html();
$('#filebox').empty();
var count =0;
var index=0;

$('#add_file').click(function() {
	if(count<4){
	$('#filebox').append(filebox);
	count++;
	}else{
		alert("리뷰 사진은 최대  4장까지 첨부가능합니다 ");
		
	}
	
});

$("#filebox").on("click", ".del_file",function(){
	
	$(this).parent().parent().remove();
	count--;
});




</script>


</body>
</html>