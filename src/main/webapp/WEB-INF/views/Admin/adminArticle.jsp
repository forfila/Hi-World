<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link href="resources/css/adminArticle.css?after" rel="stylesheet">
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
<div id="article_con">
	<div id="article_box">
		
		<h1>상품 업로드 관리자용</h1>
	
		<div class="uploadDiv">
			사진  <input type="file" name="uploadFile" multiple id="uploadFile" accept="image/gif,image/jpeg,image/png,audio.*" />
			</div>
				상품 종류 : <select name="ArticleKinds">
							<option value="">종류를 선택하세요</option>
							<option value="캐릭터">캐릭터</option>
							<option value="배경">배경화면</option>
							<option value="음악">배경음악</option>
							<option value="마우스">마우스</option>
							<option value="스킨">스킨</option>
				 		 </select> <br /> 
				상품 이름 : <input type="text" name="ArticleName" id="ArticleFile" />	<br /> 
				상품 가격 : <input type="number" name="ArticlePrice" /> <br />
				<textarea rows="10" cols="30" name="ArticleContent"	placeholder="상품 설명을 간단히 작성하세요"></textarea>
		
		
				<button id="uploadBtn">업로드</button>
			</div>
		</div>
</body>

<script>
	$("#uploadBtn").on("click", function(e) {
		var formData = new FormData();
		var inputFile = $("input[name='uploadFile']");
		var files = inputFile[0].files;
		console.log(files);
		
		var ArticleName = $("input[name='ArticleName']").val();
		var ArticlePrice = $("input[name='ArticlePrice']").val();
		var ArticleKinds = $("select[name='ArticleKinds']").val();
		var ArticleContent = $("textarea[name='ArticleContent']").val();
		
		var file = document.getElementById('uploadFile');
		//파일 경로.
		var filePath = file.value;
		//전체경로를 \ 나눔.
		var filePathSplit = filePath.split('\\'); 
		//전체경로를 \로 나눈 길이.
		var filePathLength = filePathSplit.length;
		//마지막 경로를 .으로 나눔.
		var fileNameSplit = filePathSplit[filePathLength-1].split('.');
		//파일명 : .으로 나눈 앞부분
		var fileName = fileNameSplit[0];
		//파일 확장자 : .으로 나눈 뒷부분
		var fileExt = fileNameSplit[1];
		
		var ArticleImg = fileName+"."+fileExt;
		
		console.log(ArticleImg);
		
		for (var i = 0; i < files.length; i++) {
			formData.append("uploadFile", files[i]);
		}
		if(ArticleKinds==''){
			Swal.fire("종류를 선택하세요");
		}else{
			$.ajax({
				url : 'ArticleUpload.do',
				processData : false,
				contentType : false,
				data : formData,
				type : 'POST',
				success : function(result) {
					if (result == 1) {
						/* 업로드 성공 */
						
						
						/* 디비 등록 */
						$.ajax({
							type : "GET",
							url : "ArticleEnroll.do",
							data : {
								"ArticleImg":ArticleImg,
								"ArticleName":ArticleName,
								"ArticlePrice":ArticlePrice,
								"ArticleKinds":ArticleKinds,
								"ArticleContent":ArticleContent,
							},
							success : function(result){
								/* 성공 */
								console.log('성공');
								Swal.fire("등록되었습니다")
								
								var ajaxOption2={
				                		 type: "GET",
				                         url : "sangpoom.do",
				                         data: {"list":"쇼핑"},
				                         dataType : "html", 
				                         async:true,
				                         cache:false
				                 }

				            	  $.ajax(ajaxOption2).done(function(data){
				            		  //Contents 영역삭제
				            		  $('#bodyContext').children().remove();
				            		  console.log("1111") 
				            		  //Contents 영역 교체
				            		  $('#bodyContext').html(data);
				            	  })
							}
						})
						
					} else {
						/* 업로드 실패 */
						console.log('실패');
						Swal.fire("등록실패")
					}
				}
			})
		}
		
	})
</script>

</html>