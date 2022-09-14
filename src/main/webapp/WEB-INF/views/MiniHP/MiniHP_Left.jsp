<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	request.setCharacterEncoding("UTF-8");
%>
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

function change_i(){
	var info = $("#infoTxt").val();
	$("#profile_info").hide();
	$("#profile_info_ok").show();
	$("#infoTxt_ok").val(info);
}

function change_i_ok(){
	$("#profile_info").show();
	$("#profile_info_ok").hide();
	var newInfo = $("#infoTxt_ok").val();
	console.log(newInfo);
	
	$.ajax({
		type : 'GET',
		url : 'miniHp_updateIntroInfo.do',
		data : { userSerial : '${sessionVO.userSerial}', hpInfo : newInfo },
		
		success : function(result) {
			console.log('ajax success');
			displayInfo();
		},
		error : function(error) {
			console.log('수정에러');
		}
	})
}

function displayInfo(){
	console.log('display info');
	
	$.ajax({
		type : 'GET',
		url : 'miniHp_getIntroInfo.do',
		data : { userSerial : '${sessionVO.userSerial}'},
		
		success : function(result) {
			console.log('ajax success2');
			console.log(result);
			$("#infoTxt").html(result);
		}
	});
}



function moveToUser() {
	console.log('홈피 이동');
	
	var OwnerSerial = $("#neighborSelect option:selected").val();
	console.log(OwnerSerial);
	if(OwnerSerial>0){
		var popupWidth = 1080;
	    var popupHeight = 600;
		var popupX = (window.screen.width/2)-(popupWidth/2);
	    var popupY = (window.screen.height/2)-(popupHeight/2);
		window.open("miniHp_guestHome.do?OwnerSerial="+OwnerSerial,OwnerSerial,'status=no, scrollbars=no, menubar=no, toolbar=no, height='+popupHeight +',width='+popupWidth +',left='+popupX+',top='+popupY);
		parent.window.close();
	}
}

</script>
<style>
#profile_info {
overflow-y:scroll; 
width:140px;  
height:100px;
 padding:0px
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
cursor: url('${itemList.mouseSrc}'), auto;
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
.btn {
cursor: pointer;
}
#profile_info {
	overflow-y: scroll; 
	width: 140px;  
	height: 100px;
	padding: 0px
}
#infoTxt{
	font-size:13px;
}
#editBtn{
	position: absolute; 
	top: 215pt; 
	left: 5pt;
}
#infoTxt_ok{
	font-size:8pt; 
	resize: none;
    width: 125px;
}
#editOkBtn{
	position: absolute; 
	top: 215pt; 
	left: 5pt;
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
#neighborCheckBtn{
    position: absolute;
    top: 275pt;
    left: 63pt;
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
#randomBtn{
	position: absolute;
    top: 275pt;
    left: 4pt;
    width: 75px;
    height: 20px;
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>

 <body bgcolor="#FFFFFF">	
	<table border="0" width="130" bgcolor="#FFFFFF">
		<tr >
			<td bgcolor="#FFFFFF" align="center">
				<div id="profile_status"></div>
			</td>
		</tr>
		<tr >
			<td>
				<table bgcolor="#FFFFFF" width="130" cellpadding="1" cellspacing="1">
					<tr bgcolor="#FFFFFF">
						<td>
						<c:if test="${empty introVO.hpPicture}">
							<c:if test="${sessionVO.userGender eq 'M'}">
								<img id="profileImage" src="${pageContext.request.contextPath}/resources/images/admin/basic_man.jpg" width="128" height="128" border="0" alt=""/>
							</c:if>
							<c:if test="${sessionVO.userGender eq 'F'}">
								<img id="profileImage" src="${pageContext.request.contextPath}/resources/images/admin/basic_girl.jpg" width="128" height="128" border="0" alt=""/>
							</c:if>
						</c:if>
						<c:if test ="${!empty introVO.hpPicture}">
							<img id="profileImage" src="miniHp_getIntroPicture.do?userSerial=${sessionVO.userSerial}" width="128" height="128" border="0" alt=""/>
						</c:if>
						</td>
					</tr>
					<tr bgcolor="#FFFFFF">
						<td>
							<img src="${pageContext.request.contextPath}/resources/images/admin/editBtn.jpg" class="btn" onclick="window.open('miniHp_uploadIntroPicture.do','','width=400,height=200,location=no,status=no,scrollbars=no');">
						</td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td> 
				<!-- 미니홈피 소개글 -->
				<font>
					<div id="profile_info">
						<span id="infoTxt"></span>
						<img id="editBtn" class="btn" src="${pageContext.request.contextPath}/resources/images/admin/editBtn.jpg" onclick="change_i();"/>
					</div>
					<div id="profile_info_ok">
						<textarea rows="7" cols="20" id="infoTxt_ok"></textarea>
						<img id="editOkBtn" class="btn" src="${pageContext.request.contextPath}/resources/images/admin/editOkBtn.jpg" onclick="change_i_ok();"/>
					</div>
					<img id="info_bar" src="${pageContext.request.contextPath}/resources/images/admin/bar.jpg" alt="" />
				</font>
				
				<!-- 미니홈피 주인 이름 -->
				<span id="userName"><b>${sessionVO.userName}</b>
				
					<!-- 성별에 따름 성별표시 마크 --> 
					<c:if test="${sessionVO.userGender eq 'M'}">
						<img src="${pageContext.request.contextPath}/resources/images/admin/male.jpg">
					</c:if>
					<c:if test="${sessionVO.userGender eq 'F'}">
						<img src="${pageContext.request.contextPath}/resources/images/admin/female.jpg">
					</c:if>
				
					<!-- 유저 생일 표시 -->
					<span id="userBirth">${sessionVO.userBirth}</span>
				</span>
				
				<!-- 이웃 신청 확인 버튼 -->
				<img id="neighborCheckBtn" class="btn" src="${pageContext.request.contextPath}/resources/images/admin/member_Check_Btn.png" class="btn" onclick="window.open('miniHp_neighborRegisterList.do','${sessionVO.userID}memberCheck','width=312,height=380,location=no,status=no,scrollbars=no');" />
				
				
				<select id="neighborSelect" onchange="moveToUser()">
					<option value="">★이웃 바람타기</option>
					<!-- 이웃 목록 -->
					<c:if test="${listLength != 0}">
					<c:forEach var="neighborList" items="${neighborList}">
						<option value="${neighborList.neighborSerial}" class="neighbors">${neighborList.neighborName} (${neighborList.neighborValue})</option>
					</c:forEach>
					</c:if>
					<c:if test="${listLength == 0}">
						<option value="-1">이웃이 없습니다</option>
					</c:if>
				</select>
				<img id="randomBtn" class="btn" src="${pageContext.request.contextPath}/resources/images/admin/randomBtn.png" onclick="random()"/>
			</td>
		</tr>
	</table>	
 </body>
<script>
//alert($('.neighbors').val());
function random() {
	
	$.ajax({
		type: 'GET',
		url: 'random.do',
		datatype: 'json',
		contentType:'application/json; charset=utf-8'
	}).done(function(result) {
		var OwnerSerial = result;
		console.log(OwnerSerial);
		var popupWidth = 1080;
	    var popupHeight = 600;
		var popupX = (window.screen.width/2)-(popupWidth/2);
	    var popupY = (window.screen.height/2)-(popupHeight/2);
		window.open("miniHp_guestHome.do?OwnerSerial="+OwnerSerial,OwnerSerial,'status=no, scrollbars=no, menubar=no, toolbar=no, height='+popupHeight +',width='+popupWidth +',left='+popupX+',top='+popupY);
		parent.window.close();
	}).fail(function(error) {
		alert(JSON.stringify(error));
	});
}
</script>
</html>