<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#feedback { font-size: 1.4em; }

[id*='selectable'] .ui-selecting { background: #FECA40; }
[id*='selectable'] .ui-selected { background: #FF6600; color: white; }
[id*='selectable'] { list-style-type: none; margin: 0; padding: 0; width: 100%; }
[id*='selectable'] li { margin: 3px; padding: 0.4em; height: 13px; font-size: 12px; overflow: hidden;}

#container {
	border: 0px solid black;
	width: 95%;
	height: 85%;
	background-color: #F6F6F6;
	border-top: 2px solid #BDBDBD;
	border-bottom: 2px solid #BDBDBD;
}
#buySong {
	border: 0px solid black;
	width: 160px;
	height: 20px;
	float: left;
	margin-top: 10px;
	margin-left: 19px;
	font-size: 12pt;
	font-weight: bold;
	text-align: center;
}
#useSong {
	border: 0px solid black;
	width: 160px;
	height: 20px;
	float: right;
	margin-top: 10px;
	margin-right: 17px;
	font-size: 12pt;
	font-weight: bold;
	text-align: center;
}
#buySongList {
	border: 2px solid #BDBDBD;
	width: 160px;
	float: left;
	height: 300px;
	overflow:auto;
	word-wrap:break-word;
	background-color: white;
	margin-left: 17px;
}
#arrow {
	border: 0px solid #BDBDBD;
	width: 20%;
	height: 300px;
	float: left;
}
#buttonToUsing {
	padding-top: 90px;
}
#useSongList {
	border: 2px solid #BDBDBD;
	width: 160px;
	float: left;
	height: 300px;
	overflow:auto;
	word-wrap:break-word;
	background-color: white;
}
.wrap {
	width: 100%;
	height: 25px;
	display: flex;
	align-items: center;
	justify-content: center;
	margin-bottom: 20px;
}

#sendBtn {
	width: 60px;
	height: 30px;
	font-size: 12pt;
	text-transform: uppercase;
	letter-spacing: 2.5px;
	font-weight: 500;
	color: #000;
	background-color: #e9e9e9;
	border: none;
	border-radius: 45px;
	box-shadow: 0px 8px 15px rgba(0, 0, 0, 0.1);
	transition: all 0.3s ease 0s;
	cursor: pointer;
	outline: none;
}

#sendBtn:hover {
	background-color: #2EE59D;
	box-shadow: 0px 15px 20px rgba(46, 229, 157, 0.4);
	color: #fff;
	transform: translateY(-7px);
}
</style>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
	jQuery.noConflict();
	jQuery(function() {		
		$("#selectableNotUsingSong").selectable({
			stop: function() {
				notUsingSong = "";
				jQuery(".ui-selected", this).each(function() {
					var index = jQuery("#selectableNotUsingSong li").index(this);
					notUsingSong += jQuery("#selectableNotUsingSong li:eq("+index+")").text()+"&&";
					console.log(notUsingSong);
				});
			}
		});
		$("#selectableUsingSong").selectable({
			stop: function() {
				usingSong="";
				jQuery(".ui-selected", this).each(function() {
					var index = jQuery("#selectableUsingSong li").index(this);
					usingSong += jQuery("#selectableUsingSong li:eq("+index+")").text()+"&&";
				});
			}
		});
	});
	
	jQuery("#buttonToUsing").click(function(){
		array = notUsingSong.substring(0,notUsingSong.lastIndexOf("&&")).split("&&");
		console.log(array);
		
		for(var i=0; i<array.length; i++){
			jQuery("#selectableUsingSong").append("<li class='ui-widget-content'>"+array[i]+"</li>");
			jQuery("#selectableNotUsingSong li:contains("+array[i]+")").remove();
		}
		notUsingSong = null;
	 });
	
	jQuery("#buttonToNotUsing").click(function(){
		array = usingSong.substring(0,usingSong.lastIndexOf("&&")).split("&&");
		
		for(var i=0; i<array.length; i++){
			jQuery("#selectableNotUsingSong").append("<li class='ui-widget-content'>"+array[i]+"</li>");
			jQuery("#selectableUsingSong li:contains("+array[i]+")").remove();
		}
		usingSong = null;
	 });

	function savePlayList() {
		var playList = "";
		var nonPlayList = "";
		
		for(var i=0; i<$("#selectableUsingSong li").length; i++){
			playList += $( "#selectableUsingSong li:eq("+i+")" ).text()+"&&";
		}
		
		for(var i=0; i<$("#selectableNotUsingSong li").length; i++){
			nonPlayList += $( "#selectableNotUsingSong li:eq("+i+")" ).text()+"&&";
		}
		
		$.ajax({
			 type:"POST",
			 url : "miniHp_savePlayList.do",
			 data: { playList : playList, nonPlayList : nonPlayList },
			 success:function(args){
				 window.parent.location.href = "MiniHP_Home.do";
			 }	 
		 });
	 }
</script>
</head>
<body>
<div id="container" align="center">
	<div id="buySong" align="left">
		구입한 음악
	</div>
	<div id="useSong" align="right">
		사용 중인 음악
	</div>
	<div id="buySongList">
		<ol id="selectableNotUsingSong">
			<c:forEach var="notUsingSong" items="${notUsingSongList}">
				<li class="ui-widget-content">${notUsingSong.musicTitle}</li>
			</c:forEach>
		</ol>
	</div>
	<div id="arrow">
		<img id="buttonToUsing" alt="no found" src="${pageContext.request.contextPath}/resources/images/admin/changeSong_right.png" height="50px" width="50px"
			onmousedown="this.src='${pageContext.request.contextPath}/resources/images/admin/changeSong_pressedRight.png'"
			onmouseup="this.src='${pageContext.request.contextPath}/resources/images/admin/changeSong_right.png'"><br/>
		<img id="buttonToNotUsing" alt="no found" src="${pageContext.request.contextPath}/resources/images/admin/changeSong_left.png" height="50px" width="50px"
			onmousedown="this.src='${pageContext.request.contextPath}/resources/images/admin/changeSong_pressedLeft.png'"
			onmouseup="this.src='${pageContext.request.contextPath}/resources/images/admin/changeSong_left.png'">
	</div>
	<div id="useSongList">
		<ol id="selectableUsingSong">
			<c:forEach var="playList" items="${playList}">
				<li class="ui-widget-content">${playList.musicTitle}</li>
			</c:forEach>
		</ol>
	</div>
	<br>
	<div class="wrap">
 		<button id="sendBtn" onclick="savePlayList()">저장</button>
	</div>

</div>
</body>
</html>