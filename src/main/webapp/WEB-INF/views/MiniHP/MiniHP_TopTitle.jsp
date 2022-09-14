<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html><link rel="stylesheet" href="${resourcePath}/img${fontCss}"/>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
var str;

$(document).ready(function(){
	$("#titleName_alter").hide();
	displayTitle();
});

function change(){
	$("#titleName").hide();
	$("#titleName_alter").show();
	/* $("#title_Txt").val(str); */
}

function change_ok(){
	console.log('change_ok');
	$("#titleName").show();
	$("#titleName_alter").hide();
	var newTitle = $("#title_Txt").val();
	console.log(newTitle);
	
	$.ajax({
		type : 'GET',
		url : 'miniHp_updateIntroTitle.do',
		data : { userSerial : '${sessionVO.userSerial}', hpTitle : newTitle },
		
		success : function(result) {
			console.log('ajax success3');
			displayTitle();
		}
	})
}

function displayTitle(){
	console.log('display title');
	
	$.ajax({
		type : 'GET',
		url : 'miniHp_getIntroTitle.do',
		data : { userSerial : '${sessionVO.userSerial}'},
		
		success : function(result) {
			console.log('ajax success4');
			console.log(result);
			$("#inText").html(result);
		}
	})
}

</script>
<body style="overflow:hidden;">
	<div id="titleName" style="padding-top:12px;">
		<span style="font-weight:bold; font-size: 15px; color: #4B9687; cursor: pointer;" id="inText" onclick="change()"></span>
	</div>
	<div id="titleName_alter" style="margin-top: 15px">
		<input type="text" id="title_Txt" />
		<img src="${pageContext.request.contextPath}/resources/images/admin/editOkBtn.jpg" style="cursor: pointer; vertical-align: middle" onclick="change_ok()"/>
	</div>
</body>
</html>
