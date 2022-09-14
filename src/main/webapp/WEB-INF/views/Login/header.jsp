<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="resources/css/header.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<script>
	$(document).ready(function(){
		var main = $('.bxslider').bxSlider({
			mode: 'fade',
			auto:true,
			controls:true,
			speed:500

            })
        });
</script>
<title>Document</title>
</head>
<body>
    <ul class="bxslider">
        <li><img src="" alt="사진"></li>
        <li><img src="메인여행배너.jpg" alt=""></li>
        <li><img src="커뮤니티배너.jpg" alt=""></li>
        <li><img src="중고배너.jpg" alt=""></li>
    </ul>
</body>
</html>