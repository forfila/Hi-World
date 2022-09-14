<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
#list{
	position: absolute; 
	top:50px; 
	left: 15px; 
	font-size: 8pt;
}
#ul{
	width: 282px; 
	height:300px;
}
#li{
	vertical-align: top;
}
</style>
<script type="text/javascript">
function refresh() {
	window.opener.location.reload();
}
</script>
 <body onBeforeUnload="refresh()" background="${pageContext.request.contextPath}/resources/images/admin/member_list.png">
	<form id="list" action="" name="neighborRegisterList" method="post">
		<c:if test="${registerList ne null}">
			<ul id="ul">				
				<c:forEach var="vo" items="${registerList}">
					<li id="li">
						<c:if test="${vo.type eq 0}">
							<a href="" onclick="window.open('miniHp_neighborRegisterCheck.do?senderSerial=${vo.senderSerial}','${vo.senderSerial}memberCall','width=370,height=504,location=no,status=no,scrollbars=no');">
								<font color="Blue">${vo.senderName}</font> 님이 이웃 신청을 하셨습니다.
							</a>
						</c:if> <c:if test="${vo.type eq 1}">
							<a href="" onclick="window.open('miniHp_neighborUpdateCheck.do?senderSerial=${vo.senderSerial}','${vo.senderSerial}memberCall','width=370,height=504,location=no,status=no,scrollbars=no');">
								<font color="Blue">${vo.senderName}</font> 님이 이웃명 수정을 신청하셨습니다.
							</a>
						</c:if>
					</li>
				</c:forEach>
			</ul>
		</c:if>
		<c:if test="${registerList eq null}">
			<center>이웃 신청이 없습니다</center>
		</c:if>
	</form>
 </body>
</html>