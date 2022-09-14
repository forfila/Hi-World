<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
input[type="radio"] {
	margin-top: -1px;
	vertical-align: middle;
}

body {
	scrollbar-face-color: #FFFFFF;
	scrollbar-highlight-color: #DBDBDB;
	scrollbar-3dlight-color: #FFFFFF;
	scrollbar-shadow-color: #9C92FF;
	scrollbar-darkshadow-color: #FFFFFF;
	scrollbar-track-color: #FFFFFF;
	scrollbar-arrow-color: #9C92FF
}

#container {
	width: 410px;
	height: 370px;
	padding-left: 5px;
	font: 굴림;
	font-size: 10pt;
	border: 0px solid black;
}

#storyImg {
	width: 300px;
	height: 130px;
}

#storyImg2 {
	background-image: url('${pageContext.request.contextPath}/${itemList.backgroundSrc}'); 
	background-size: 400px 200px;
	width: 410px; 
	height: 200px;
	display:flex; 
	justify-content: center; 
	align-items: center; 
	position: relative; 
	margin-bottom: 5px;
}

.minimiImg {
	position: absolute;
	background-image:url('${pageContext.request.contextPath}/${itemList.characterSrc}'); 
	background-size: 70px 60px; 
	width:70px; 
	height: 60px; 
	top: ${itemList.minimiY}; 
	left: ${itemList.minimiX};
}

.wrap {
	height: 100%;
	display: flex;
	align-items: center;
	justify-content: center;
}

#sendBtn {
	width: 100px;
	height: 30px;
	font-size: 11px;
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
var boxXY = "390px, 195px"

var section = document.querySelector("#section1");
var container = section.querySelector(".storyImg");
var box = section.querySelector(".minimiImg");


container.onclick = function(e){
	box.style.left = (e.pageX-35-270)+"px";
	box.style.top = (e.pageY-40-100)+"px";
	boxXY = box.style.left+","+box.style.top;
	console.log(boxXY);
}


function changeStory(src){
	var src = document.setStoryRoomMinimi.storyRoom.value;
	var src = "url(${pageContext.request.contextPath}/"+src+")";
	$("#storyImg2").css("background-image", src);
}

function changeMinimi(src){
	var src = document.setStoryRoomMinimi.minimi.value;
	var src = "url(${pageContext.request.contextPath}/"+src+")";
	$("#minimiImg").css("background-image", src);
}

function saveStoryMinimi() {
	var storyRoom = $(":input:radio[name=storyRoom]:checked").val();
	var minimi = $(":input:radio[name=minimi]:checked").val();
	
	$.ajax({
		 type: "POST",
		 url: 'miniHp_saveStoryRoomMinimi.do' ,
		 data: { storyRoom : storyRoom, minimi : minimi, xy : boxXY},
		 success:function(result){
			 console.log('1234');
			 window.parent.location.href = "MiniHP_Home.do";
		 },
		 error:function(e){
			 console.log('6789');
		 }			 
	 });
}	
</script>
</head>
<body>
<form name="setStoryRoomMinimi">
	<table border="0" width="420" align="center" cellpadding="0" cellspacing="0">
		<tr height="5px"></tr><tr height="2"><td align="right" colspan="3" bgcolor="#EBEBEB"></td></tr><tr height="10px"></tr>
	</table>	
	<div id="container" align="left">
	<section id="section1" class="section1">
		<div id="storyImg2" class="storyImg2" >
			<div border="0" id="storyImg" class="storyImg"></div>
			<div id="minimiImg" class="minimiImg"></div>
		</div>
	</section>
	
	<table style="width: 400px; height:150px;">
		<tr>								
			<td style="width: 200px; height: 150px;">
				<div style="overflow-y:scroll; width:200px;  height:150px; padding:0px">
					<c:if test="${storySize ne 0 }">
						<c:forEach var="storyList" items="${storyList}">
							<c:if test="${storyList.articleImg eq itemList.backgroundSrc}">
								<input type="radio" name="storyRoom" value="${storyList.articleImg}" checked="checked" onclick="changeStory(this.value)"><img alt="" src="${pageContext.request.contextPath}/${storyList.articleImg}" width="120px" height="75px"><br/>&nbsp;&nbsp;&nbsp;${storyList.articleName}<br/>
							</c:if>
							<c:if test="${storyList.articleImg ne itemList.backgroundSrc}">
								<input type="radio" name="storyRoom" value="${storyList.articleImg}" onclick="changeStory(this.value)"><img alt="" src="${pageContext.request.contextPath}/${storyList.articleImg}" width="120px" height="75px"><br/>&nbsp;&nbsp;&nbsp;${storyList.articleName}<br/>
							</c:if>		
						</c:forEach>	
					</c:if>
				</div>
			</td>
			
			<td style="width: 200px; height: 150px;">
				<div style="overflow-y:scroll; width:200px;  height:150px; padding:0px">
					<c:if test="${minimiSize ne 0 }">
						<c:forEach var="minimiList" items="${minimiList}">
							<c:if test="${minimiList.articleImg eq itemList.characterSrc}">
								<input type="radio" name="minimi" value="${minimiList.articleImg}" checked="checked" onclick="changeMinimi(this.value)"><img alt="" src="${pageContext.request.contextPath}/${minimiList.articleImg}" width="70px" height="60px"><br/>&nbsp;&nbsp;&nbsp;${minimiList.articleName}<br/>
							</c:if>
							<c:if test="${minimiList.articleImg ne itemList.characterSrc}">
								<input type="radio" name="minimi" value="${minimiList.articleImg}" onclick="changeMinimi(this.value)"><img alt="" src="${pageContext.request.contextPath}/${minimiList.articleImg}" width="70px" height="60px"><br/>&nbsp;&nbsp;&nbsp;${minimiList.articleName}<br/>
							</c:if>		
						</c:forEach>	
					</c:if>
				</div>
			</td>
		<tr>
	</table>		
	</div>
	<div class="wrap">
 		<button id="sendBtn" onclick="saveStoryMinimi()">저장</button>
	</div>
	<table border="0" width="420" align="center" cellpadding="0" cellspacing="0">
		<tr height="5px"></tr><tr height="2"><td align="right" colspan="3" bgcolor="#EBEBEB"></td></tr><tr height="10px"></tr>
	</table> 
</form>
</body>
</html>