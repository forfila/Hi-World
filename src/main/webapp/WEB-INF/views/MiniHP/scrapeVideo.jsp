<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<style>
@font-face {
    font-family: 'SDSamliphopangche_Outline';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts-20-12@1.0/SDSamliphopangche_Outline.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
body{
	font-family:'SDSamliphopangche_Outline';
}
</style>
</head>
<body>
<input id="videoSerial" type="hidden" value="${videoSerial}">
<center><h3>스크랩할 폴더를 선택해주세요</h3></center>
<hr>
<c:forEach items="${folderList}" var="l">
	<span onclick="scrape('${l.serial}')" onmouseover="this.style.color='#FF5E00'; this.style.cursor='pointer';" onmouseout="this.style.color='black';" style="font-size:10pt;">
		<img alt="" src="${pageContext.request.contextPath}/resources/images/folder_icon.png" height="13px" width="13px">
		${l.folderName}
	</span><br>
</c:forEach>
</body>
<script>
	function scrape(folderSerial) {
		var videoSerial = $('#videoSerial').val();
		$.ajax({
			type: 'POST',
			url: 'scrapeVideo.do/'+videoSerial+'/'+folderSerial,
			datatype: 'json',
			contentType:'application/json; charset=utf-8'
		}).done(function() {
			//부모창 댓글달기
			opener.parent.insertScrapeReply(videoSerial);
			self.close();
		}).fail(function(error) {
			alert(JSON.stringify(error));
		}); 
	}
</script>
</html>