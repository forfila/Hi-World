<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Title</title>
</head>
<body>

	<!-- 
   		네이버 
   		Client ID = VBRcDSvmTwE9_oyQ5KnY
   		Client Secret = zldNDsMNlE
   		CallBack URL = http://localhost:8081/root/callback
    -->

	<h1>Login Form</h1>
	<hr>
	<br>
		<!-- choose는 when을 이용하여 여러곳으로 분기가 가능  -->
		<!-- when은 조건에 맞아 떨어지면 실행 -->
		<!-- otherwise는 만약 조건에 맞아 떨어지는것이 하나도 없을경우 실행 -->
		<c:choose>
		
			<c:when test="${vo.getuserName != null}">
				<h3>${vo.getuserSerial} 님 환영합니다!</h3>
				<h3>
					<a href="getOneClient.do?UserID=${vo.userID}">내정보보기</a>
					<a href="MiniHP_Home.do">미니홈피들어가기</a>
					<a href="logout.do">로그아웃</a>
					<a href="BamTolCharge.do">밤톨충전</a>
				</h3>
			</c:when>
			
		<c:otherwise>
			
				<!-- 기존 홈페이지를 통해 로그인한 사람이 로그인 할경우 -->
				<h2>로그인</h2>
					<form action="checkClient.do" method="post">
							<input type="text" name="UserID" id="UserID" placeholder="아이디" > <br> 
							<input type="password" id="UserPW" name="UserPW" placeholder="비밀번호"> <br>
							<input type="submit" value="로그인"> <br>
					</form>
				<a href="userInsertForm.do">회원가입</a>
				<br>
				
				<!-- 네이버 로그인 창으로 이동 -->
				<div id="naver_id_login" style="text-align: center">
					<!-- 네아 확인 url주소가 넘어옴 -->
					<a href="${url}"> <img width="223" src="https://developers.naver.com/doc/review_201802/CK_bEFnWMeEBjXpQ5o8N_20180202_7aot50.png" /></a>
				</div>
				<br>
			</c:otherwise>
		</c:choose>

</body>
</html>