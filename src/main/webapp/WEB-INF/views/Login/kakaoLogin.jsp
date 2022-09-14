<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8"/>
<title>Login Demo - Kakao JavaScript SDK</title>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>


<style>
	.button > img{
		width: 150px;
		height: 33px;
	}
</style>


</head>
<body>
<a href="http://developers.kakao.com/logout">logout</a>
<a href="#" onclick="mykakao()">mykakao</a>
<a id="kakao-login-btn" class="button"></a>
<script>
    Kakao.init('f5c86bb2fcdff7b7a5ee465e8109c2a1');
    Kakao.isInitialized();
    

    Kakao.Auth.createLoginButton({ 
    	container: '#kakao-login-btn', 
    	success: function(authObj) { 
    		Kakao.API.request({
        	    url: '/v2/user/me',
        	    success: function(data) {
        	    	var UserID = data.id
        	    	var UserName = data.properties.nickname
        	    	location.href="kakaoLogin.do?UserID="+UserID+"&&UserName="+UserName
        	    	
        	      }
        	});		
    		}, 
    	fail: function(err) { 
    		alert(JSON.stringify(err)); 
    		} 
    	});

 	
</script>

</body>
</html>

