<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 페이지이며 메인이 생기면 뷰로 이동해야함</title>
<script src="resources/jQuery/jquery-3.4.1.min.js"></script>
</head>
<body>
	<h1>로그인 페이지</h1>
	<hr />
		<c:choose>
			<c:when test="${empty sessionScope.userId}">
			<!-- 로그인이 안되어 있으면 -->
				<form id="userLogin" name="userLogin" action="userLogin.do" method="post">
					<table>
						<tr>
							<td>아이디</td>
							<td><input type="text" name="userId" id="userId" placeholder="20글자" maxlength="20"></td>
						</tr>
						<tr>
							<td>패스워드</td>
							<td><input type="pw" name="pw" id="pw" maxlength="20"></td>
						</tr>
						<c:if test="${msg == '실패'}">
							<tr>
								<td colspan=2>
									아이디 또는 패스워드가 틀렸습니다.
								</td>
							</tr>
						</c:if>
						<tr>
							<td>
								<input type="button" id="login" value="로그인" />
							</td>
							<td>
								<input type="button" id="signUp" value="회원가입" />
							</td>
						</tr>
					</table>
				</form>
			</c:when>
			<c:otherwise>
				<h3>${sessionScope.userId}님 환영합니다.</h3>
				<a href="logout.do">로그아웃</a>
			</c:otherwise>
		</c:choose>
		<hr />
		<a href="/study">메인</a>
</body>
<script type="text/javascript">
	$(document).ready(function(e){
		$('#login').click(function(){

			// 입력 값 체크
			if($.trim($('#userId').val()) == ''){
				Swal.fire("아이디를 입력해 주세요");
				$('#userId').focus();
				return;
			}else if($.trim($('#passwd').val()) == ''){
				Swal.fire("패스워드를 입력해 주세요");
				$('#passwd').focus();
				return;
			}
			
			//전송
			$('#loginFrm').submit();
		});
		
		//회원가입 버튼
		$('#signUp').click(function() {
			location.href="userInsert.do";
		});
		
	});
</script>
</html>