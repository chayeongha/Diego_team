<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link href="../resources/css/adminCss/proManageList.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>제품관리 페이지</title>
</head>
<body> 

<c:import url="../layout/header.jsp" />
	<div id="listcontentWrap2">
		<c:import url="../admin/adminLeftList.jsp" />
		<div id="listcontent2">
			<div class=" board_listpackage">
				<div class="">
					<div class="titleArea">
						<h2>
							<font color="555555"><a href="./proManageList" >Product List</a></font>
						</h2>
					</div> 
				</div>
				<div class="boardSort">
					<span class=""></span>
				</div>
				<div class="faqMenu">
					<div class="form-group" id="catat">
						<label for="cat_ref">Category</label>
					</div>

					<div class="form-group" id="outcloth">

						<select id="select1">
							<option value="">선택하세요</option>
							<option value="0">All</option>
							<option value="100">Leather</option>
							<option value="200">Cosmetic</option>
							<option value="300">Cloth</option>
							<option value="400">UnderWear</option>

						</select>
					</div>

					<div id="kind">
						<select name="cat_ref" id="kinds">
						</select> 
					</div>
					<form id="frm" action="./proManageList">
						<div class="outsearch">
							<input type="hidden" value="1" id="curPage" name="curPage">
							<div class="form-group col-xs-2">
								<select name="kind" class="form-control searchop">
									<option id="kt" value="kt">Title</option>
									<option id="kc" value="kc">Contents</option>
								</select> 
								<span class="inputbox">
								<input type="text" class="form-control searchinp"
									placeholder="Search" name="search" value="${pager.search}">
								<button class="btn btn-primary" style="cursor: pointer"
									type="submit">
									<img alt="찾기버튼" src="../resources/images/button/board_search_btn.png">
								</button>
								</span>
							</div>
						</div>
					</form>
				</div>
				<div class="base_table typeList gBorder">
					<table id="protable" border="1" summary="">
						<caption></caption>
						<colgroup class="">
							<col style="width: 80px;" />
							<col style="width: 80px;" />
							<col style="width: 84px;" />
							<col style="width: 100px;" />
							<col style="width: auto;" />
							<col style="width: 100px;" />
							<col style="width: 100px;" />
							<col style="width: 100px;" />
							<col style="width: 100px;" />
							<col style="width: 80px;" />


						</colgroup>
						<thead class="">
						<tr> <th></th>
								<th class="lala" scope="col"></th>
								<th class="lala" scope="col"></th>
								<th class="lala" scope="col"></th>
								<th class="lala" scope="col"></th>
								<th class="lala" scope="col"></th>
								<th class="lala" scope="col"></th>
								<th class="lala" scope="col"></th>
								<th class="lala" scope="col"></th>
								<th class="lala" scope="col"></th></tr>
							<tr class="info">
								<th><input type="checkbox" id="checkAll"></th>
								<th scope="col">제품번호</th>
								<th scope="col">카테고리</th>
								<th scope="col">메인이미지</th>
								<th scope="col">제품명</th>
								<th scope="col">가격</th>
								<th scope="col">재고</th>
								<th scope="col">판매량</th>
								<th scope="col">등록날짜</th>
								<th scope="col">MANAGE</th>

							</tr>
						</thead>
						<tbody class="center">
							<c:forEach items="${list}" var="dto" varStatus="st">
								<tr class="warning">
									<td><input type="checkbox" class="productCheck product${st.index}" name="pro_num" value="${dto.pro_num}"></td>
									<td class="th1">${dto.pro_num}</td>
									<td class="th1">${dto.categoryVO.cat_name}</td>
									<td class="th1"><img alt="메인이미지"
										src="../resources/product/images/${dto.imagesVO.pro_main}"></td>
									<td class="th1">${dto.pro_name}</td>
									<td class="th1">${dto.pro_price}</td>
									<td class="th1">${dto.pro_count}</td>
									<td class="th1">${dto.pro_sale}</td>
									<td class="th1">${dto.pro_date}</td>
									<td class="th1"><a
										href="../product/productUpdate?pro_num=${dto.pro_num}">상품
											수정</a></td>

								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div> 
			</div>
			<%-- <div class="typeBG">
					<c:if test="${admin ne null}">
					<span class="gRight">
						<button class="btn btn-primary"  onclick="location.href='../product/productInsert' ">상품 등록</button>
						<button class="btn btn-danger" type="button" data-delete="${dto.pro_num}" id="pro_del">상품 삭제</button>
					</span>
					</c:if>
				</div>

			<ul class="pagination paging">

				<li><span id="${pager.startNum-1}" style="cursor: pointer"
					class="list listimg"><img alt="뒤로"
						src="../resources/images/page_prev.gif"></span></li>
				<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
					<li><span id="${i}" class="list listnum"
						style="cursor: pointer">${i}</span></li>
				</c:forEach>
				<c:if test="${pager.curBlock < pager.totalBlock}">
					<li><span id="${pager.lastNum+1}" style="cursor: pointer"
						class="list"><img alt="다음"
							src="../resources/images/page_next.gif"></span></li>
				</c:if>
				<li><span id="${pager.lastNum}" style="cursor: pointer"
					class="list"><img alt="다음"
						src="../resources/images/page_next.gif"></span></li>
			</ul>
 --%>
		</div>
	</div>
		<script type="text/javascript">
		var kind = '${pager.kind}';
		if (kind == '') {
			kind = "kt";
		}
		$("#" + kind).prop("selected", true);
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
			for(var st=0; st<${list.size()}; st++){
				if($('.product'+st).prop("checked")==true){
					all++;
				}
			}
			if(all==${list.size()}){
				$('#checkAll').prop("checked","true");
				check= true;
			}else{
				$('#checkAll').prop("checked","");
				check=false;
			}
		});
	 	
	 	$('.product'+'st').click(function() {
			alert("adad");
		});
	 	
	 	//체크한거 삭제
	 	 $("#pro_del").click(function(){
			   jQuery.ajaxSettings.traditional = true;
			   for(var st =0; st<${list.size()}; st++){
		 			
		 			var num= new Array();
		 			var index=0;
		 			for( var st=0; st<${list.size()}; st++){
		 				
		 				if($('.product'+st).prop("checked")==true){
		 					num[index] = $('.product'+st).val();
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
	 	
	 	<!------------------------------ AJAX 자바스크립트방식 ------------------------->
	 	var options = $('#options').html();
		$('options').empty();
		var count = 0;

		//카테고리 ajax
		$("#select1").change(function() {

			//1. XMLHttpRequest 객체 생성
			var xmlhttp;
 
			if (window.XMLHttpRequest) {
				xmlhttp = new XMLHttpRequest();
			} else {
				xmlhttp = new ActiveXObject("Microsoft.XMLHTTP")
			}

			//2. 요청 정보 작성	
			xmlhttp.open("GET", "../product/selectCloth2?kind=" + $("#select1").val());

			//3. 요청 전송
			xmlhttp.send();

			//4. 결과 처리
			xmlhttp.onreadystatechange = function() {

				if (this.readyState == 4 && this.status == 200) {
					$('#kind').html(this.responseText);
				}

			}  

		});
	</script>
	<c:import url="../layout/footer.jsp" />
</body>


</body>
</html>