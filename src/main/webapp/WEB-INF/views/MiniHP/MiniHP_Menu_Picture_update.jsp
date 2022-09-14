<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
#menuUpdatePicture {
  border-collapse: collapse;
  line-height: 1.5;
  border-left: 1px solid #ccc;
  margin: 20px 10px;
  height: 400px;
}

#menuUpdatePicture thead th {
  font-weight: bold;
  border-top: 1px solid #ccc;
  border-right: 1px solid #ccc;
  background: #E6E6E6;
}
#menuUpdatePicture tbody th {
  font-weight: bold;
  border-right: 1px solid #ccc;
  border-bottom: 1px solid #ccc;
  background: #ececec;
}
#menuUpdatePicture td {
  width: 350px;
  vertical-align: top;
  border-right: 1px solid #ccc;
  border-bottom: 1px solid #ccc;
}
#content{
	resize: none;
	width: 450px;
	height: 240px;
}
</style>
<body>
	<form id="updateForm" name="updateForm" enctype="multipart/form-data">
		<table id="menuUpdatePicture">
			<thead>
				<tr>
					<th scope="cols" colspan="2">사진첩 수정</th>
				</tr>
			</thead>
			<tbody>
				<tr height="20">
					<th width="20%" scope="row">제목</th>
					<td><input type="text" name="title" id="title" value="${picture.title}" style="outline: none;"></td>
				</tr>
				<tr>
					<td colspan="2">
					<font size="1">내용</font><br>
						<textarea name="content" id="content">${picture.content}</textarea>
					</td>
				</tr>
				<tr>
					<!-- 파일 업로드 -->
					<th scope="row">파일</th>
					<td>
						<div id="fileArea">
						<c:choose>
							<c:when test="${picture.file!=null}">
								${picture.file}
								<img src="resources/images/x-delete.png" width="10px" height="10px" style="cursor:pointer;" onclick="deleteFile();">
							</c:when>
							<c:otherwise>
								<input type="file" name="file1" id="file" onchange="fileCheck(this)" accept="image/gif,image/jpeg,image/png" style="margin-top: 5px;">
							</c:otherwise>
						</c:choose>
						</div>
					</td>
				</tr>
				<tr style="text-align: right">
					<td colspan="2">
						<input type="hidden" value="${picture.folderSerial}" name="folderSerial" id="folderSerial">
						<input type="hidden" value="${picture.pictureSerial}" name="pictureSerial">
						<input type="hidden" value="${picture.file}" name="file">
						<input type="button" value="수정" onclick="updatePicture();">
					</td>
				</tr>
			</tbody>
		</table>
	</form>
</body>
<script>
//사진만 업로드할수 있게
function fileCheck(obj) {
	pathpoint = obj.value.lastIndexOf('.');
	filepoint = obj.value.substring(pathpoint+1,obj.length);
	filetype = filepoint.toLowerCase();
	if(filetype!='jpg' && filetype!='gif' && filetype!='png' && filetype!='jpeg' && filetype!=''){
		alert('이미지 파일만 선택할 수 있습니다.');
		$("#file").val("");
	}
}
function updatePicture(){
	if($('#title').val()==="")
		alert('제목을 입력하세요');
	else if($('#content').val()==="")
		alert('내용을 입력하세요');
	else if($('#file').val()==="")
		alert('업로드할 사진을 선택해주세요');
	else{
		 var form = $("form")[0];       
	     var formData = new FormData(form);
	
	     $.ajax({
	         cache : false,
	         url : "MiniHpPictureUpdate.do", // 요기에
	         processData: false,
	         contentType: false,
	         type : 'POST', 
	         data : formData, 
	         success : function() {
	        	 var ajaxMain = {
	       	            url : 'miniHpPicture.do?folderSerial='+$('#folderSerial').val(),
	       	            async : true,
	       	            type : "GET",
	       	            dataType : "html",
	       	            cache : false
	       	    };
	       	    
	       	    $.ajax(ajaxMain).done(function(data){
	       	        $('#bodyContents').children().remove();
	       	        $('#bodyContents').html(data);
	       	    });
	         }, 
	         error : function(xhr, status) {
	             alert(xhr + " : " + status);
	         }
	     });
	}
}
function deleteFile() {
	if(confirm("정말 파일을 삭제하시겠습니까?"))
		$('#fileArea').html('<input type="file" name="file1" id="file" onchange="fileCheck(this)" accept="image/gif,image/jpeg,image/png">');
}
</script>