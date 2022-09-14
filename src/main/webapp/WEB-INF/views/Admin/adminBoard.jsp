<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	board_con h1,input,textarea{
		margin-bottom:10px;
	}
	
	#boardheader{
		margin-bottom:10px;
		font-size:x-large;
	}
	textarea{
	    width: 279px;
    	height: 163px;
    	font-family:'SDSamliphopangche_Outline';
	}
	button {
		font-family:'SDSamliphopangche_Outline';
	}
	
	
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>

<body>
	<div id="board_con" style="text-align: center;padding-top: 150px;">
		<div id="boardheader">공지사항 등록하기</div>
		<form name="BoardSubmit">
			공지사항 제목 <input type="text" id="title" name="title"/>	<br /> 
			<textarea rows="10" cols="30" id="textarea" name="content" placeholder="공지사항 내용을 입력하세요."></textarea> <br />
		</form>
		<button onclick="submit()">등록하기</button>
	</div>
</body>

	<script>
		function submit() {
			
			var BoardSubmit = $("form[name=BoardSubmit]").serialize();
			var title = $("#title").val();
			var textarea = $("#textarea").val();
			
			if(title=='' || title == null){
				Swal.fire("제목을 작성하세요");
			}else{
				if(textarea=='' || textarea == null){
					Swal.fire("내용을 작성하세요");
				}else{
					$.ajax({
						url : "BoardSubmit.do",
						type : "GET",
						data : BoardSubmit,
						success : function(data) {
							Swal.fire("등록되었습니다");
							var ajaxOption3={
		                   		 type: "GET",
		                            url : "noticePage.do",
		                            dataType : "html", 
		                            async:true,
		                            cache:false
		                    	}
		               	 	$.ajax(ajaxOption3).done(function(data){
		               		  //Contents 영역 교체
		               		  	$('#bodyContext').html(data);
		               	 	 })
						}
					})
				}
			}
		}
	</script>

</html>