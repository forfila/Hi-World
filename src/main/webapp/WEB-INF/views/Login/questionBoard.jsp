<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="resources/css/questionBoard.css">
<meta charset="UTF-8">
<title>Insert title here</title>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>
<div id="body">

	<div id="board_con">
		<div id="boardheader">
			<div id="headertitle">
				문의사항 등록하기
			</div>
		</div>
		<form name="BoardSubmit">
			<input id="title" type="text" name="title" placeholder="제목을 입력하세요."/>	<br /> 
			<textarea id="textarea" rows="10" cols="30" name="content" placeholder="문의사항 내용을 입력하세요. [% 밴을먹은 회원시 아이디 입력은 필수사항 입니다!!]"></textarea> <br />
		</form>
		<button onclick="submit()">등록하기</button>
	</div>
	
</div>
</body>

<script>
		function submit() {
			
			var BoardSubmit = $("form[name=BoardSubmit]").serialize();
			var title = $("#title").val();
			var textarea = $("#textarea").val();
			
			if(title=='' || title == null){
				Swal.fire("제목을 작성해주세요");
			}else{
				if(textarea=='' || textarea == null){
					Swal.fire("내용을 작성해주세요");
				}else{
					$.ajax({
						url : "BoardSubmit.do",
						type : "GET",
						data : BoardSubmit,
						success : function(data) {
							Swal.fire("문의가 등록되었습니다");
							var ajaxOption3={
		                   		 type: "GET",
		                            url : "questionPage.do",
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