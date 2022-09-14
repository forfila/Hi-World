<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입 완료 메세지 jsp</title>
<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/images/파비콘.png" type="image/x-icon">
<link rel="icon" href="${pageContext.request.contextPath}/resources/images/파비콘.png" type="image/x-icon">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<style type="text/css">
div{
text-align: center;
}
#img_hade{
	width: 280px;
	margin-top: 8%;
}
h1{
	font-size: 40px;
	color: rgb(243,105,4);
	margin-bottom: 0px;
}
#span{
	color: #7f5858;
}
h3{
	margin-top: 0px;
	color: #8e8e8c;
}
.page {
	width: 100vw;
	height: 100vh;
	display: flex;
	justify-content: center;
}

/* toggle this class */

.color-bg-start {
	background-color: salmon;
}


/* toggle class bg-animate-color */

.bg-animate-color {
	animation: random-bg .5s linear infinite;
}


/* add animation to bg color  */

@keyframes random-bg {
  from {
    filter: hue-rotate(0);
  }
  to {
    filter: hue-rotate(360deg);
  }
}

.fun-btn {
	background-color: salmon;
	color: white;
	padding: 2em 3em;
	border: none;
	transition: all .3s ease;
	border-radius: 5px;
	letter-spacing: 2px;
	outline: none;
	align-self: center;
	cursor: pointer;
	font-weight: bold;
}

.fun-btn:hover {
  animation: random-bg .5s linear infinite, grow 1300ms ease infinite;
}

.start-fun {
  background-color: #fff !important;
  color: salmon !important;
}

@keyframes grow {
  0% {
    transform: scale(1);
  }
  14% {
    transform: scale(1.3);
  }
  28% {
    transform: scale(1);
  }
  42% {
    transform: scale(1.3);
  }
  70% {
    transform: scale(1);
  }
}
</style>
<script>
$('.fun-btn').on('click', function(event) {
	  $(this).toggleClass('start-fun');
	  var $page = $('.page');
	  $page.toggleClass('color-bg-start')
	    .toggleClass('bg-animate-color');

	  //change text when when button is clicked

	  $(this).hasClass('start-fun') ?
	    $(this).text('stop the fun') :
	    $(this).text('start the fun');
	});
</script>
</head>
<body onbeforeunload="main()">
	<div id="main">
		<div>
			<div>
				<div>
					<img id="img_hade" alt="로고사진" src="resources/images/로고7.png">

					<h1>Hi - World <span id="span">회원가입이 완료</span>되었습니다.</h1>
					<h3>회원님은 Hi - World의 기능을 사용하실수 있습니다. 로그인 후 이용 가능합니다.</h3>
					<div>

						<button class="fun-btn" onclick="location.href='login.do'">Hi - World로 가기</button>

					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>