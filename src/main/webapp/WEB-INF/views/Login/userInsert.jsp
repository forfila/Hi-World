<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hi-World</title>
<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/images/파비콘.png" type="image/x-icon">
<link rel="icon" href="${pageContext.request.contextPath}/resources/images/파비콘.png" type="image/x-icon">
<link rel="stylesheet" href="resources/css/UserInsert.css?after">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>
	<div id="header">
		
		<div id="wrapper">
			<div id="content">
				<img id="img_hade" alt="로고사진" src="resources/images/로고7.png">
				<!--  로고 -->
				<form action="insertClient.do" id="userinsert" name="userinsert"
					method="post">
					<!-- 아이디  -->
					<h3>
						<label for="id">아이디</label>
					</h3>
					<span class="box int_id"> 
					<c:if test="${UserID != ''}">
						<input type="text" id="userID" name="userID" class="int" maxlength="20" value="${UserID}" readonly/>
					</c:if>
					<c:if test="${UserID == ''}">
						<input type="text" id="userID" name="userID" class="int" maxlength="20"/>
					</c:if>
					</span> <span id="error_next_box" class="error"></span>
					<!-- 패스워드  -->
					<h3 class="join_title">
						<label for="pw">비밀번호</label>
					</h3>
					<span class="box int_pw"> <input type="password" id="userPW"
						name="userPW" class="int" maxlength="16" />
					</span> <span id="error_next_box1" class="error"></span>
					<!-- 패스워드확인  -->
					<h3>
						<label for="checkpw">비밀번호확인</label>
					</h3>
					<span class="box int_pw1"> <input type="password"
						id="pwCheck" name="pwCheck" class="int" maxlength="16" />
					</span> <span id="error_next_box2" class="error"></span>
					<!-- 이름 -->
					<h3>
						<label for="name">이름</label>
					</h3>
					<span class="box int_name"> 
					<c:if test="${UserID != ''}">
						<input type="text" id="userName" name="userName" class="int" maxlength="20" value="${UserName}" readonly/>
					</c:if>
					<c:if test="${UserID == ''}">
						<input type="text" id="userName" name="userName" class="int" maxlength="20"/>
					</c:if>
					</span> <span id="error_next_box3" class="error"></span>
					<!--  성별 -->
					<h3>
						<label for="Gender">성별</label>
					</h3>
					<span class="box int_gender1"> <select id="userGender"
						name="userGender" class="int">
							<option>성별</option>
							<option value="M">남</option>
							<option value="F">여</option>
					</select>
					</span> <span id="error_next_box4" class="error"></span>
					<!--  생일 -->
					<h3>
						<label for="Birth">생년월일</label>
					</h3>
					<span class="box int_birth"> <input type="text"
						id="userBirth" name="userBirth" class="int" size="10"
						maxlength="10" placeholder="예)2021.03.22" />
					</span> <span id="error_next_box5" class="error"></span>
					<!-- 연락처  -->
					<h3>
						<label for="tel">연락처</label>
					</h3>
					<span class="box int_tel"> <input name="userTel1"
						id="userTel1" value="010" readonly style=" width:30px; height: 100%; border: none;">
					- &nbsp;<input type="text" id="userTel2" name="userTel2" maxlength="9" style=" width:80%; height:68%; border:none; position: absolute; top:7px;  "/>
					</span> <span id="error_next_box6" class="error"></span>
					<!-- 주소  -->
					<h3>
						<label for="address">주소</label>
					</h3>
					<span class="box int_address"> <input type="text" id="userAddress"
							name="userAddress" class="int"
							maxlength="100" placeholder="1자이상 100자 이하로 적어주세요">
					</span> <span id="error_next_box7" class="error"></span>

					<div class="btn_area">
						<span><input type="submit" id="signUp" value="회원가입" /></span>
					</div>
				</form>
			</div>
		</div>

		<!--   -->
	</div>
</body>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/client/userInser.js"></script>
</html>