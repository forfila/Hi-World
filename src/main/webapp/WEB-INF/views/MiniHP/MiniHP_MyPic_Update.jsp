<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<%
%>
<head>
<link rel="stylesheet" href="${resourcePath }/img${fontCss}" />
<link rel="stylesheet" href="${resourcePath }/img${fontCss}" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

<style type="text/css">
input.upload_text { /*읽기전용 인풋텍스트*/
	float: left;
	width: 230px; /* 버튼 포함 전체 가로 길이*/
	height: 19px;
	line-height: 19px;
	padding: 0 3px;
	border: 1px solid #bbb;
}

div.upload-btn_wrap input.input_file { /*파일찾기 폼 투명하게*/
	position: absolute;
	top: 0;
	right: 0;
	cursor: pointer;
	opacity: 0;
	filter: alpha(opacity = 0);
	-ms-filter: "alpha(opacity=0)";
	-moz-opacity: 0;
}

div.upload-btn_wrap { /*버튼테두리 감싼 div*/
	overflow: hidden;
	position: relative;
	float: left;
	width: 70px; /*width, height 값은 button(찾아보기)값과 같아야함 */
	height: 21px;
	padding-left: 3px;
}

div.upload-btn_wrap button { /*버튼 div*/
	width: 70px;
	height: 21px;
	font-weight: bold;
	background: #333;
	border: 1px solid #333;
	color: #fff;
}
</style>

<script type="text/javascript">

$(function(){
	$('.input_file').change(function(){
		var fileValue = $(this).val().split("\\");
		var fileName = fileValue[fileValue.length-1]; // 파일명

		$('.upload_text').val(fileName);
	});
});

function upload() {
	event.preventDefault();
	
	//Get Form
	var form = $("#uploadForm")[0];
	
	//Create FormData object
	var data = new FormData(form);
	
	$.ajax({
		type : 'POST',
		url : 'miniHp_updateIntroPicture.do',
		enctype : 'multipart/form-data',
		data : data,
		processData : false,
		contentType : false,
		
		success: function(result) {
			window.opener.location.reload();
			window.close();
		}
	})
}
</script>

</head>
<form action="miniHp_updateIntroPicture.do" method="post" id="uploadForm" enctype="multipart/form-data">
	<!--input box-->
	<br>
	<div align="center">
		<img alt="" src="resources/images/로고7.png" style="width: 30%;"><br />
	</div>
	<br><br>
	<input type="text" class="upload_text" name="fileName" readonly="readonly" placeholder=".jpg , .png , .gif 파일만 업로드 할 수 있습니다.">
	<!--button-->
	<div class="upload-btn_wrap">
		<button type="button" title="파일찾기">
			<span style="font-size: 8pt;">파일찾기</span>
		</button>
		<input type="file" accept="image/gif, image/jpeg, image/png" name="uploadFile" class="input_file" title="파일찾기">
	</div>
	<div class="upload-btn_wrap">
		<button type="button" title="업로드" onclick="upload();">
			<span style="font-size: 8pt;">업로드</span>
		</button>
	</div>
</form>

