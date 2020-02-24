<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../layout/bootStrap.jsp" />
<c:import url="../layout/summerNote.jsp"></c:import>
</head>
<body>
<c:import url="../layout/nav.jsp" />
	<div class="container">

		<div class="jumbotron page-header">
			<h1>Product Insert Page</h1>
		</div>


		<form action="productInsert" method="post" id="frm" onsubmit=true enctype="multipart/form-data" >
			<div class="form-group">
				<label for="cat_ref">Category Choice</label>
			</div>

			<div class="form-group">

				<select id="cloth">
					<option value="100">Leather</option>
					<option value="200">Cosmetic</option>
					<option value="300">Cloth</option>
					<option value="400">UnderWear</option>

				</select>
			</div>

			<div id="kind">
				<select name="cat_ref" id="kinds">
					<option value="101">wallet</option>
					<option value="102">bag</option>
				</select>
			</div>


			<!--한칸 띄우기 -->
			<br>

			<div class="form-group">
				<label for="pro_name">Product Name:</label> 
				<input type="text"
					class="form-control" id="pro_name" name="pro_name"
					placeholder="Product Name Enter">
			</div>

			<div class="form-group">
				<label for="pro_price">Product Price:</label> 
				<input type="number"
					class="form-control" id="pro_price" name="pro_price"
					placeholder="Product Price Enter">
			</div>

			<div class="form-group">
				<label for="pro_count">Product Count:</label> 
				<input type="text"
					class="form-control" id="pro_count" name="pro_count"
					placeholder="Product Count Enter">
			</div>
			

			<div class="form-group">
				<label for="pro_contents">Product Cotents:</label>
				<textarea type="text" id="contents" name="contents">입력하시오.</textarea>
			</div>

			<div class="form-group">
				<label for="pro_warning">Product Warning:</label>
				<textarea type="text" id="pro_warning" name="pro_warning">입력하시오.</textarea>
			</div>

			<div class="form-group">
				<label for="pro_size">Product Size:</label>
				<div>
					<select id="pro_size" name="pro_size">
						<option value="">선택하세요</option>
						<option value="Small">S</option>
						<option value="Medium">M</option>
						<option value="Large">L</option>
						<option value="XLarge">XL</option>
					</select>
				</div>
			</div>

			<div class="form-group">
				<label for="pro_color">Product Color:</label> <input type="text"
					name="pro_color" id="pro_color" placeholder="Product Color Enter"
					class="form-control">
			</div>

			<div class="form-group">
				<label for="pro_vital">Product Option:</label>
				<div>
					<input type="text" name="pro_vital" id="pro_vital"
						placeholder="Product Vital Enter" class="form-control">
				</div>
			</div>

			<div id="imagesfiles">

				<label for="pro_main">Product Main Images:</label>
				<div>
					<input type="file" class="form-control " id="pro_main" name="imagesFiles">
				</div>

				<label for="sumnale">Product Sumnale Images:</label>
				<div>
					<input type="file" class="form-control " id="sumnale" name="imagesFiles">
<!--ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ상품사진히든인풋 -->
					<input type="hidden" name="pro_image" value="-" >
				</div>

				<label for="front">Product Front Images:</label>
				<div>
					<input type="file" class="form-control " id="front" name="imagesFiles">
				</div>

				<label for="back">Product Back Images:</label>
				<div>
					<input type="file" class="form-control " id="back" name="imagesFiles">
				</div>

				<label for="pro_model">Product Model Images:</label>
				<div>
					<input type="file" class="form-control " id="pro_model" name="imagesFiles">
				</div>

				<label for="pro_full">Product Full Images:</label>
				<div>
					<input type="file" class="form-control " id="pro_full" name="imagesFiles">
				</div>

				<label for="gif">Product Gif Images:</label>
				<div>
					<input type="file" class="form-control " id="gif" name="imagesFiles">
				</div>

				<label for="pro_info">Product Info Images:</label>
				<div>
					<input type="file" class="form-control " id="pro_info" name="imagesFiles">
				</div>

				<label for="pro_size">Product Size Images:</label>
				<div>
					<input type="file" class="form-control " id="pro_sizecut" name="imagesFiles">
				</div>
			</div>

			<br>
			<div>
				<button class="btn btn-primary px-3">상품 추가</button>
			</div>

		</form>
	</div>



	<script type="text/javascript">
	<!------------------------------ AJAX 자바스크립트방식 ----------------------- -->
		var options = $('#options').html();
		$('options').empty();
		var count = 0;

		//카테고리 ajax
		$("#cloth").change(function() {

			//1. XMLHttpRequest 객체 생성
			var xmlhttp;

			if (window.XMLHttpRequest) {
				xmlhttp = new XMLHttpRequest();
			} else {
				xmlhttp = new ActiveXObject("Microsoft.XMLHTTP")
			}

			//2. 요청 정보 작성	
			xmlhttp.open("GET", "./selectCloth?kind=" + $("#cloth").val());

			//3. 요청 전송
			xmlhttp.send();

			//4. 결과 처리
			xmlhttp.onreadystatechange = function() {

				if (this.readyState == 4 && this.status == 200) {
					$('#kind').html(this.responseText);
				}

			}

		});

		//섬머노트
		$("#contents").summernote({
			height : 120,

		});

		$("#pro_warning").summernote({
			height : 120,

		});
		
	
	</script>

</body>
</html>