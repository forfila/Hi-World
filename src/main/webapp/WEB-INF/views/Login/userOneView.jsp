<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table>
		<tr>
			<td><input type="text" value="${clientVO.userName}"/></td>
		</tr>
		<tr>
			<td><input type="text" value="${clientVO.userID}"/></td>
		</tr>
		<tr>
			<td><input type="text" value="${clientVO.userPW}"/></td>
		</tr>
		<tr>
			<td><input type="text" value="${clientVO.userGender}"/></td>
		</tr>
		<tr>
			<td><input type="text" value="${clientVO.userBirth}"/></td>
		</tr>
		<tr>
			<td><input type="text" value="${clientVO.userTel}"/></td>
		</tr>
		<tr>
			<td><input type="text" value="${clientVO.userAddress}"/></td>
		</tr>
		<tr>
			<td><input type="text" value="${clientVO.userCash}"/></td>
		</tr>
	</table>
</body>
</html>