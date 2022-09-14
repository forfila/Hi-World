<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head><link rel="stylesheet" href="${resourcePath}/img${fontCss}"/>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
a:link {text-decoration: none; color: black;}
a:visited {text-decoration: none; color: black;}
a:active {text-decoration: none; color: grey;}
a:hover {text-decoration: underline; color: red;}
 	
body{
	 scrollbar-face-color: #FFFFFF;
	 scrollbar-highlight-color: #DBDBDB;
	 scrollbar-3dlight-color: #FFFFFF;
	 scrollbar-shadow-color: #9C92FF;
	 scrollbar-darkshadow-color: #FFFFFF;
	 scrollbar-track-color: #FFFFFF;
	 scrollbar-arrow-color: #9C92FF
}

.menu{
	border: 1px solid;
	border-left: 0px;
	width: 60px;
	height: 22px;
	padding-top: 6px;
	border-top-right-radius: 6px;
	border-bottom-right-radius: 6px;
	font-size: 9pt;
	user-select: none;
	align: center;
}
input::placeholder {
  font-style: italic;
  font-size: 8pt;
}
#background {
	width: 420px; 
	height:210px; 
	padding-top: 6px;
	font: 굴림;
	font-size: 10pt;
	border: 0px solid black;
	background-color: #F6F6F6;
	align: left;
}
#menuside{
	border: 0px solid black;
	width: 200px;
	height:150px;
	float: left;
	margin-top: 8px;
}
#menu_top{
	float: left;
	border: 0px solid black;
	padding-top: 5px;
}
.menus{
	float: left;
	border: 0px solid black;
	padding-top: 8px;
}
#radio_top{
	border: 0px solid black;
	height: 28px;
	padding-top: 10px;
	padding-left: 70px;
}
.radio{
	border: 0px solid black;
	height: 28px;
	padding-top: 13px;
	padding-left: 70px;
}
#colorside{
	border: 0px solid black;
	height: 165px;
	padding-top: 5px;
}
.color{
	align: left;
	padding-left: 228px;
}
.color_choice{
	padding-top: 5px;
	padding-bottom: 10px;
	padding-right: 42px; 
	border: 0px solid black;
}
#default_color{
	float: right; 
	border: 0px solid black;
	height: 28px;
	padding-top: 5px;
	padding-left: 75px;
	padding-right: 27px;
	font-size:8pt;
	color: #1294AB;
	font-weight: bold;
}
#menuBackground{
	width: 30%;
	cursor: pointer
}
#menuFontColor{
	width: 30%;
	cursor: pointer
}
#menuBorder{
	width: 30%;
	cursor: pointer
}
#send{
	margin-right: 25px;
}
</style>
<script src="https://www.lgkids.co.kr/es_all/plugins/jscolor-2.0.5/jscolor.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
	$(function(){	
		var menu3 = $("#menu3-${miniHpUserMenuVO.menu3}");
		menu3.prop("checked",true);
		console.log("#menu3-${miniHpUserMenuVO.menu3}");
		
		var menu4 = $("#menu4-${miniHpUserMenuVO.menu4}");
		menu4.prop("checked",true);
		
		var menu5 = $("#menu5-${miniHpUserMenuVO.menu5}");
		menu5.prop("checked",true);
		
		var menu6=$("#menu6-${miniHpUserMenuVO.menu6}");
		menu6.prop("checked",true);

		$(".menu").css('background-color', '#' + $("#menuBackground").val());
		$(".menu").css('color', '#' + $("#menuFontColor").val());
		$(".menu").css('border-color', '#'+$("#menuBorder").val());
		
	});
	
	$(document).ready(function(){
		 $("#send").click(function(){
			var menu3 = $(":radio[name='menu3']:checked").val();
			var menu4 = $(":radio[name='menu4']:checked").val();
			var menu5 = $(":radio[name='menu5']:checked").val();
			var menu6 = $(":radio[name='menu6']:checked").val();
			var menuBGColor= $("#menuBackground").val();
			var menuFontColor = $("#menuFontColor").val();
			var menuBorderColor = $("#menuBorder").val();
			
			var allData = { "UserSerial" : '${sessionVO.userSerial}', "menu3" : menu3, "menu4" : menu4, "menu5" : menu5, "menu6" : menu6,
							"menuBGColor" : menuBGColor, "menuFontColor" : menuFontColor, "menuBorderColor" : menuBorderColor }
			$.ajax({
				type : "POST",
				url : "miniHp_menuAvailable_ok.do",
				data : allData,
				success : function(result){
					 window.parent.location.href = "MiniHP_Home.do";
				},
				error:function(e){
					alert(e.responseText);
				}			 
			 });		 		 
		 });
		 
		 $("#menuBackground").change(function(){
			$('.menu').css('background-color', '#'+$("#menuBackground").val());
		 });
		 $("#menuFontColor").change(function(){
			$('.menu').css('color', '#'+$("#menuFontColor").val());
		 });
		 $("#menuBorder").change(function(){
			$('.menu').css('border-color', '#'+$("#menuBorder").val());
		 });
		 $("#basicMenuColor").click(function(){
			$('#menuBackground').val('238db3');
			$('#menuBackground').css('backgroundColor','#238DB3');
			$('#menuBackground').css('color', 'FFFFFF');
		    $('.menu').css('background-color', '#238db3');
				 
			$('#menuFontColor').val('000000')
			$('#menuFontColor').css('backgroundColor','#000000');
			$('#menuFontColor').css('color', '#FFFFFF');
			$('.menu').css('color', '#000000');
				 
			$('#menuBorder').val('000000');
			$('#menuBorder').css('backgroundColor','#000000');
			$('#menuBorder').css('color', '#FFFFFF');
			$('.menu').css('border-color', '#000000');
		 });
	});
</script>
</head>
<body>
<form name="menuSetting">
	<table border="0" width="420" align="center" cellpadding="0" cellspacing="0" valine="top">
		<tr height="5px"></tr><tr height="2"><td align="right" colspan="3" bgcolor="#EBEBEB"></td></tr><tr height="10px"></tr>
	</table>
	
	<div id="background">
		<div id="menuside">
			<div id="menu_top">
				<div class="menu">사진첩</div>
			</div>
			<div id="radio_top">
				<input type="radio" name="menu3" id="menu3-1" value="1"> 공개 <input type="radio" name="menu3" id="menu3-0" value="0"> 비공개
			</div>
			<div class="menus">
				<div class="menu">게시판</div>
			</div>
			<div class="radio">
				<input type="radio" name="menu4" id="menu4-1" value="1"> 공개 <input type="radio" name="menu4" id="menu4-0" value="0"> 비공개
			</div>
			<div class="menus">
				<div class="menu">비디오</div>
			</div>
			<div class="radio">
				<input type="radio" name="menu5" id="menu5-1" value="1"> 공개 <input type="radio" name="menu5" id="menu5-0" value="0"> 비공개
			</div>
			<div class="menus">
				<div class="menu">방명록</div>
			</div>
			<div class="radio">
				<input type="radio" name="menu6" id="menu6-1" value="1"> 공개 <input type="radio" name="menu6" id="menu6-0" value="0"> 비공개
			</div>
		</div>
		<div id="colorside" align="center">
			<div class="color">
				바탕 색상
			</div>
			<div class="color_choice">
				<input class="form-control jscolor" id="menuBackground" value="${miniHpUserMenuVO.menuBGColor}" placeholder="바탕 색상">
			</div>
			<div class="color">
				글씨 색상
			</div>
			<div class="color_choice">
				<input class="form-control jscolor" id="menuFontColor" value="${miniHpUserMenuVO.menuFontColor}" placeholder="글씨 색상">
			</div>
			<div class="color">
				테두리 색상
			</div>
			<div class="color_choice">
				<input class="form-control jscolor" id="menuBorder" value="${miniHpUserMenuVO.menuBorderColor}" placeholder="테두리 색상">
			</div>
		</div>
		<div id="default_color">
			<span id="basicMenuColor" onmouseover="this.style.color='#FF5E00';" onmouseout="this.style.color='#1294AB';"
				style="padding-right: 30px; cursor: pointer">
					■ 기본 색상
			</span>
			<input type="button" id="send" value="저장">
		</div>
	</div>

	<table border="0" width="420" align="center" cellpadding="0" cellspacing="0">
		<tr height="5px"></tr>
		<tr height="2">
			<td align="right" colspan="3" bgcolor="#EBEBEB"></td>
		</tr>
		<tr height="10px"></tr>
	</table>
	
	<div style="height: 200px;"></div>
</form>
</body>
</html>