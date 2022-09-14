<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
a:link {text-decoration: none; color: black;}
a:visited {text-decoration: none; color: black;}
a:active {text-decoration: none; color: grey;}
a:hover {text-decoration: underline; color: red;}
 	
 input[type="radio"] {
  margin-top: -1px;
  vertical-align: middle;
}
 	
body{
	align-items:top;
	 scrollbar-face-color: #FFFFFF;
	 scrollbar-highlight-color: #DBDBDB;
	 scrollbar-3dlight-color: #FFFFFF;
	 scrollbar-shadow-color: #9C92FF;
	 scrollbar-darkshadow-color: #FFFFFF;
	 scrollbar-track-color: #FFFFFF;
	 scrollbar-arrow-color: #9C92FF
}
</style>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">

function deleteNeighbor(neighborSerial, index){
	var flag = confirm("이웃을 끊겠습니까?");
	
	if(flag) {
		$.ajax({
			type : 'GET',
			url : 'miniHp_deleteNeighbor.do',
			data : { neighborSerial : neighborSerial },
			
			success : function() {
				$("#neighborList"+index).remove();
			}
		});
	}
}

function listCheck(neighborSerial) {
	$.ajax({
		type : 'GET',
		url : 'miniHp_neighborListCheck.do',
		data : { neighborSerial : neighborSerial },
		
		success : function(result) {
			if(result == 1) {
				alert('이미 이웃명 수정을 신청하셨습니다');
			} else {
				updateNeighbor(neighborSerial);
			}
		}
	})
}

function updateNeighbor(neighborSerial){
	
	var popupWidth = 312;
    var popupHeight = 380;
	var popupX = (window.screen.width/2)-(popupWidth/2);
    var popupY = (window.screen.height/2)-(popupHeight/2);
    var status = 'status=no, scrollbars=no, menubar=no, toolbar=no, height='+popupHeight +',width='+popupWidth +',left='+popupX+',top='+popupY;
      
    window.open("miniHp_updateNeighbor.do?neighborSerial="+neighborSerial,"updateNeighbor",status); 
}

</script>
</head>
<body>
<form name="neighborSetting">
	<h3 style="margin-bottom: 0px; text-align: left; margin-left: 10px;">이웃 관리</h3>
	<table border="0" width="100%" align="center" cellpadding="0" cellspacing="0" style="margin-top: 0px;">
		<tr height="5px"></tr><tr height="2"><td align="right" colspan="3" bgcolor="#EBEBEB"></td></tr><tr height="10px"></tr>
	</table>
	
	<div align ="left" valign="top" id="infoTxt" class="infoTxt" style="height: 355px;">
		<c:if test="${listLength ne 0}">
			<c:forEach var="neighborList" items="${neighborList}" varStatus="status">
			<c:set var="index" value="${status.index}" />
				<div id="neighborList${index}">
					<font style="margin-left: 10px;">나(${neighborList.userValue}) - <a href="#"><font color="blue">${neighborList.neighborName}</font></a>(${neighborList.neighborValue})</font>
					<input type="button" value="이웃명 변경" onclick="listCheck('${neighborList.neighborSerial}')"/>&nbsp;<input type="button" value="이웃끊기" onclick="deleteNeighbor('${neighborList.neighborSerial}', ${index});"/><br/>
				</div>
			</c:forEach>
		</c:if>
		<c:if test="${listLength eq 0}">
			<option value="" style="margin-left: 10px; text-align: center; padding-top: 100px;">이웃이 없습니다</option>
		</c:if>
	</div>
	<table border="0" width="100%" align="center" cellpadding="0" cellspacing="0">
		<tr height="5px"></tr><tr height="2"><td align="right" colspan="3" bgcolor="#EBEBEB"></td></tr><tr height="10px"></tr>
	</table>
</form>
</body>
</html>