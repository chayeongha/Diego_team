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
			<h1>Product Update Page</h1>
		</div>

			<!--한칸 띄우기 -->
			<br>
			
			

		<form action="productUpdate?pro_num=${product.pro_num}" method="post" id="frm" onsubmit="true">
			
			<input type="hidden" name="pro_num" value="${product.pro_num}">
			

			<div class="form-group">
			<label for="pro_num">Product Number:</label>
					<b>${product.pro_num} </b>
			</div>


			<div class="form-group">
			<label for="cat_ref">Category Number:</label>
					<b>${product.cat_ref} </b>
			</div>
					

		


			<div class="form-group">
				<label for="pro_name">Product Name:</label>
				 <input type="text"
					class="form-control" id="pro_name" name="pro_name"
					required="required" value="${product.pro_name}" >
			</div>

			<div class="form-group">
				<label for="pro_price">Product Price:</label> <input type="number"
					class="form-control" id="pro_price" name="pro_price"
					placeholder="Product Price Enter" value="${product.pro_price}">
			</div>

			<div class="form-group">
				<label for="pro_count">Product Count:</label> <input type="text"
					class="form-control" id="pro_count" name="pro_count"
					placeholder="Product Count Enter" value="${product.pro_count}">
			</div>

			<div class="form-group">
				<label for="pro_contents">Product Cotents:</label>
				<textarea type="text" id="pro_contents" name="contents" >${product.contents}</textarea>
			</div>

			<div class="form-group">
				<label for="pro_warning">Product Warning:</label>
				<textarea type="text" id="pro_warning" name="pro_warning" >${product.pro_warning}</textarea>
			</div>

			<div class="form-group">
				<label for="pro_size">Product Size:</label>
				<div>
					<select id="pro_size" name="pro_size" value="${product.pro_size}">
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
					class="form-control" value="${product.pro_color}">
			</div>

			<div class="form-group">
				<label for="pro_vital">Product Option:</label>
				<div>
					<input type="text" name="pro_vital" id="pro_vital"
						placeholder="Product Vital Enter" class="form-control" value="${product.pro_vital}">
				</div>
			</div>
			
			

			<br>





			<button class="btn btn-primary px-3">상품 수정</button>

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
		$("#pro_contents").summernote({
			height : 120,

		});

		$("#pro_warning").summernote({
			height : 120,

		});
		
	
	</script>