<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
#sender_name{
	position: absolute; 
	top: 35px; 
	left: 80px;
	color: blue;
}
#minimi{
	position: absolute; 
	top: 65px; 
	left: 30px; 
	width: 85px;
	height: 85px;
}
#msg1{
	position: absolute; 
	top:104px; 
	left:138px; 
	font-size:8pt;
}
#msg2{
	position: absolute; 
	top:163px; 
	left:30px; 
	font-size:8pt;
}
#msg3{
	position: absolute; 
	top:185px; 
	left:30px; 
	font-size:8pt;
}
#msg4{
	position: absolute; 
	top:255px; 
	left:30px; 
	font-size:8pt;
}
#msg_area{
	width: 240px; 
	height: 40px;
}
#sendBtn{
	position: absolute; 
	top:329px; 
	left:95px; 
	font-size:8pt;
}
#cancelBtn{
	position: absolute; 
	top:330px; 
	left:158px; 
	font-size:8pt;
}
</style>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
function registerSend(){
	var ajaxData = $("form[name=neighborRegisterForm]").serialize();
	
	$.ajax({
		type : 'POST',
		url : 'miniHp_neighborRegister_ok.do',
		data : ajaxData,
		
		success : function(result) {
			console.log('이웃 신청 성공');
			window.close();
		},
		
		error : function(error) {
			alert("다시 한 번 시도해주세요");
		}
	});
}
</script>
 <body background="${pageContext.request.contextPath}/resources//images/admin/member_call.png">
	<form action="" name="neighborRegisterForm" method="post">
		<span id="sender_name">${senderName}</span>
		
		<img id="minimi" alt="상대방의 미니미" src="${recevierItem.characterSrc}">
		
		<span id="msg1">
			<font color="Blue">${receiverName}</font>님께 이웃을 신청합니다.
		</span>
		<span id="msg2">
			<font color="Blue">${receiverName}</font>님을 <font color="Blue">${senderName}</font>님의 <input type="text" style="width:50px; height:10px;" name="receiverValue"/>으로
		</span>
		<span id="msg3">
			<font color="Blue">${senderName}</font>님을 <font color="Blue">${receiverName}</font>님의 <input type="text" style="width:50px; height:10px;" name="senderValue"/>으로
		</span>
		<span id="msg4">
			<textarea id="msg_area" rows="3" cols="32" name="userMessage"></textarea>
		</span>
		<span id="sendBtn" >
			<img alt="보내기" src="${pageContext.request.contextPath}/resources/images/admin/sendBtn.jpg" onclick="registerSend();"/>
		</span>
		<span id="cancelBtn">
			<img alt="취소" src="${pageContext.request.contextPath}/resources/images/admin/cancelBtn.jpg" onclick="window.close();"/>
		</span>
		<input type="hidden" name="senderSerial" value="${sessionVO.userSerial}">
		<input type="hidden" name="senderName" value="${senderName}">
		<input type="hidden" name="receiverSerial" value="${receiverSerial}">
		<input type="hidden" name="receiverName" value="${receiverName}">
		<input type="hidden" name="type" value="0">
	</form>
 </body>
</html>