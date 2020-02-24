<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width"/>
<link href="/mid/resources/css/footer.css" rel="stylesheet">
<title>Insert title here</title>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
</head>
<body>
	<footer class="footer">
		<div class="footer_con">
			<div class="foot_inner">
				<div class="copypadding">
					<div class="footer_logo">
						<a>MARCIO DIEGO</a>
					</div>
				</div>
				<div id="center" class="copypadding">
					<div id="customer">
						<ul>
							<li>070-0000-0000</li>
							<li>Opening hours. am10-pm5</li>
							<li>Lunch break. pm12:30-pm2</li>
							<li>Sat, Sun Off</li>
						</ul>
					</div>
				</div>
				 
				 <!-- 검색 -->
				<div id="topsearch">
					<div class="search-bar">
						<form id="searchBarForm" name=""
							action="/mid/prosearch/prosearchList" method="get" target="_self"
							enctype="multipart/form-data">
							<select name="kind" class="form-control searchop"
								style="display: none;">
								<option id="kw" value="kw">product</option>
							</select>
							<div class="">
								<fieldset id="search_fieldset">
									<input id="keyword" name="search" class="inputTypeText"
										value="" type="text" />
									<button class="btn btn-primary" style="cursor: pointer"
										type="submit">
										<img src="/mid/resources/images/button/button_search_wh.png" />
									</button>
								</fieldset>
							</div>
						</form>
					</div>
				</div>
				<div id="company" class="copypadding">
					<ul>
						<li class="copytext">"1"</li>
						<li class="copytext">"2"</li>
						<li class="copytext">"3"</li>
						<li class="copytext">"4"</li>
						<li class="copytext">"5"</li>
						<br>
						<li class="copytext">"2"</li>
						<li class="copytext">"123"</li>
						<li class="copytext">"123"</li>
						<li class="copytext">"34"</li>
						<li class="copytext">"556"</li>
					</ul>
				</div>
				<div id="link" class="copypadding">
					<ul>
						<li><a>Company</a></li>
						<li><a>Agreement</a></li>
						<li><a>Privacy policy</a></li>
						<li><a>Site guide</a></li>
					</ul>
				</div>
			</div>
		</div>
	</footer>
	<div class="kakao_talk"><a href="javascript:void chatChannel()"><img src="/mid/resources/images/button/kakao_btn.png" style="cursor:pointer"/></a></div>
			<div class="scrollTop" style="position:fixed;">
			<a id="toparea" href="#top">
				<img src="/mid/resources/images/uparrow.png" alt="상향 화살표" class="fas">
			</a>
		</div> 
		<script type='text/javascript'>
		  //<![CDATA[
		    // 사용할 앱의 JavaScript 키를 설정해 주세요.
		    Kakao.init('9eadba4ce8c7f57a73673d034c24eb3e');
		    function chatChannel() {
		      Kakao.Channel.chat({
		        channelPublicId: '_NxexfRxb' // 카카오톡 채널 홈 URL에 명시된 id로 설정합니다.
		      });
		    }
		  //]]>
		</script>

		<script>
		/* 스크롤시 위로가기 버튼 */
		$(window).on("scroll", function() {
			if ($(window).scrollTop() > 100) {
				$('.scrollTop').css("display", "block");
			} else {
				$('.scrollTop').css("display", "none");
			}
		});
		
		 $('#toparea').click(function() {
			 $('body, 	html').animate({scrollTop:0},500);
			 }); 
		</script>
</body>

</html>