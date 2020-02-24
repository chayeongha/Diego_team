<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../resources/css/productCss/productSelect.css"
	rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<!--ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->
<c:import url="../layout/bootStrap.jsp" />
<c:import url="../layout/header.jsp" />

<!--ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->


<body>
	<c:import url="../layout/nav.jsp" />
	<div class="container">
	
		<div class="form-group">
			
			<p>${product.pro_name}</p>
		</div>
		<div class="form-group">
			<p >${product.contents}</p>
		</div>
		
		<div class="form-group">
			<p style="text-decoration: line-through;">${product.beforeSale}원</p>
		</div>

		<div class="form-group">
			<b>${product.pro_price}원</b>
		</div>


		<div>
			<c:forEach items="${product.images}" var="image">
				<div>
					
					<br> 
					<img src="../resources/product/images/${image.pro_main}">

				</div>
				
				<div class="form-group">
					<br> 
					<h2>${totalCount}개리뷰 평점 : ${product.totalStar}</h2>
				</div>
				
				<!--~~~~~~~~~~리뷰~~~~~~~~~~~  -->		
			<div class="container">
				<form action="./productReview" method="post"
					enctype="multipart/form-data">

					<div class="form-group">
						<input type="text" value="${member.id}" name="id"
							readonly="readonly" id="review_id"> 
						<input type="hidden"
							value="${product.pro_num}" name="pro_num" id="review_pronum">
						<input type="hidden" value="${member.name}" name="name" id="review_name"> 
						<input type="hidden" value="0"
							name="help" id="review_help"> 
						<label for="contents">Review</label>
						<a href="../review/reviewList" class="btn btn-info">후기게시판</a>
						<textarea class="form-control" rows="10" id="rev_contents"
							name="rev_contents"></textarea>
						<br>

						<div id="filebox">
							<div class="form-group" title="parent">
								<label for="reviewImages">+ 사진추가</label>
								<div class="col-sm-9">
									<input type="file" id="reviewImages" name="file">
								</div>
								<div class="col-sm-1">
									<input type="button"
										class="form-control btn btn-danger del_file" value="삭제">
								</div>
							</div>
						</div>

						<input type="button" value="add file" class="btn btn-primary"
							id="add_file">

						<div class="container">
							<select name="star" id="review_star">
								<option value="5">★★★★★ 아주 좋아요</option>
								<option value="4">★★★★☆ 맘에 들어요</option>
								<option value="3">★★★☆☆ 보통이에요</option>
								<option value="2">★★☆☆☆ 그냥 그래요</option>
								<option value="1">★☆☆☆☆ 별로에요</option>
							</select>
						</div>
						<div>
							<button class="btn btn-primary rwrite" id="review_write">ⓥ
								리뷰 등록하기</button>
						</div>
					</div>

				</form>


			</div>
				
		<!--~~~~~~~~~~리뷰~~~~~~~~~~~  -->		
			<hr>
		<!--선택된상품의 리뷰리스트 -->
			<div class="reviewList">
				<h4>
					<b>추천순 리뷰(<span>${totalCount}</span>)개
					</b>
				</h4>
				
				<br>



				<c:forEach items="${reviewList}" var="rev">
					<input type="hidden" id="rev_num" value="${rev.rev_num}">

					<p>작성자 ${product.sec_name}</p>
					<p>
						<c:forEach begin="0" end="${rev.star-1}">★</c:forEach>
						<c:choose>
							<c:when test="${rev.star eq 5}">아주 좋아요</c:when>
							<c:when test="${rev.star eq 4}">맘에 들어요</c:when>
							<c:when test="${rev.star eq 3}">보통이에요</c:when>
							<c:when test="${rev.star eq 2}">그냥 그래요</c:when>
							<c:when test="${rev.star eq 1}">별로에요</c:when>
						</c:choose>
					</p>
					
					
					<p>${rev.rev_contents}</p>
					<c:forEach items="${rev.files }" var="ref">
						<p>
							<img src="../resources/product/photoReview/${ref.fname }"
								style="width: 100px; height: 100px;">
						</p>

					</c:forEach>


					<%-- 					<p>리뷰도움: ${rev.help}</p> --%>
					<!-- 					<input type="button" class="btn-primary" value="좋아요" > -->
					<!-- 					<input type="button" class="btn-danger" value="싫어요" > -->

					<button type="button" class="btn btn-warning rdel">삭제</button>

					<a href="./reviewUpdate?rev_num=${rev.rev_num}"
						class="btn btn-info rupdate">수정</a>
					<hr>
				</c:forEach>



				<div>
					<ul class="pagination">
						<c:if test="${pager.curBlock gt 1}">
							<li><span id="${pager.startNum-1}" class="list">이전</span></li>
						</c:if>
						<c:forEach begin="${pager.startNum}" end="${pager.lastNum}"
							var="i">
							<li><span id="${i}" class="list">${i}</span></li>
						</c:forEach>
						<c:if test="${pager.curBlock lt pager.totalBlock}">
							<li><span id="${pager.lastNum+1}" class="list">다음</span></li>
						</c:if>
					</ul>
				</div>

			</div>
	
		<!--선택된상품의 리뷰리스트 -->
				<div>
					
					 <br> 
					<img src="../resources/product/images/${image.front}">

				</div>
				<div>
					
				<br>
			<div class="iback">
				<iframe width="594" height="334"
					src="https://www.youtube.com/embed/Nmv9OyqOO7Y?autoplay=1" frameborder="0"
					allow="autoplay; encrypted-media" allowfullscreen ></iframe>
			</div>
				
					
					 <br>
					 <img src="../resources/product/images/${image.back}">

				</div>
				
				<div>
					
					 <br> 
					 <img src="../resources/product/images/${image.pro_model}">

				</div>

			
			</c:forEach>

			
			<br>
			<hr>

			

		</div>
		<a href="../qna/qnaWrite?pro_num=${product.pro_num}"
			class="btn btn-primary">QNA WRITE</a> <a
			href="./productUpdate?pro_num=${product.pro_num}"
			class="btn btn-primary">Update</a> <a
			href="./productList?pro_num=${product.pro_num}"
			class="btn btn-default">List</a>
	</div>

	<script type="text/javascript">
		var filebox = $('#filebox').html();
		$('#filebox').empty();
		var count = 0;
		var index = 0;

		$('#add_file').click(function() {
			if (count < 4) {
				$('#filebox').append(filebox);
				count++;
			} else {
				alert("리뷰 사진은 최대  4장까지 첨부가능합니다 ");

			}

		});

		$("#filebox").on("click", ".del_file", function() {

			$(this).parent().parent().remove();
			count--;
		});

		//페이징리스트
		$(".list").click(function() {
			$("#curPage").val($(this).attr("id"));
			$("#frm").submit();
		});

		//----------------------------------------------------------------------------------------------------------------------------------		
		//리뷰삭제
		$(".rdel").click(function() {
			if (confirm("삭제하시겠습니까?")) {
				$.ajax({
					type : "GET",
					url : "reviewDelete",
					data : {

						rev_num : $("#rev_num").val()

					},
					success : function(data) {
						data = data.trim();
						if (data == 1) {
							alert("저장된 리뷰가 완벽히 삭제되었습니다.")
							location.reload();
						} else {
							alert("저장된 리뷰가 삭제되지 않았습니다.")

						}

					}

				});
			}
		});


		$("#pro-cart-btn").click(function() {
			var id = "${member.id}";
			var pro_num = $(this).val();

			if (confirm("장바구니에 담으시겠습니까?")) {
				$
						.ajax({
							type : "POST",
							url : "../member/memberManage/cartAjaxInsert",
							data : {
								id : id,
								pro_num : pro_num
							},
							success : function(d) {
								d = d.trim();
								if (d == 1) {
									if (confirm("장바구니에 담겼습니다. 장바구니로 이동하시겠습니까?")) {
										location.href = "../member/memberManage/cartList";
									}
								} else {
									alert("이미 담겨 있습니다.");
								}
							}
						});
			}
		});
	</script>

	<c:import url="../layout/footer.jsp" />
</body>
</html>