<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="/mid/resources/css/leftList.css" rel="stylesheet">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

		<div id="left">
			<div id="leftmenuwrap">
				<div id="leftmenu">
					<div id="leftinner">


						<ul>
							<li class="title">관리자 메뉴</li>
							<li class="sub"><a href="/mid/admin/memberList">회원관리</a></li>
							<li class="sub"><a href="/mid/admin/delivery/deliveryList">배송관리</a></li>
							<li class="sub"><a href="/mid/admin/proManageList">상품관리</a></li>

						</ul>
						<ul>
							<li class="title"><a href="">Board</a></li>
							<li class="sub"><a href="/mid/notice/noticeList">Notice</a></li>
							<li class="sub"><a href="/mid/faq/faqList">FAQ</a></li>
							<li class="sub"><a href="/mid/admin/qnaList">Q&A</a></li>
							<li class="sub"><a href="/mid/review/reviewList">Review</a></li>
						</ul>
						<ul>
							<li class="title">My page</li>
							<li class="sub "><a href="/mid/admin/adminUpdate">관리자정보 수정</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		
		<script>
		$(window).on("scroll", function() {
			if ($(window).scrollTop() > 100) {
				$("#leftmenu").addClass("fixmenu2")
			} else {
				$("#leftmenu").removeClass("fixmenu2")
			}
		});
		</script>
</html>
