<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="resources/css/MiniHpFolder.css" />
<body>
	<input type="hidden" id="ownerSerial" value="${ownerSerial}">
	<div id="folder-header" style="width: 150px;height: 30px;" align="left">
		<font  style="font-size:15pt; font-weight: bold; color: #1294AB; letter-spacing: 1px;">Board</font>
	</div>
	
	<div style="border-top: 3px solid #EBEBEB; border-bottom: 3px solid #EBEBEB; width: 150px; height: 370px; word-break:break-all;overflow: auto;overflow-x: hidden;" align="left">
		<br>
		<c:forEach var="i" items="${folderList}">
			<div>
			<img alt="" src="${pageContext.request.contextPath}/resources/images/folder_icon.png" height="13px" width="13px">
			<span id="folder-${i.serial}">
				<span class="folderNames" onclick="goToFolder('${i.serial}');" onmouseover="this.style.color='#FF5E00'; this.style.cursor='pointer';" onmouseout="this.style.color='black';" style="font-size:10pt;">
					<c:out value="${i.folderName}" />
				</span>
			</span><br>
			</div>
		</c:forEach>
	</div>
</body>
<script>
	//주인 시리얼 고정
	var ownerSerial = $('#ownerSerial').val();
	//폴더 클릭시 해당 폴더로 이동
	function goToFolder(folderSerial) {
		var ajaxMain = {
	            url : 'miniHpBoardGuest.do?folderSerial='+folderSerial+"&ownerSerial="+ownerSerial,
	            async : true,
	            type : "GET",
	            dataType : "html",
	            cache : false
	    };
	    
	    $.ajax(ajaxMain).done(function(data){
	        $('#bodyContents').children().remove();
	        $('#bodyContents').html(data);
	    });
	}
</script>