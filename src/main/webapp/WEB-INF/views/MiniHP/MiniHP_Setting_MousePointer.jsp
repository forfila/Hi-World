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

#container {
	width: 420px; 
	height:370px; 
	font-size: 10pt; 
	border: 0px solid black;
}

#mouseDisplay {
	width: 420px; 
	height: 150px; 
	text-align:center;
}
.img {
	width: 100px;
	height: 80px;
}

#mouseSelect {
	overflow-y:scroll; 
	width:440px; 
	height:175px; 
	padding:0px
}

#mouseTable {
	overflow-x: scroll; 
	width: 420px; 
	height:150px; 
	text-align:center;
}

.wrap {
	height: 25px;
	display: flex;
	align-items: center;
	justify-content: center;
	margin-bottom: 20px;
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
<script>
function changeMousePointer(src){
	var mouse = document.setMousePointer.mouse.value;
	if(src == "기본") {
		mouse = "resources/images/article/basicMouse.png";
	}
	var img = "${pageContext.request.contextPath}/" + mouse;
	$("#changeImg").attr("src", img);
}

function saveMousePointer() {
	var mousePointer = $(":input:radio[name=mouse]:checked").val();
	
	$.ajax({
		 type: "POST",
		 url: 'miniHp_saveMousePointer.do' ,
		 data: { mousePointer : mousePointer },
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
<form name="setMousePointer">
	<table border="0" width="420" align="center" cellpadding="0" cellspacing="0">
		<tr height="2px"></tr><tr height="2"><td align="right" colspan="3" bgcolor="#EBEBEB"></td></tr><tr height="10px"></tr>
	</table>	
	<div id="containter">	
		<table id="mouseDisplay" cellpadding="10">
			<tr>
				<td width="210px">
					<b>현재 사용 중</b>
				</td>
				<td width="210px">
					<b>바꿀 예정</b>
				</td>
			</tr>
			<tr>
				<c:if test="${itemList.mouseSrc eq null}">
					<td>
						<img src="${pageContext.request.contextPath}/resources/images/article/basicMouse.png" border="0" alt="사용중인 마우스" id="mouseImg" class="img">
					</td>
					<td>
						<img src="${pageContext.request.contextPath}/resources/images/article/basicMouse.png" border="0" alt="바꿀 마우스" id="changeImg" class="img">
					</td>
				</c:if>
				<c:if test="${itemList.mouseSrc ne null}">
					<td>
						<img src="${pageContext.request.contextPath}/${itemList.mouseSrc}" border="0" alt="사용중인 마우스" id="mouseImg" class="img">	
					</td>
					<td>
						<img src="${pageContext.request.contextPath}/${itemList.mouseSrc}" border="0" alt="바꿀 마우스" id="changeImg" class="img">
					</td>
				</c:if>
			</tr>
		</table>
		<div id="mouseSelect">
			<b>사용하실 마우스 커서를 선택해 주세요</b><br>
			<table id="mouseTable">
				<tr>
					<!-- 구매한 마우스 커서가 없는 경우 -->
					<c:if test="${mouseSize eq 0}">
						<td width="110px">
							<input type="radio" name="mouse" value="기본" checked="checked" onclick="changeMousePointer(this.value)"> <br />
							<img id="1" alt="" src="${pageContext.request.contextPath}/resources/images/article/basicMouse.png" class="img"> <br />
							기본 <br />
						</td>
					</c:if>			
					<!-- 구매한 마우스 커서가 있는 경우 -->
					<c:if test="${mouseSize ne 0 }">
						<!-- 기본 마우스 커서 사용하는 경우 -->
						<c:if test="${empty itemList.mouseSrc}">
							<td width="110px">
								<input type="radio" name="mouse" value="기본" checked="checked" onclick="changeMousePointer(this.value)"> <br />
								<img id="2" alt="" src="${pageContext.request.contextPath}/resources/images/article/basicMouse.png" class="img"> <br />
								기본 <br />
							</td>
							<c:forEach var="mouseList" items="${mouseList}">
								<td width="110px">
									<c:if test="${mouseList.articleImg eq itemList.mouseSrc}">
										<input type="radio" name="mouse" value="${mouseList.articleImg}" checked="checked" onclick="changeMousePointer(this.value)"> <br/>
										<img alt="" src="${pageContext.request.contextPath}/${mouseList.articleImg}" class="img"> <br/>
										${mouseList.articleName} <br />
									</c:if>
									<c:if test="${mouseList.articleImg ne itemList.mouseSrc}">
										<input type="radio" name="mouse" value="${mouseList.articleImg}" onclick="changeMousePointer(this.value)"> <br />
										<img alt="" src="${pageContext.request.contextPath}/${mouseList.articleImg}" class="img"><br/>
										${mouseList.articleName} <br />
									</c:if>
								</td>
							</c:forEach>
						</c:if>
						<!-- 기분마우스커서 사용 안하는 경우 -->
						<c:if test="${not empty itemList.mouseSrc}">
							<td width="110px">
								<input type="radio" name="mouse" value="기본" checked="checked" onclick="changeMousePointer(this.value)"> <br />
								<img id="3"alt="" src="${pageContext.request.contextPath}/resources/images/article/basicMouse.png" class="img"> <br />
								기본 <br />
							</td>
							<c:forEach var="mouseList" items="${mouseList}">
								<td width="110px">
									<c:if test="${mouseList.articleImg eq itemList.mouseSrc}">
										<input type="radio" name="mouse" value="${mouseList.articleImg}" checked="checked" onclick="changeMousePointer(this.value)"> <br/>
										<img alt="" src="${pageContext.request.contextPath}/${mouseList.articleImg}" class="img" > <br/>
										${mouseList.articleName} <br />
									</c:if>
									<c:if test="${mouseList.articleImg ne itemList.mouseSrc}">
										<input type="radio" name="mouse" value="${mouseList.articleImg}" onclick="changeMousePointer(this.value)"> <br />
										<img alt="" src="${pageContext.request.contextPath}/${mouseList.articleImg}" class="img"><br/>
										${mouseList.articleName} <br />
									</c:if>
								</td>
							</c:forEach>
						</c:if>
					</c:if>
				</tr>
			</table>
		</div>
		<div class="wrap">
 			<button id="sendBtn" onclick="saveMousePointer()">저장</button>
		</div>
		<table border="0" width="420" align="center" cellpadding="0" cellspacing="0">
			<tr height="5px"></tr><tr height="2"><td align="right" colspan="3" bgcolor="#EBEBEB"></td></tr><tr height="10px"></tr>
		</table>
	</div>
</form>
</body>
</html>