<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head><link rel="stylesheet" href="${resourcePath}/img${fontCss}"/><link rel="stylesheet" href="${resourcePath }/img${fontCss}"/>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
#sender_name{
	position: absolute; 
	top:87px; 
	left:85px; 
	font-size: 9pt;
	color: blue;
}
#msg1{
	position: absolute; 
	top:134px; 
	left:138px; 
	font-size:9pt;
}
#msg2{
	position: absolute; 
	top:155px; 
	left:138px; 
	font-size:9pt;
}
#msg_area{
	position: absolute;
	top:210px; 
 	left:36px; 
 	width: 290px; 
	height: 70px; 
	font-size:9pt;
}
#msg3{
	position: absolute; 
	top:310px;
	left:34px; 
	font-size:9pt;
}
#yesBtn{
	position: absolute; 
	top:420px; 
	left:115px; 
	font-size:8pt;
}
#nextBtn{
	position: absolute;
	top:420px;
	left:155px; 
	font-size:8pt;
}
#noBtn{
	position: absolute; 
	top:420px; 
	left:205px; 
	font-size:8pt;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script type="text/javascript">
function neighborUpdate_ok(){
	var ajaxData = $("form[name=neighborUpdateCheck]").serialize();
	console.log('ok')
	$.ajax({
		type : 'POST',
		url : 'miniHp_neighborUpdateCheck_ok.do?type=1',
		data : ajaxData,
		
		success : function(result) {
			opener.location.reload();
			window.close();
		}
	});
}
function neighborUpdate_next(){
	var ajaxData = $("form[name=neighborUpdateCheck]").serialize();
	$.ajax({
		type : 'POST',
		url : 'miniHp_neighborUpdateCheck_ok.do?type=2',
		data : ajaxData,
		
		success : function(result) {
			opener.location.reload();
			window.close();
		}
	});
}
function neighborUpdate_no(){
	var ajaxData = $("form[name=neighborUpdateCheck]").serialize();
	$.ajax({
		type : 'POST',
		url : 'miniHp_neighborUpdateCheck_ok.do?type=0',
		data : ajaxData,
		
		success : function(result) {
			opener.location.reload();
			window.close();
		}
	});
}
</script>
 <body background="${pageContext.request.contextPath}/resources/images/admin/member_check.png">
	<form action="" name="neighborUpdateCheck" method="post">
		<span id="sender_name">
			${neighborListVO.senderName}
		</span>
		
		<img alt="미니미" src="${senderItem.characterSrc}" style="position: absolute; top:105px; left:30px;" width="98px" height="98">
		
		<span id="msg1">
			<font color="Blue">${neighborListVO.senderName}</font>님께서 
			<font color="Blue">${neighborListVO.receiverName}</font>님과
		</span>
		
		<span id="msg2">
			<font color="black"><b>이웃명 수정하기</b></font>를 희망합니다.
		</span>
		
		<textarea id="msg_area"rows="5" cols="46" readonly="readonly">${neighborListVO.userMessage}</textarea>
		
		<span id="msg3">
			<font color="blue">${neighborListVO.senderName}</font>(${neighborListVO.senderValue}) - <font color="blue">${neighborListVO.receiverName}</font>(${neighborListVO.receiverValue})
		</span>
		
		<span id="yesBtn">
			<img alt="예" src="${pageContext.request.contextPath}/resources/images/admin/yesBtn.jpg" onclick="neighborUpdate_ok()"/>
		</span>
		
		<span id="nextBtn">
			<img alt="나중에" src="${pageContext.request.contextPath}/resources/images/admin/nextBtn.jpg" onclick="neighborUpdate_next()"/>
		</span>
		
		<span id="noBtn">
			<img alt="아니오" src="${pageContext.request.contextPath}/resources/images/admin/noBtn.jpg" onclick="neighborUpdate_no()"/>
		</span>	

		<input type="hidden" name="neighborSerial1" value="${neighborListVO.senderSerial}">
		<input type="hidden" name="neighborName1" value="${neighborListVO.senderName}">
		<input type="hidden" name="neighborValue1" value="${neighborListVO.senderValue}">
		<input type="hidden" name="neighborSerial2" value="${neighborListVO.receiverSerial}">
		<input type="hidden" name="neighborName2" value="${neighborListVO.receiverName}">
		<input type="hidden" name="neighborValue2" value="${neighborListVO.receiverValue}">
	</form>
 </body>
</html>