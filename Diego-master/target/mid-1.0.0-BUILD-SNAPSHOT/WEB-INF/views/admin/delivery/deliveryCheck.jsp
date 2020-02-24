<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>

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




<script type="text/javascript">
 $('#butten1').click(function(){
	 console.log($("#tracker").val());
	 console.log($("#trackCode").val());
	 document.getElementById("btngo").setAttribute("href", "https://tracker.delivery/#/"+$("#tracker").val()+"/"+$("#trackCode").val());
	 
 });
</script>
                    


</body>
</html>