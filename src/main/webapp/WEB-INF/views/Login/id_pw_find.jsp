<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디/비밀번호 찾기 폼</title>
<link rel="stylesheet" href="resources/css/id_pw_find.css?after">
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
</head>
<body>
	<div class="main">
		<div>
			<img id="img_hade" alt="로고사진" style="width: 200px; margin-left: 144px;" src="resources/images/로고7.png">
			<div>
				<div class="ID_PW_Find">
					<h3 style="font-size:41px; margin-top: 10px; margin-bottom: 20px;">아이디/비밀번호 찾기</h3>
				</div>
				<div style="margin-bottom: 10px;" class="if_find_fom">
					<input type="radio" name="radio" onclick="idFind()" checked="checked">
					<label for="search_1">아이디 찾기</label>
				</div>
				<div class="pw_find_fom">
					<input type="radio" name="radio1" onclick="pwFind()"> 
					<label for="search_2">비밀번호 찾기</label>
				</div>
				<div id="hide">
					<div class="margin_fome">
						<label for="inputName_1">이름</label>
						<div>
							<input type="text" name="username" onmouseenter="zoomIn(event)" onmouseleave="zoomOut(event)" placeholder="ex) 갓형배">
						</div>
					</div>
					<div class="margin_fome1">
						<label for="inputPhone_1">휴대폰번호</label>
						<div>
							<input type="text" name="userTel" onmouseenter="zoomIn(event)" onmouseleave="zoomOut(event)" placeholder="ex) 010-7777-9999">
						</div>
					</div>
					<div class="buttonOK">
						<a href="#" style="text-decoration: none;" onclick="findId()" >확인</a>
						<a href="#" onclick="Close()" style="text-decoration: none;">취소</a>
					</div>
				</div>
				<div id="hide1" style="display: none;">
					<div class="margin_fome">
						<label for="inputId">아이디</label>
						<div>
							<input type="text" name="userId" onmouseenter="zoomIn(event)" onmouseleave="zoomOut(event)" placeholder="ex) ccangse">
						</div>
					</div>
					<div class="margin_fome1">
						<label for="inputEmail_2">휴대폰번호</label>
						<div>
							<input type="text" name="userTel1" onmouseenter="zoomIn(event)" onmouseleave="zoomOut(event)" placeholder="ex) 010-7777-9999">
						</div>
					</div>
					<div class="buttonOK">
						<a href="#" onclick="Pw_Find()" style="text-decoration: none;">확인</a>
						<a href="#" onclick="Close()" style="text-decoration: none;">취소</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="main2" id="ImMassege">
		<div class="findview">
			<div class="view">
				<span class="findIdview1">당신의 아이디는</span>
				<br />
				<span class="findIdview">
					<input type="text" id="myinput1" style="border: none; outline: none;" value="" readonly/>
				</span>
				<br />
				<span class="findIdview2">입니다.</span>
				<br />
				<br />
				<a href="#" onclick="Close()" style="font-size: 33px; text-decoration: none;">확인</a>
			</div>
		</div>
	</div>
	<div class="main2" id="ImMassege1">
		<div class="findview">
			<div class="view">
				<span class="findIdview1">비밀 번호는</span>
				<br />
				<span class="findIdview" >
					<input type="text" id="myinput2" style="border: none; outline: none;" value="" readonly/>
				</span> 
				<br />
				<span class="findIdview2">입니다.</span>
				<br />
				<br />
				<a href="#" onclick="Close()" style="font-size: 33px; text-decoration: none;" >확인</a>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/client/id_pw_find.js">
</script>
</html>