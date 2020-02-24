<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>Product List</title>
<c:import url="../layout/bootStrap.jsp" />
</head>
<body>
	<c:import url="../layout/header.jsp" />
	<div class="container">
		<c:import url="../layout/leftList.jsp" />
		
		
		<div class="page-header" style="margin-top: 100px">
			<h1>Product List</h1>
		</div>
		
		<table class="table"  >
			<thead >
				<tr>
					
					<th><input type="checkbox" id="checkAll"></th>
					<th>ProNum</th>
					<th>Category</th>
					<th>Image</th>
					<th>Product Name</th>
					<th>Price</th>
					<th>Count</th>
					<th>Sales</th>
					<th>Contents</th>
					<th>Warning</th>
					<th>Color</th>
					<th>Size</th>
					<th>Option</th>
					<th>Date</th>
					<th>Update</th>
				</tr>

			</thead>

			<tbody>

				<c:forEach items="${productList}" var="product" varStatus="p">
					<tr class=>
						<td><input type="checkbox" class="productCheck product${p.index }" value="${product.pro_num }"></td>
						<td>${product.pro_num}</td>
						<td>${product.cat_ref}</td>
					
						<td><img src="../resources/product/images/${product.sumnale}"style= height:22%;"></td>
						
						<td><a href="./productSelect?pro_num=${product.pro_num}"> ${product.pro_name}</a></td>
						<td>${product.pro_price}</td>
						<td>${product.pro_count}</td>
						<td>${product.pro_sale}</td>
						<td>${product.contents}</td>
						<td>${product.pro_warning}</td>
						<td>${product.pro_color}</td>
						<td>${product.pro_size}</td>
						<td>${product.pro_vital}</td>
						<td>${product.pro_date}</td>
						<td><a href="./productUpdate?pro_num=${product.pro_num}"><input type="button" value="정보 수정" ></a>
							
							<c:if test="${!empty member }">
							<button class="insert-wishList" value="${product.pro_num }">관심상품</button>
							</c:if>
						</td>
					</tr>

				</c:forEach>

			</tbody>
		</table>

		<div >
			<form action="./productList" id="frm">
				<input type="hidden" id="curPage" value="1" name="curPage">
				<select id="kind" name="kind">
					<option id="kt" value="kt">Category</option>
					<option id="kw" value="kw">Product Name</option>
					<option id="kc" value="kc">Price</option>
				</select> 
				
				<input type="text" id="search" name="search" value="${pager.search}">
				
				<button>검색</button>
			</form>
		</div>

		<div >
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
				
			
					<button class="btn btn-primary" onclick="location.href='./productInsert' ">상품 등록</button>
				
				
					<button class="btn btn-danger" id="pro_del">상품 삭제</button>
				
	</div>
	<script type="text/javascript">
	  
		//서치
		var kind = '${pager.kind}'
		if(kind == ''){
			kind = "kt";
		}
		
		$("#"+kind).prop("selected", true);
	 	
		//페이징리스트
		$(".list").click(function() {
			$("#curPage").val($(this).attr("id"));
			$("#frm").submit();
		});
	 	
	 	//all체크눌렀을 때 모든것이 체크
	 	var check= false;
	 	$('#checkAll').click(function() {
	 		if(check == false){
	 			$('.productCheck').prop("checked","true");
	 			check=true;
	 		}else{
	 			$('.productCheck').prop("checked","");
	 			check=false;
	 		}
			
		});
	 	
	 	//하나라도 체크안되면 all체크에서 체크가해제됨.
	 	$('.productCheck').click(function() {
			var all=0;
			for(var p=0; p<${productList.size()}; p++){
				if($('.product'+p).prop("checked")==true){
					all++;
				}
			}
			if(all==${productList.size()}){
				$('#checkAll').prop("checked","true");
				check= true;
				
			}else{
				$('#checkAll').prop("checked","");
				check=false;
			}
			
			
		});
	 	
	 	//체크한거 삭제
	 	$('#pro_del').click(function() {
			
	 		jQuery.ajaxSettings.traditional = true;
	 		
	 		for(var p =0; p<${productList.size()}; p++){
	 			
	 			var num= new Array();
	 			var index=0;
	 			for( var p=0; p<${productList.size()}; p++){
	 				
	 				if($('.product'+p).prop("checked")==true){
	 					num[index] = $('.product'+p).val();
	 					index++;
	 				}
	 				
	 			}
	 			
	 		}
	 		
	 		$.ajax({
	 			type : "POST",
	 			url : "productDelete",
	 			data: {
	 				
	 				num : num
	 				
	 			},
	 			success	: function(data) {
					if (data == 1) {
						location.reload();
						}else{
							alert("다시 시도하세요.")
						}
				}
	 			
	 			
	 			
	 		});
	 		
	 		
		});
	 	
	 	$(".insert-wishList").click(function() {
				if (confirm("관심상품으로 등록하시겠습니까?")) {
					var id = "${member.id}";
					var pro_num = $(this).val();
					
					$.ajax({
						type	: "POST",
						url		: "../member/memberManage/wishAjaxInsert",
						data	: {
							id : id,
							pro_num	:	pro_num
						},
						success	: function(d) {
							d = d.trim();
							
							if (d == 1) {
								alert("추가되었습니다.");
							}else{
								alert("이미 등록되어 있습니다.");
							}
						}
					});
				}
			
		});
	 	
	  </script>





<c:import url="../layout/footer.jsp" />

</body>
</html>