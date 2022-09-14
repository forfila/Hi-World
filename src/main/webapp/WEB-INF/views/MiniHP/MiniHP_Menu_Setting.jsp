<%@ page  contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
	function openOrCloseMenu(index){
		var menu = document.getElementById("menu"+index);

		if(menu.style.display=="none"){
			menu.style.display="block";
		}else{
			menu.style.display="none"
		}
	}
	
	function setBasicInformation(){	
		$.ajax({
			type : 'POST',
			url : 'miniHp_setBasicInformation_pw.do',
			
			success : function(result) {
				$("#bodyContents").children().remove();
				$("#bodyContents").html(result)
			}
		});
	}
	
	function setMenuAvailable(){
		$.ajax({
			type : 'POST',
			url : 'miniHp_menuAvailable.do',
			
			success : function(result) {
				$("#bodyContents").children().remove();
				$("#bodyContents").html(result);
			}
		});
	}
	
	function setNeighborList(){
		console.log('11');
		
		$.ajax({
			type : 'POST',
			url : 'miniHp_setNeighborList.do',
			
			success : function(result) {
				console.log('22')
				$("#bodyContents").children().remove();
				$("#bodyContents").html(result);
			}
		});
	}
	
	function setStoryRoomMinimi(){
		console.log('3333');
		
		$.ajax({
			type : 'POST',
			url : 'miniHp_storyRoomMinimi.do',
			
			success: function(result) {
				console.log('3333333');
				$("#bodyContents").children().remove();
				$("#bodyContents").html(result);
			}
		})
	}
	
	function setMousePointer(){
		console.log('4444');
		
		$.ajax({
			type : 'POST',
			url: 'miniHp_mousePointer.do',
			
			success: function(result) {
				console.log('44444');
				$("#bodyContents").children().remove();
				$("#bodyContents").html(result);
			}
		})
	}
	
	function setPlayList(){
		console.log('5555');
		
		$.ajax({
			type : 'POST',
			url: 'miniHp_playList.do',
			
			success: function(result) {
				console.log('55555');
				$("#bodyContents").children().remove();
				$("#bodyContents").html(result);
			}
		})
	}	
	
	function setUsingBackGound() {
		console.log('2222');
		
		$.ajax({
			type : 'GET',
			url: 'miniHp_skin.do',
			
			success: function(result) {
				console.log('22222');
				$("#bodyContents").children().remove();
				$("#bodyContents").html(result);
			}
		})
	}
</script>
<style>
#managerTitle{
	width: 150px;
	height: 30px;
	font-size: 15pt; 
	font-weight: bold; 
	color: #1294AB; 
	letter-spacing: 1px;
}
#menus{
	border-top: 3px solid #EBEBEB; 
	border-bottom: 3px solid #EBEBEB; 
	width: 150px; 
	height: 370px; 
	word-break:break-all;
	overflow: auto;
	overflow-x: hidden;
}
.menuTitle{
	border: 0px solid black;
	width: 100%;
	font-size: 10pt;
	font-weight: bold;
}
#menuManage{
	border: 0px solid black;
	width: 100%;
	padding-left: 4px;
}
#menuItem{
	border: 0px solid black;
	width: 100%;
	padding-left: 4px;
}
.subMenu{
	font-size: 9pt;
	font-weight: bold;
	color: #1294AB;
}
</style>
<title>Insert title here</title>
</head>
<body>
	<div id="managerTitle" align="left">
		Manager
	</div>
								
	<div id="menus" align="left">
		<div class="menuTitle">
			<img alt="" src="${pageContext.request.contextPath}/resources/images/setting_menu_3lines.png" height="13px" width="13px">
			<span onmouseover="this.style.color='#FF5E00'; this.style.cursor='pointer';" onmouseout="this.style.color='black';" onclick="openOrCloseMenu('Manage')">
				미니홈피관리
			</span>
		</div>
		<div id="menuManage">
			<img alt="no found" src="${pageContext.request.contextPath}/resources/images/setting_menu_direction.png" height="10px" width="10px">
			<span class="subMenu" onmouseover="this.style.color='#FF5E00'; this.style.cursor='pointer';" onmouseout="this.style.color='#1294AB';" onclick="setBasicInformation();">
				기본정보
			</span>
			<br/>
			<img alt="no found" src="${pageContext.request.contextPath}/resources/images/setting_menu_direction.png" height="10px" width="10px">
			<span class="subMenu" onmouseover="this.style.color='#FF5E00'; this.style.cursor='pointer';" onmouseout="this.style.color='#1294AB';" onclick="setMenuAvailable()">
				메뉴
			</span>
			<br/>
			<img alt="no found" src="${pageContext.request.contextPath}/resources/images/setting_menu_direction.png" height="10px" width="10px">
			<span class="subMenu" onmouseover="this.style.color='#FF5E00'; this.style.cursor='pointer';" onmouseout="this.style.color='#1294AB';" onclick="setNeighborList()">
				이웃관리
			</span>
			<br/><br/>
		</div>
				
		<div class="menuTitle">
			<img alt="no found" src="${pageContext.request.contextPath}/resources/images/setting_menu_3lines.png" height="13px" width="13px">
			<span onmouseover="this.style.color='#FF5E00'; this.style.cursor='pointer';" onmouseout="this.style.color='black';" onclick="openOrCloseMenu('Item')">
				아이템 설정관리
			</span>
		</div>
		<div id="menuItem">
			<img alt="no found" src="${pageContext.request.contextPath}/resources/images/setting_menu_direction.png" height="10px" width="10px">
			<span class="subMenu" onmouseover="this.style.color='#FF5E00'; this.style.cursor='pointer';" onmouseout="this.style.color='#1294AB';" onclick="setUsingBackGound()">
				미니홈피 스킨 설정
			</span>
			<br/>
			<img alt="no found" src="${pageContext.request.contextPath}/resources/images/setting_menu_direction.png" height="10px" width="10px">
			<span class="subMenu" onmouseover="this.style.color='#FF5E00'; this.style.cursor='pointer';" onmouseout="this.style.color='#1294AB';" onclick="setStoryRoomMinimi()">
				스토리룸,미니미 설정
			</span>
			<br/>
			<img alt="no found" src="${pageContext.request.contextPath}/resources/images/setting_menu_direction.png" height="10px" width="10px">
			<span class="subMenu" onmouseover="this.style.color='#FF5E00'; this.style.cursor='pointer';" onmouseout="this.style.color='#1294AB';" onclick="setMousePointer()">
				마우스 설정
			</span>
			<br/>
			<img alt="no found" src="${pageContext.request.contextPath}/resources/images/setting_menu_direction.png" height="10px" width="10px">
			<span class="subMenu"  onmouseover="this.style.color='#FF5E00'; this.style.cursor='pointer';" onmouseout="this.style.color='#1294AB';" onclick="setPlayList()">
				음악 설정
			</span>
			<br/><br/>
		</div>
	</div>
</body>
</html>