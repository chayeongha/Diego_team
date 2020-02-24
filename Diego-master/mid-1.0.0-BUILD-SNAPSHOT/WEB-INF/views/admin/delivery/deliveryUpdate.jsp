<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:import url="../../layout/bootStrap.jsp" />
	<form class="form-horizontal" action="deliveryUpdate" method="post"
		enctype="application/x-www-form-urlencoded">
		<div class="form-group">
			<label class="control-label col-sm-2" for="num">Num</label>
			<div class="col-sm-10">
				<input type="text" class="form-control" id="num" value="${dto.num}"
					readonly="readonly" name="num">
			</div>
		</div>

		<div class="form-group">
			<label class="control-label col-sm-2" for="order_num">주문번호</label>
			<div class="col-sm-10">
				<input type="text" class="form-control" id="order_num"
					value="${dto.order_num}" name="order_num">
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-sm-2" for="del_num">송장번호</label>
			<div class="col-sm-10">
				<input type="text" class="form-control" id="del_num"
					value="${dto.del_num}" name="del_num">
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-sm-2" for="del_status">배송상태</label>
			<div class="col-sm-10">
				<select name="del_status" id="del_status">
					<option value="배송준비">배송준비</option>
					<option value="배송중">배송중</option>
					<option value="배송완료">배송완료</option>
				</select>
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-sm-2" for="del_address">배송주소</label>
			<div class="col-sm-10">
				<input type="text" class="form-control" id="del_address"
					value="${dto.del_address}" name="del_address">
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-sm-2" for="del_costpay">배송비
				결제여부(Y/N)</label>
			<div class="col-sm-10">
				<select name="del_costpay" id="del_costpay">
					<option value="Y">Y</option>
					<option value="N">N</option>
				</select>
			</div>
		</div>

		<div class="form-group">
			<div class="col-sm-offset-2 col-sm-10">
				<button type="submit" class="btn btn-success" id="insert">수정</button>
			</div>
		</div>
	</form>
</body>
</html>