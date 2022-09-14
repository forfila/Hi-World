<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<ul>
<c:forEach items="${latestPosts}" var="p">
	<li>${p.title} / <fmt:formatDate value="${p.cDate}" pattern="yyyy-MM-dd HH:mm:ss"/></li>
</c:forEach>
</ul>
</body>
</html>