<%@ page  contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head><link rel="stylesheet" href="${resourcePath}/img${fontCss}"/>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
.menu{
	border: 1px solid;
	border-left: 0px;
	width: 60px;
	height: 22px;
	padding-top: 6px;
	margin-bottom: 1px;
	border-top-right-radius: 6px;
	border-bottom-right-radius: 6px;
	font-size: 9pt;
	user-select:none;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script type="text/javascript">
/* ajax */
function movePage(url){
	// ajax option
	var ajaxOption = {
	url : url,
	async : true,
	type : "GET",
	dataType : "html",
	cache : false
};
        
	$.ajax(ajaxOption).done(function(data){
	// Contents 영역 삭제
	$('#bodyContents').children().remove();
	 // Contents 영역 교체
	$('#bodyContents').html(data);
	});
}
$(document).ready(function(){
	$(".menu").css('background-color', '#${ownermenuVO.menuBGColor}');
	$(".menu").css('color', '#${ownermenuVO.menuFontColor}');
	$(".menu").css('border-color', '#${ownermenuVO.menuBorderColor}');
	$("#menu1").css('background-color', '#FFFFFF');
})
$('.menu').click(function(){
	console.log('2312341234');
	$(".menu").css('background-color', '#${ownermenuVO.menuBGColor}');
	$(this).css('background-color', '#FFFFFF');
});
</script>
<script src="resources/js/miniHP/ajaxMoveGuestPage.js?ver=1"></script>
<title>Insert title here</title>
</head>
<body>
	<c:if test="${ownermenuVO.menu1==1}">
		<div align="center" id="menu1" class="menu" onclick="moveHome('${ownerSerial}');">홈</div>
	</c:if>
	
	<c:if test="${ownermenuVO.menu2==1}">
		<div align="center" id="menu2" class="menu" onclick="moveProfile('${ownerID}','${ownerSerial}')">프로필</div>
	</c:if>
	
	<c:if test="${ownermenuVO.menu3==1}">
		<div align="center" id="menu3" class="menu" onclick="movePicture('${ownerSerial}')">사진첩</div>
	</c:if>
	
	<c:if test="${ownermenuVO.menu4==1}">
		<div align="center" id="menu4" class="menu" onclick="moveBoard('${ownerSerial}')">게시판</div>
	</c:if>
	
	<c:if test="${ownermenuVO.menu5==1}">
		<div align="center" id="menu5" class="menu" onclick="moveVideo('${ownerSerial}')">동영상</div>	
	</c:if>
	
	<c:if test="${ownermenuVO.menu6==1}">
		<div align="center" id="menu6" class="menu" onclick="moveBook('${ownerSerial}')">방명록</div>
	</c:if>
</body>
</html>