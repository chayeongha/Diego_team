<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<nav class="navbar navbar-inverse">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand" href="${pageContext.request.contextPath}/">WebSiteName</a>
			</div>
			<ul class="nav navbar-nav">
				<li class="active"><a href="${pageContext.request.contextPath}">Home</a></li>
				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#">Page 1 <span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="${pageContext.request.contextPath}/makeDiv">GGOGOGOGO</a></li>
						<li><a href="#">Page 1-2</a></li>
						<li><a href="#">Page 1-3</a></li>
					</ul></li>
				<li><a href="${pageContext.request.contextPath}/notice/noticeList">Notice</a></li>
				<li><a href="${pageContext.request.contextPath}/mainProduct">product</a></li>
				
			</ul>
			<ul class="nav navbar-nav navbar-right">
			<c:if test="${not empty sessionScope.admin}">
				<li><a href="${pageContext.request.contextPath}/admin/adminMypage"><span class="glyphicon glyphicon-user"></span>
						My Page</a></li>
				<li><a href="${pageContext.request.contextPath}/admin/adminLogout"><span class="glyphicon glyphicon-log-out"></span>
						Logout</a></li>
			</c:if>
			<c:if test="${empty admin}">
				<li><a href="${pageContext.request.contextPath}/admin/adminJoin"><span class="glyphicon glyphicon-user"></span>
						Sign up</a></li>
				<li><a href="${pageContext.request.contextPath}/admin/adminLogin"><span class="glyphicon glyphicon-log-in"></span>
						Login</a></li>
			</c:if>
			</ul>
		</div>
	</nav>

