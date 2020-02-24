<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link href="/mid/resources/css/adminCss/deliveryList.css" rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>배송관리 페이지</title>
</head>
<body>
	<c:import url="../../layout/header.jsp" />
	<div id="listcontentWrap2">
		<c:import url="../../admin/adminLeftList.jsp" />
		<div id="listcontent2">
			<div class=" board_listpackage">
				<div class="">
					<div class="titleArea">
						<h2>
							<font color="#555555">Delivery List</font>
						</h2>
					</div>
				</div>
				<div class="boardSort">
					<span class=""></span>
				</div>
	<div>	
	<select id="tracker">
		<option value="" selected="" disabled="" style="color:#ccc" data-v-72b15ce9="">택배사</option>
		<option data-v-72b15ce9="" value="de.dhl">DHL</option>
		<option data-v-72b15ce9="" value="kr.chunilps">천일택배</option>
		<option data-v-72b15ce9="" value="kr.cjlogistics">CJ대한통운</option>
		<option data-v-72b15ce9="" value="kr.cupost">CU 편의점택배</option>
		<option data-v-72b15ce9="" value="kr.cvsnet">GS Postbox 택배</option>
		<option data-v-72b15ce9="" value="kr.cway">CWAY (Woori Express)</option>
		<option data-v-72b15ce9="" value="kr.daesin">대신택배</option>
		<option data-v-72b15ce9="" value="kr.epost">우체국 택배</option>
		<option data-v-72b15ce9="" value="kr.hanips">한의사랑택배</option>
		<option data-v-72b15ce9="" value="kr.hanjin">한진택배</option>
		<option data-v-72b15ce9="" value="kr.hdexp">합동택배</option>
		<option data-v-72b15ce9="" value="kr.homepick">홈픽</option>
		<option data-v-72b15ce9="" value="kr.honamlogis">한서호남택배</option>
		<option data-v-72b15ce9="" value="kr.ilyanglogis">일양로지스</option>
		<option data-v-72b15ce9="" value="kr.kdexp">경동택배</option>
		<option data-v-72b15ce9="" value="kr.kunyoung">건영택배</option>
		<option data-v-72b15ce9="" value="kr.logen">로젠택배</option>
		<option data-v-72b15ce9="" value="kr.lotte">롯데택배</option>
		<option data-v-72b15ce9="" value="kr.slx">SLX</option>
		<option data-v-72b15ce9="" value="nl.tnt">TNT</option>
		<option data-v-72b15ce9="" value="un.upu.ems">EMS</option>
		<option data-v-72b15ce9="" value="us.fedex">Fedex</option>
		<option data-v-72b15ce9="" value="us.ups">UPS</option>
		<option data-v-72b15ce9="" value="us.usps">USPS</option>
	</select>
	<input id="trackCode" name="trackCode" type="number">
	<button id="butten1"><a id="btngo" href="" target="_blank">배송조회</a></button>
</div>
				<div class="base_table typeList gBorder">
					<table border="1" summary="">
						<caption></caption>
						<colgroup class="">
							<col style="width: 100px;"/>
							<col style="width: 100px;"/>
							<col style="width: 150px;" />
							<col style="width: 100px;"/>
							<col style="width: auto;" />
							<col style="width: 100px;" />
							<col style="width: 100px;" />
							<col style="width: 100px;" />
						</colgroup>
						<thead class="">
							<tr style="">
								<th scope="col">번호</th>
								<th scope="col">주문번호</th>
								<th scope="col">송장번호</th>
								<th scope="col">배송상태</th>
								<th scope="col">주소</th>
								<th scope="col">배송비 결제 여부(Y/N)</th>
								<th scope="col">수정</th>
								<th scope="col">삭제</th>
							</tr>
						</thead>
						<tbody class="center">
							<c:forEach items="${list}" var="dto" varStatus="st">
								<tr>
									<td class="th1">${dto.num}</td>
									<td class="th1">${dto.order_num}</td>
									<td class="th1">${dto.del_num}</td>
									<td class="th1">${dto.del_status}</td>
									<td class="th1">${dto.del_address}</td>
									<td class="th1">${dto.del_costpay}</td>
									<td class="th1"><a href="./deliveryUpdate?num=${dto.num}">정보 수정</a></td>
									<td class="th1"><a href="./deliveryDelete?num=${dto.num}">정보 삭제</a></td>
								</tr> 
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>

			<ul class="pagination paging">

				<li><span id="${pager.startNum-1}" style="cursor: pointer"
					class="list listimg"><img alt="뒤로"
						src="/mid/resources/images/page_prev.gif"></span></li>
				<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
					<li><span id="${i}" class="list listnum"
						style="cursor: pointer">${i}</span></li>
				</c:forEach>
				<c:if test="${pager.curBlock < pager.totalBlock}">
					<li><span id="${pager.lastNum+1}" style="cursor: pointer"
						class="list"><img alt="다음"
							src="/mid/resources/images/page_next.gif"></span></li>
				</c:if>
				<li><span id="${pager.lastNum}" style="cursor: pointer"
					class="list"><img alt="다음"
						src="/mid/resources/images/page_next.gif"></span></li>
			</ul>

			<form id="frm" action="./deliveryList">
				<div class="outsearch">
					<input type="hidden" value="1" id="curPage" name="curPage">
					<div class="form-group col-xs-2">
						<select name="kind" class="form-control searchop">
							<option id="kt" value="kt">주문번호</option>
							<option id="kw" value="kw">송장번호</option>
							<option id="kc" value="kc">주소</option>
							<option id="kd" value="kd">배송상태</option>
						</select> 
						<input type="text" class="form-control searchinp"
							placeholder="Search" name="search" value="${pager.search}">
						<button class="btn btn-primary" style="cursor: pointer"
							type="submit">
							<img alt="찾기버튼" src="/mid/resources/images/button/btn_find.gif">
						</button>
					</div>
				</div>
			</form>
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
		
		//배송조회
		 $('#butten1').click(function(){
		 console.log($("#tracker").val());
		 console.log($("#trackCode").val());
		 document.getElementById("btngo").setAttribute("href", "https://tracker.delivery/#/"+$("#tracker").val()+"/"+$("#trackCode").val());
	 
 });
	</script>
	<c:import url="../../layout/footer.jsp" />
</body>


</html>