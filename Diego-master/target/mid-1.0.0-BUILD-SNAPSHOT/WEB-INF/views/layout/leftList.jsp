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
							<li class="title">Community</li>
							<li class="sub"><a href="/mid/notice/noticeList">Notice</a></li>
							<li class="sub"><a href="/mid/faq/faqList">FAQ</a></li>
							<li class="sub"><a href="/mid/admin/qnaList">Q&A</a></li>
							<li class="sub"><a href="/mid/review/reviewList">Review</a></li>
						</ul>
						<ul>
							<li class="title"><a href="">Event</a></li>
						</ul>
						<ul>
							<li class="title">My page</li>
							<li class="sub "><a href="/mid/member/memberManage/orderMyList">Order</a></li>
							<li class="sub "><a href="/mid/member/memberManage/wishListSelectList">Wish list</a></li>
							<li class="sub "><a href="/mid/member/memberManage/pointMyList">Mileage</a></li>
							<li class="sub "><a href="">My board</a></li>
							<li class="sub"><a href="#" style="cursor: pointer">Delivery</a></li>
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
