<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HOME</title>
<link href="resources/css/main.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>
<!--ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->

<c:import url="layout/header.jsp"/>

<!--ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->

<section style="width: 100%; height: 1319px;padding-bottom: 0; margin-top:74px;">
	<div style="width: 100%; height: 969px; background:url('resources/images/mainb_01.jpg');">
	</div>
</section>

<!--ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->

<section>
	<div style=" height: 1598px;" class="se-name">
		<h1 class="se-h1">BEST SELLER.</h1>
		<ul class="pro">
		
			
		
			
		
			
			<c:forEach items="${productList}" var="p" varStatus="v">	<!-- here!! -->
				<li class="pro-li">
				
					<c:if test="${v.count % 4 eq 0  }">
						<div class="pro-li-div_nm" onclick="goProSel(${p.pro_num })">
							<p class="pro-li-div-a"><img src="resources/product/images/${p.sumnale}"></p>
							<p class="pro-li-div-p">${p.pro_name }</p>
							<ul class="pro-li-div-ul">
								<li style="width: inherit; height: 36px; padding-bottom: 23px;">${p.contents}</li>
								<li style="color:#707070; height: 18px; display: inline-block;text-decoration: line-through;">${p.beforeSale}원</li>
								<li style="height: 18px; display: inline-block;">${p.pro_price}원</li>
							</ul>
						</div>
					</c:if> 
				
					<c:if test="${v.count % 4 ne 0 }">
						<div class="pro-li-div" onclick="goProSel(${p.pro_num })">
							<p class="pro-li-div-a"><img src="resources/product/images/${p.sumnale}"></p>
							<p class="pro-li-div-p">${p.pro_name }</p>
							<ul class="pro-li-div-ul">
								<li style="width: inherit; height: 36px; padding-bottom: 23px;">${p.contents}</li>
								<li style="color:#707070; height: 18px; display: inline-block;  text-decoration: line-through;">${p.beforeSale}원</li>
								<li style="height: 18px; display: inline-block; ">${p.pro_price}원</li>
							</ul>
						</div>
					</c:if>
				</li>
			</c:forEach>
		
		</ul>
	</div>
</section>

<!--ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->

<section>

	<div style="height: 1112.5px; background-color: white;" class="se-name">

	
		<h1 class="se-h1">GROOMING</h1>
			<ul>
				<li>
					<div class="grm-div" style="margin-right: 30px;">
						<p class="grm-div-a">
							<img alt="grm1" src="resources/images/skin01.jpg">
						</p>
						<h3 class="grm-div-h3">마르시오디에고 올인원 피부관리 솔루션</h3>
						<p class="grm-div-p">THE MAN PERFECTION SKIN BREW</p>
						<span class="grm-div-span" style="color: red">SPECIAL PRICE</span>
					</div>
				</li>
				<li>
					<div class="grm-div">
						<p class="grm-div-a">
							<img alt="grm1" src="resources/images/skin02.jpg">
						</p>
						<h3 class="grm-div-h3">머리부터 발끝까지 오직 남성만을 위한 올인원 바디워시</h3>
						<p class="grm-div-p">WASH OUT ALL IN ONE</p>
						<span class="grm-div-span" style="color: red">SPECIAL PRICE</span>
					</div>
				</li>
			</ul>
	</div>
</section>

<!--ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->

<section style="padding-bottom: 200px;">

<div class="sps-gift">

<img alt="grm1" src="resources/images/main_benefit.jpg" width="100%">

</div>


</section>

<!--ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->

<section style="height: auto; padding-bottom: 100px;">

	<div class="se-name"">
		<h1 class="se-h1">NEW PRODUCTS.</h1>
		<ul class="pro">
			<c:forEach items="${newPro}" var="np" varStatus="v">
				<li class="pro-li">
					<c:if test="${v.count % 4 eq 0  }">
						<div class="pro-li-div_nm" onclick="goProSel(${np.pro_num })">
							<p class="pro-li-div-a"><img src="resources/product/images/${np.sumnale}" ></p>
							<p class="pro-li-div-p">${np.pro_name }</p>
							<ul class="pro-li-div-ul">
								<li style="width: inherit; height: 36px; padding-bottom: 23px;">${np.contents}</li>
								<li style=" color:#707070; 18px; display: inline-block; text-decoration: line-through;">${np.beforeSale}원</li>
								<li style="height: 18px; display: inline-block; ">${np.pro_price}원</li>
							</ul> 
						</div>
					</c:if> 
					<c:if test="${v.count % 4 ne 0 }">
						<div class="pro-li-div"  onclick="goProSel(${np.pro_num })">
							<p class="pro-li-div-a"><img src="resources/product/images/${np.sumnale}"></p>
							<p class="pro-li-div-p">${np.pro_name }</p>
							<ul class="pro-li-div-ul">
								<li style="width: inherit; height: 36px; padding-bottom: 23px;">${np.contents}</li>
								<li style="color:#707070; height: 18px; display: inline-block;  text-decoration: line-through;">${np.beforeSale}원</li>
								<li style="height: 18px; display: inline-block; ">${np.pro_price}원</li>
							</ul>
						</div>
					</c:if>
				</li>
			</c:forEach>
		</ul>
	</div>
</section>

<!--ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->

<section style="margin-bottom: 250px; padding-bottom: 0;">
	<div class="add-join">

		<a href="#" style="text-decoration: none;">
			
			<div class="add-join-div">
				<h1 style="font-size: 28px; padding-bottom: 15px; color: white;" >마르시오디에고 신규 회원 혜택</h1>
				<p>오직 신규 회원에게만 드리는 혜택</p>
				<p>신규 회원 가입 시 즉시 사용할 수 있는</p>
				<p>2,000포인트를 지급합니다.</p>
			</div>
		</a>
	</div>

</section>

<!--ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->

<section style="padding-top: 350px; padding-bottom: 190px;">
<div class="ctg">
	<div class="ctg-div-cl">
		<div class="ctg-div-name">
		<h1>Clothing</h1>
		</div>
	</div>
	<div class="ctg-div-ac">
		<div class="ctg-div-name">
		<h1>Accessory</h1>
		</div>
	</div>
	<div class="ctg-div-nm">
		<div class="ctg-div-name">
		<h1>Grooming</h1>
		</div>
	</div>
</div>
</section>

<!--ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->


	<section style="margin: 0; padding: 0; height: 1000px;" id="revSec">
		<div>
			<div class="rev">
				<ul>
					<c:forEach items="${reviewList}" var="review" varStatus="r">
						<c:forEach items="${review.reviewVO}" var="rev" varStatus="f">

							<li class="rev-li">

								<p class="rev-li-img">
									<img
										src="resources/product/photoReview/${review.revFilesVO[f.index].fname}"
										style="width: 215px; height: 237px;">
								</p>

								<div class="rev-li-mem">
									<div class="rev-li-mem-tt">${rev.rev_contents}</div>
									<div class="rev-li-mem-nk">${review.sec_name}</div>
								</div>
								<div class="rev-li-info">
									<div class="rev-li-info-img">
										<p>
											<img src="resources/product/images/${review.pro_main}"
												style="width: 33px; height: 33px;">
										</p>
									</div>
									<div class="rev-li-info-div">
										<div class="rev-li-info-tt">${review.pro_name}</div>
										<div class="rev-li-info-fb">
											<span>리뷰<strong class="st">${review.totalReview}</strong></span>
											<span>평점<strong class="st">${review.totalStar}</strong></span>
										</div>
									</div>
								</div>
							</li>

						</c:forEach>
					</c:forEach>
				</ul>
			</div>
			<div class="rev-page"></div>

			<div>
				<div class="or-pager">
					<c:if test="${pager.curBlock gt 1 }">
						<button type="button" class="btn-pager" id="none-hover">
							<<</button>
					</c:if>
					<c:if test="${pager.curBlock ne 1 }">
						<button type="button" class="btn-pager" id="none-hover">
							<</button>
					</c:if>
					<c:forEach begin="${pager.startNum }" end="${pager.lastNum}"
						var="p">
						<c:choose>
							<c:when test="${pager.curPage eq p }">
								<button type="button" style="color: black; font-weight: bold;"
									title="${p }" class="btn-pager">${p }</button>
							</c:when>
							<c:otherwise>
								<button type="button" title="${p }" class="btn-pager">
									${p }</button>
							</c:otherwise>
						</c:choose>

					</c:forEach>
					<c:if test="${pager.curBlock lt pager.totalBlock }">
						<button type="button" class="btn-pager" id="none-hover">
							></button>
						<c:if test="${pager.totalBlock gt pager.curBlock+1 }">
							<button type="button" class="btn-pager" id="none-hover">
								>></button>
						</c:if>
					</c:if>
				</div>
				
			</div>

		</div>
	</section>

	<script type="text/javascript">
	$(".list").click(function() {
	$("#curPage").val($(this).attr("id"));
	$("#frm").submit();
	});
	
	function goProSel(d) {
		location.href = "product/productSelect?pro_num="+d;
	}
	


</script>
	<!--ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->



	<c:import url="layout/footer.jsp" />


</body>
</html>