<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="${resourcePath}/img${fontCss}"/>
<meta charset="UTF-8">
<title>Hi-World</title>
<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/images/Favicon.png" type="image/x-icon">
<link rel="icon" href="${pageContext.request.contextPath}/resources/images/Favicon.png" type="image/x-icon">
<style type="text/css">
body {
	scrollbar-face-color: #FFFFFF;
	scrollbar-highlight-color: #DBDBDB;
	scrollbar-3dlight-color: #FFFFFF;
	scrollbar-shadow-color: #9C92FF;
	scrollbar-darkshadow-color: #FFFFFF;
	scrollbar-track-color: #FFFFFF;
	scrollbar-arrow-color: #9C92FF
}
@font-face {
	font-family: 'BMHANNAPro';
	src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_seven@1.0/BMHANNAPro.woff') format('woff');
	font-weight: normal;
	font-style: normal;
}
@font-face {
    font-family: 'SDSamliphopangche_Outline';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts-20-12@1.0/SDSamliphopangche_Outline.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
body{
	font-family:'SDSamliphopangche_Outline';
	font-weight: 0;
	margin-left: 35px;
}
button{
	font-family:'SDSamliphopangche_Outline';
}
input{
	font-family:'BMHANNAPro';
}
textarea{
	font-family:'BMHANNAPro';
}
pre{
	font-family:'BMHANNAPro';
}
.secondFont{
	font-family:'BMHANNAPro';
}
a { text-decoration:none } 
.bgm-wrap {
	position: absolute;
	top:20px; 
	left:780px; 
	height:60px
}
.bgm-wrap .audio-box {
	width: 250px;
	height: 31px;
	background: #efefef; 
	padding:5px 0px 5px 15px;
	border-radius: 15px; 
	color: gray;
	border: solid 0.5px #ddd
}
.bgm-wrap .text-play-click {
	margin-top: 10px; 
	font-size: 11pt;
	text-align: center;
}
.bgm-wrap .audio-title-wrap {
	margin-bottom: -3px;
	margin-top: 3px;
	width: 235px;
	font-size: 11pt;
	font-weight: 500;
	color: #999;
}
.bgm-wrap .audio-box .audio-control-btn {
	display: inline-block;
	width: 10px;
	font-size: 12px;
	cursor:pointer;
}
.bgm-wrap .audio-box .audio-prev-btn {
	display: inline-block;
	font-size: 12px;
	cursor:pointer;
}
.bgm-wrap .audio-box .audio-next-btn {
	display: inline-block;
	font-size: 12px;
	cursor:pointer;
}
.bgm-wrap .audio-box .volume-control-btn {
	display: inline-block;
 	width: 12px;
	font-size: 12px;
	cursor: pointer;
}
.bgm-wrap .play-time {
	display: inline-block; 
	margin: 2px;
	font-size: 10pt;
	width: 35px;
}
.bgm-wrap .audio-box .play-progress-box {
	display: inline-block;
	font-size: 14pt;
	background: #fff;
	width:60px;
	height: 4px;
	border: solid 0.5px #ddd;
	vertical-align: middle
}
.bgm-wrap .audio-box .play-progress-bar {
	width:0;
	height: 100%;
	background: gray;
}
.bgm-wrap .audio-box .play-volume-box {
	display: inline-block;
	margin-left: 3px;
}
.bgm-wrap .audio-box .play-volume-slider { 
	display:inline-block;
	width: 30px;
	height:4px;
	vertical-align: middle;
}
.bgm-wrap .audio-box .play-volume-slider .ui-slider-handle.ui-state-active {
	border: 1px solid #c5c5c5;
	background: gray;
}
.bgm-wrap .audio-box .play-volume-slider .ui-slider-handle {
	width: 10px; 
	height:10px; 
	border-radius: 15px;
}
</style>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript" src="resources/js/miniHP/miniHpBGM.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	//배경화면 설정
	var skin = $("#skin").val();
	$("body").css({"background":"url("+skin+")"});
	
	//rightMenu 불러오기
	$.ajax({
		type : 'GET',
		url : 'miniHp_rightGuestMenu.do',
		data : { OwnerSerial : '${OwnerSerial}'},
		
		success : function(result) {
			$("#rightMenu").html(result);
		}
	});
	//right 불러오기
	$.ajax({
		type : 'GET',
		url : 'miniHp_rightGuest.do?OwnerSerial=${OwnerSerial}',
		success : function(result) {
			$("#bodyContents").html(result);
		}
	})
});
</script>
 </head>
<body topmargin="0" leftmargin="0">
<input type="hidden" id="skin" value="${skin}">
<form name="guestHome">
	<table border="0" align="left" valign="top" width="850" height="550" cellspacing="0" cellpadding="0">
		<tr>
			<td>
				<table border="0" align="left" width="800" height="510">
					<tr>
						<td colspan="2" align="center">
							<br>
							<font><span style="font-size:8pt;">today <font color="red">${ownerintroVO.hpToday}</font> | total ${ownerintroVO.hpTotal}</span></font>
						</td>
						<td align="center" height="40">
							<iframe frameborder="0" width="470" height="40" src="miniHp_topGuest.do?OwnerSerial=${OwnerSerial}"></iframe> 
						</td>
						<td></td>
					</tr>
					<tr>
						<td width="10"> </td>

						<td align="center" width="178" height="448" background="${pageContext.request.contextPath}/resources/images/bg_left_rect.jpg">
							<!-- 왼쪽 내용 부분 ----------------------------------------------------------- -->
							<span id="sideContents">
								<iframe frameborder="0" width="160" height="440" src="miniHp_leftGuest.do?OwnerSerial=${OwnerSerial}"></iframe> 
							</span>
							<!-- ---------------------------------------------------------------------------- -->

						</td>
						<td align="center" width="476" height="448" background="${pageContext.request.contextPath}/resources/images/bg_center_rect.jpg">
							<!-- 오른쪽 내용 부분 ----------------------------------------------------------- -->
							<span id="bodyContents">
								<%-- <iframe frameborder="0" width="470" height="430" src="miniHp_rightGuest.do?OwnerID=${OwnerID}"></iframe> --%> 
							</span>
							<!-- ---------------------------------------------------------------------------- -->
						</td>
						<!-- 오른쪽 메뉴 부분 ----------------------------------------------------------- -->
						<td valign="top" style="padding-top: 20px;">
						<!-- Setting menu beginning -->
							<span id="rightMenu"></span>				
						<!-- Setting menu ending -->	
						</td>
					</tr>

					<tr>
						<td ></td>
					</tr>
				</table>
				<!-- BGM 부분------------------------ -->
				<div class="bgm-wrap">
					<input type="hidden" id="listSize" value="${playListSize}">
					<!-- 재생목록에 노래가 없을 경우 -->
					<c:if test="${playListSize eq 0}">
						<div id="audio-player">
							<div class="audio-box">
								<div class="audio-title-wrap">
									<span id="audio-title">
										<marquee behavior="scroll" direction="left" scrollamount="3">재생할 음악이 없습니다</marquee>
									</span>
								</div>
								<div class="audio-control-btn btn-play">
									<i class="fa fa-play"></i>
								</div>
								<div class="play-time start">00:00</div>
								<div class="play-progress-box">
									<div class="play-progress-bar"></div>
								</div>
								<div class="play-time end">00:00</div>
								<div class="play-volume-box">
									<div class="audio-control-btn btn-volume">
										<i class="fa fa-volume-up"></i>
									</div>
									<div class="play-volume-slider"></div>
								</div>
							</div>
						</div>
					</c:if>	
					
					<!-- 재생목록에 노래가 있을 경우 -->
					<c:if test="${playListSize ne 0}">
						<c:forEach var="playList" items="${playList}" varStatus="status">
						<c:set var="index" value="${status.index}" />
							<c:if test="${index eq 0}">
								<div id="audio-player${index}">
									<div class="audio-box">	
										<div id="audioPlay${index}" style="display: none;">
											<audio id="audio${index}" class="audio" onended="nextPlay(${index})" src="${playList.musicSrc}"></audio>
										</div>
							
										<div class="audio-title-wrap">
											<span id="audio-title">
												<marquee behavior="scroll" direction="left" scrollamount="3">${playList.musicTitle}</marquee>
											</span>
											<input type="hidden" id="audio-title${index}" value="${playList.musicTitle}">
										</div>
										<div id="pausePlayBtn" class="audio-control-btn btn-play" onclick="pausePlay(${index})">
											<i class="fa fa-play"></i>
										</div>
										<div id="prevPlayBtn" class="audio-prev-btn" onclick="prevPlay(${index})">
											<i class="fa fa-backward"></i>
										</div>
										<div id="nextPlayBtn" class="audio-next-btn" onclick="nextPlay(${index})">
											<i class="fa fa-forward"></i>
										</div>
										<div id="startTime" class="play-time start">00:00</div>
										<div id="progressBar" class="play-progress-box">
											<div class="play-progress-bar"></div>
										</div>
										<div id="endTime"class="play-time end">00:00</div>
										<div class="play-volume-box">
											<div class="volume-control-btn btn-volume" onclick="volumeMute(${index})">
												<i class="fa fa-volume-up"></i>
											</div>
											<div class="play-volume-slider" onmouseup="volumeControl(${index})"></div>
										</div>
									</div>
								</div>
							</c:if>
							<c:if test="${index ne 0}">
								<div id="audio-player${index}" style="display: none">
									<div class="audio-box">	
										<div id="audioPlay${index}" style="display: none;">
											<audio id="audio${index}" class="audio" onended="nextLoad(${index})" src="${playList.musicSrc}"></audio>
										</div>
							
										<div class="audio-title-wrap">
											<span id="audio-title">
												<marquee behavior="scroll" direction="left" scrollamount="3">${playList.musicTitle}</marquee>											
											</span>
											<input type="hidden" id="audio-title${index}" value="${playList.musicTitle}">
										</div>
										<div id="pausePlayBtn" class="audio-control-btn btn-play" onclick="pausePlay(${index})">
											<i class="fa fa-play"></i>
										</div>
										<div id="prevPlayBtn" class="audio-prev-btn" onclick="prevPlay(${index})">
											<i class="fa fa-backward"></i>
										</div>
										<div id="nextPlayBtn" class="audio-next-btn" onclick="nextPlay(${index})">
											<i class="fa fa-forward"></i>
										</div>
										<div id="startTime" class="play-time start">00:00</div>
										<div id="progressBar" class="play-progress-box">
											<div class="play-progress-bar"></div>
										</div>
										<div id="endTime"class="play-time end">00:00</div>
										<div class="play-volume-box">
											<div class="volume-control-btn btn-volume" onclick="volumeMute(${index})">
												<i class="fa fa-volume-up"></i>
											</div>
											<div class="play-volume-slider" onmouseup="volumeControl(${index})"></div>
										</div>
									</div>
								</div>
							</c:if>
							</c:forEach>
						</c:if>	
					
					<div class="text-play-click">※ 재생 버튼을 눌러야 배경음이 재생됩니다</div>
				</div>
			</td>
		</tr>
	</table>
	<!-- ------------------------ -->
</form>
</body>
</html>