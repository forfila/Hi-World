<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/userView.css?after">
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
</head>
<body>
		<div id="top">
			<div class="Myinformation">
				<h2 class="fontsize">
					내정보를
					<spen class="fontcolor">최신 정보로 관리</spen>
					해 주세요
				</h2>
			</div>
			<div class="Information">
					<h3>아이디/비밀번호 분실 및 보호조치 해제를 위해 최신 정보로 내정보를 관리 하세요</h3>
			</div>
		</div>
	<table>
		<tr>
			<td class="userIdfom">아이디</td>
			<td class="">user아이디</td>
			<td class="" style="color: red;">
				${clientVO.userID}
			</td>
		</tr>
		<tr>
			<td rowspan="2" class="">이름/성별</td>
			<td class="">user이름</td>
			<td class="" style="color: red;">${clientVO.userName}</td>
		</tr>
		<tr>
			<td class="">성별</td>
		<c:choose>
			<c:when test="${clientVO.userGender == 'M'}">
			<td class="" style="color: red;">남성</td>
			</c:when>
			<c:otherwise>
			<td class="" style="color: red;">여성</td>
			</c:otherwise>
		</c:choose>
		</tr>
		<tr>
			<td rowspan="2" class="">비밀번호/연락처</td>
			<td class="">비밀번호</td>
			<td class="hiden1" style="color: red; height: 100px; width: 300px;">
				<input type="password" id="pw_input" style="border: none; outline: none; text-align: left; color: red; width: 107px;" value="${clientVO.userPW}" readonly/>
				<input type="button" id="pwbut" style="" value="수정" onclick="pwUpdate1()" />
			</td>
			<td class="pwhiden" style=" display: none; color: red; height: 100px; width: 300px;">
				<input type="password" name="userPW" class="Pwchc1" style="margin-top: 3px;" onmouseenter="zoomIn(event)" onmouseleave="zoomOut(event)" value="${clientVO.userPW}" />
				<p class="message"> </p>
				<input type="password" name="userPW1" class="Pwchc2" onmouseenter="zoomIn(event)" onmouseleave="zoomOut(event)" value="${clientVO.userPW}" />
				<p class="message1"></p>			
				<input type="button" id="pwbut" style="margin-left: 64px; margin-top: 0px;" value="완료" onclick="pwUpdate()" />
				<input type="button" value="취소" onclick="cancle2()" />
			</td>				
			
			
		</tr>
		<tr>
			
			<td class="">연락처</td>
			<td class="telhiden" style="color: red; height: 73px; width: 300px;">
				${clientVO.userTel}
				<input type="button" id="telbut1" value="수정" onclick="telUpdate1()" />
			</td>
			<td class="telhiden1"  style="color: red; display: none; height: 73px; width: 300px;">
				<input type="text" name="userTel" style="margin-top: 5px;" onmouseenter="zoomIn(event)" onmouseleave="zoomOut(event)" value="${clientVO.userTel}" />
				<p class="message2"></p>
				<input type="button" id="telbut" style="" value="완료" onclick="telUpdate()" />
				<input type="button" value="취소" onclick="cancle3()" /> 
			</td>
		</tr>
		<tr>
			<td rowspan="2" class="">생년월일/주소</td>
			<td class="">생년월일</td>
			<td class="" style="color: red;">${clientVO.userBirth}</td>
		</tr>
		<tr>
			
			<td class="">주소</td>
			<td class="address_hiden1" style="color: red; height: 70px; width: 300px;">
				${clientVO.userAddress}
				<input type="button" id="addressBut" value="수정" onclick="addressUpdate1()" />
			</td>
			<td class="address_hiden" style="color: red; display: none; height: 70px; width: 300px;">
				<input type="text" name="useraddress" style="margin-top: 0px;" style="" onmouseenter="zoomIn(event)" onmouseleave="zoomOut(event)" value="${clientVO.userAddress}"/>
				<p class="message3"></p>
				<input type="button" id="addressbut" style="" value="완료" onclick="addressUpdate()" />
				<input type="button" value="취소" onclick="cancle5()" />
			</td>
		</tr>
		<tr>
			<td class="">캐쉬</td>
			<td class="">보유캐쉬</td>
			<td class="" style="color: red;">${clientVO.userCash}</td>
		</tr>
	</table>
<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/js/client/userView.js">
 
</script>
</html>