<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="${resourcePath}/img${fontCss}"/>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$("#profile_info_ok").hide();
	displayInfo();
})

function displayInfo(){
	console.log('display info');
	
	$.ajax({
		type : 'GET',
		url : 'miniHp_getIntroInfo.do',
		data : { userSerial : '${ownerVO.userSerial}'},
		
		success : function(result) {
			console.log('ajax success2');
			console.log(result);
			$("#infoTxt").html(result);
		}
	});
}

function moveToUser(){
	var OwnerSerial = $("#neighborSelect option:selected").val();
	var popupWidth = 1080;
    var popupHeight = 600;
	var popupX = (window.screen.width/2)-(popupWidth/2);
    var popupY = (window.screen.height/2)-(popupHeight/2);
	console.log(OwnerSerial);
	if(OwnerSerial>0){
		//본인한테 바람타기가는지 체크
		var userSerial = $("#userSerial").val();
		if(userSerial===OwnerSerial){
			window.open('MiniHP_Home.do','Hi-World','status=no, scrollbars=no, menubar=no, toolbar=no, height='+popupHeight +',width='+popupWidth +',left='+popupX+',top='+popupY);
			parent.window.close();
		}
		else{
		    window.open("miniHp_guestHome.do?OwnerSerial="+OwnerSerial,OwnerSerial,'status=no, scrollbars=no, menubar=no, toolbar=no, height='+popupHeight +',width='+popupWidth +',left='+popupX+',top='+popupY);
			parent.window.close();
		}
	}
} 

function goBack() {
	var popupWidth = 1080;
    var popupHeight = 600;
	var popupX = (window.screen.width/2)-(popupWidth/2);
    var popupY = (window.screen.height/2)-(popupHeight/2);
	window.open('MiniHP_Home.do','Hi-World','status=no, scrollbars=no, menubar=no, toolbar=no, height='+popupHeight +',width='+popupWidth +',left='+popupX+',top='+popupY);
	parent.window.close();
}
</script>
<style>
#profile_info {
	overflow-y: scroll; 
	width: 140px;  
	height: 100px;
	padding: 0px
}
#infoTxt{
	font-size:13px;
}
#info_bar{
	position: absolute; 
	top: 235pt; 
	left: 5pt;
}
#userName{
	font-size: 10pt; 
	position: absolute; 
	top: 260pt; 
	left: 5pt;
	color: #0f3073;
}
#userBirth{
	font-size: 7pt;
}
#neighborRegisterBtn{
	position: absolute;
    top: 275pt;
    left: 61pt;
    width: 65px;
    height: 20px;
}
#neighborSelect{
	background-color: #9cbde7; 
	width: 140px; 
	height: 18px; 
	position: absolute; 
	top: 294pt; 
	left: 5pt;
	outline: none;
}
#meBtn{
	position: absolute;
    top: 275pt;
    left: 4pt;
    width: 70px;
    height: 20px;
}
.btn {
	cursor: pointer;
}
@font-face {
	font-family: 'BMHANNAPro';
	src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_seven@1.0/BMHANNAPro.woff') format('woff');
	font-weight: normal;
	font-style: normal;
}
@font-face {
    font-family: 'SDSamliphopangche_Outline';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts-20-12@1.0/SDSamliphopangche_Outline.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
body{
font-family:'SDSamliphopangche_Outline';
}
button{
font-family:'SDSamliphopangche_Outline';
}
select{
font-family:'SDSamliphopangche_Outline';
}
input{
font-family:'BMHANNAPro';
}
textarea{
font-family:'BMHANNAPro';
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
<body bgcolor="#FFFFFF">
<input type="hidden" value="${userSerial}" id="userSerial">	
	<table border="0" width="130" bgcolor="#FFFFFF">
		<tr >
			<td bgcolor="#FFFFFF" align="center">
				<font><div id="profile_status"></div></font>
			</td>
		</tr>
		<tr >
			<td>
				<table bgcolor="#FFFFFF" width="130" cellpadding="1" cellspacing="1">
					<tr bgcolor="#FFFFFF">
						<td>
						<c:if test="${empty ownerintroVO.hpPicture}">
							<c:if test="${ownerVO.userGender eq 'M'}">
								<img id="profileImage" src="${pageContext.request.contextPath}/resources/images/admin/basic_man.jpg" width="128" height="128" border="0" alt=""/>
							</c:if>
							<c:if test="${ownerVO.userGender eq 'F'}">
								<img id="profileImage" src="${pageContext.request.contextPath}/resources/images/admin/basic_girl.jpg" width="128" height="128" border="0" alt=""/>
							</c:if>
						</c:if>
						<c:if test ="${!empty ownerintroVO.hpPicture}">
							<img id="profileImage" src="miniHp_getIntroPicture.do?userSerial=${ownerVO.userSerial}" width="128" height="128" border="0" alt=""/>
						</c:if>
						</td>
					</tr>
					<tr bgcolor="#FFFFFF">
						<td>						
						</td>
					</tr>
				</table>
			</td>

		</tr>
		<tr>
			<td> 
				<!-- 미니홈피 소개글 -->		
				<div id="profile_info">
					<span id="infoTxt"></span>
				</div>
				
				<img id="info_bar" src="${pageContext.request.contextPath}/resources/images/admin/bar.jpg" alt="" />
				
				<!-- 미니홈피 주인 이름 -->
				<span id="userName"><b>${ownerVO.userName}</b>
				
				<!-- 성별에 따름 성별표시 마크 --> 
				<c:if test="${ownerVO.userGender eq 'M'}">
					<img src="${pageContext.request.contextPath}/resources/images/admin/male.jpg">
				</c:if>
				<c:if test="${ownerVO.userGender eq 'F'}">
					<img src="${pageContext.request.contextPath}/resources/images/admin/female.jpg">
				</c:if>
				
				<!-- 유저 생일 표시 -->
				<span id="userBirth">${ownerVO.userBirth}</span>
				</span>
				<!-- 일촌 신청 버튼 -->
				<c:if test="${isNeighbor eq 0}">
					<img id="neighborRegisterBtn" class="btn" src="${pageContext.request.contextPath}/resources/images/admin/member_Register_Btn.png" onclick="window.open('miniHp_neighborRegister.do?ownerSerial=${ownerVO.userSerial}&ownerName=${ownerVO.userName}','${ownerVO.userID}memberCall','width=312,height=380,location=no,status=no,scrollbars=no')" />
				</c:if>
				
				
				<select id="neighborSelect" onchange="moveToUser()">
					<option value="">★이웃 바람타기</option>
					<!-- 일촌 목록 -->
					<c:if test="${neighborList.size() != 0}">
						<c:forEach var="neighborList" items="${neighborList}">
							<option value="${neighborList.neighborSerial}">${neighborList.neighborName} (${neighborList.neighborValue})</option>
						</c:forEach>
					</c:if>
					<c:if test="${neighborList.size() == 0}">
						<option value="-1">이웃이 없습니다</option>
					</c:if>
				</select>
				
				<!-- 내 미니홈피로 이동 -->
				<%-- <img id="meBtn" src="${pageContext.request.contextPath}/resources/images/admin/meBtn.jpg" onclick="window.open('MiniHP_Home.do','${sessionVO.userID}','width=1090,height=600,location=no,status=no,scrollbars=no')"/> --%>
				<img id="meBtn" class="btn" src="${pageContext.request.contextPath}/resources/images/admin/meBtn.png" onclick="goBack();"/>
			</td>
		</tr>
	</table>	
</body>
</html>