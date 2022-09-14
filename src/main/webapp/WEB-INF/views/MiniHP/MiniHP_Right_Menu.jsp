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
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
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
	$(".menu").css('background-color', '#${miniHpUserMenuVO.menuBGColor}');
	$(".menu").css('color', '#${miniHpUserMenuVO.menuFontColor}');
	$(".menu").css('border-color', '#${miniHpUserMenuVO.menuBorderColor}');
	$("#menu1").css('background-color', '#FFFFFF');
})
$('.menu').click(function(){
	console.log('2312341234');
	$(".menu").css('background-color', '#${miniHpUserMenuVO.menuBGColor}');
	$(this).css('background-color', '#FFFFFF');
});
</script>
<script src="resources/js/miniHP/ajaxMovePage.js?ver=2"></script>
<title>Insert title here</title>
</head>
<body>
	<c:if test="${miniHpUserMenuVO.menu1==1}">
		<div align="center" id="menu1" class="menu" onclick="moveHome();">홈</div>
	</c:if>
	<c:if test="${miniHpUserMenuVO.menu2==1}">
		<div align="center" id="menu2" class="menu" onclick="moveProfile()">프로필</div>
	</c:if>
	
	<c:if test="${miniHpUserMenuVO.menu3==1}">
		<div align="center" id="menu3" class="menu" onclick="movePicture()">사진첩</div>
	</c:if>
	
	<c:if test="${miniHpUserMenuVO.menu4==1}">
		<div align="center" id="menu4" class="menu" onclick="moveBoard()">게시판</div>
	</c:if>
	
	<c:if test="${miniHpUserMenuVO.menu5==1}">
		<div align="center" id="menu5" class="menu" onclick="moveVideo()">동영상</div>	
	</c:if>
	
	<c:if test="${miniHpUserMenuVO.menu6==1}">
		<div align="center" id="menu6" class="menu" onclick="moveBook()">방명록</div>
	</c:if>
	
	<c:if test="${miniHpUserMenuVO.menu7==1}">
		<div align="center" id="menu7" class="menu" onclick="moveSetting()">관&nbsp;리</div>
	</c:if>
</body>
</html>