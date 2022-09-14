<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
	#content-pw{
		text-align: center;
		height: 578px;
		font-size: 40px;
	}
	#password{
		width: 290px;
  		height: 40px;
  		display:block;
 	   	float: left;
   	 	margin-left: 10px;
	}
	#button_pw{
		display:block;
		width: 50px;
	    height: 47px;
	    float: left;
	    margin-left: 5px;
	}
	#pwcheck{
		display: block;
	    height: 56px;
	    margin-top: 5px;
	    float: left;
	    margin-left: 117px;
	}
</style>

<body>
	<div id="content-pw">
		<div>
			<div id="pwcheck">비밀번호 입력</div> 
			<input type="password" name="UserPW" id="password" />
			<input type="button" value="확인" onclick="kaja2()" id="button_pw"/>
		</div>
	</div>
	
</body>
<script>
	
</script>
</html>