<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
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
	user-select:none;
}
input::placeholder {
  font-style: italic;
  font-size: 8pt;
}
</style>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">

	function sendPw(){
		
		$.ajax({
			type : 'POST',
			url : 'miniHp_setBasicInformation_pw_ok.do',
			/* userId session값 */
			data : { UserID : '${sessionVO.userID}', UserPW : $("#userPw").val() },
			
			success : function(result) {
				$("#bodyContents").html(result); 
			}
		});
	}

	
</script>
</head>
<body>
<form name="myForm">
	<table border="0" width="420" align="center" cellpadding="0" cellspacing="0" valine="top">
		<tr height="5px"></tr><tr height="2"><td align="right" colspan="3" bgcolor="#EBEBEB"></td></tr><tr height="10px"></tr>
	</table>
	
	<div align="center" style="width: 420px; height:200px; font: 굴림;font-size: 10pt;border: 0px solid black;background-color: #F6F6F6;padding-top: 140px;">
		<div style="margin-bottom: 5px;">
			기본정보 조회
		</div>
		<div>
			<div style="float: left;margin-left:100px;border: 0px solid black;width: 40%;">
				<input type="password" id="userPw" placeholder="비밀번호 입력" style="width: 100%; font-family: none;" onKeypress="javascript:if(event.keyCode==13){ event.preventDefault(); sendPw();}">
			</div>
			<div style="float: left;margin-left:10px;border: 0px solid black;">
				<input type="button" id="send" value="확인" onclick="sendPw()" style="height: 24px;">
			</div>
		</div>
		<div>
			<div style="float: left;margin-left:100px;border: 0px solid black;font-size: 9pt;margin-left:135px;margin-top: 10px;">
				<%-- ${msg} --%>
			</div>
		</div>
	</div>

	<table border="0" width="420" align="center" cellpadding="0" cellspacing="0">
		<tr height="5px"></tr><tr height="2"><td align="right" colspan="3" bgcolor="#EBEBEB"></td></tr><tr height="10px"></tr>
	</table>
	
	<div style="height: 30px;border: 0px solid black;"></div>
</form>
</body>
</html>