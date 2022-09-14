<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
#menuPictureInsert {
  border-collapse: collapse;
  line-height: 1.5;
  border-left: 1px solid #ccc;
  margin: 20px 10px;
  height: 400px;
}

#menuPictureInsert thead th {
  font-weight: bold;
  border-top: 1px solid #ccc;
  border-right: 1px solid #ccc;
  background: #E6E6E6;
}
#menuPictureInsert tbody th {
  font-weight: bold;
  border-right: 1px solid #ccc;
  border-bottom: 1px solid #ccc;
  background: #ececec;
}
#menuPictureInsert td {
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
	<form id="insertForm" name="insertForm" enctype="multipart/form-data">
		<table id="menuPictureInsert">
			<thead>
				<tr>
					<th scope="cols" colspan="2">사진 업로드</th>
				</tr>
			</thead>
			<tbody>
				<tr height="20">
					<th width="20%" scope="row">제목</th>
					<td><input type="text" name="title" id="title" style="width: 300px; outline: none;"></td>
				</tr>
				<tr>
					<td colspan="2">
					<font size="1">내용</font><br>
						<textarea name="content" id="content"></textarea>
					</td>
				</tr>
				<tr>
					<!-- 사진만 업로드 -->
					<th scope="row">사진</th>
					<td>&nbsp;<input type="file" name="file1" id="file" onchange="fileCheck(this)" accept="image/gif,image/jpeg,image/png" style="margin-top: 5px;"></td>
				</tr>
				<tr style="text-align: right">
					<td colspan="2">
						<input type="hidden" value="${folderSerial}" name="folderSerial">
						<input type="button" value="작성완료" onclick="insertPicture();">
						<input type="reset" value="취소">
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

function insertPicture(){
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
	         url : "MiniHpPictureInsert.do", // 요기에
	         processData: false,
	         contentType: false,
	         type : 'POST', 
	         data : formData, 
	         success : function(data) {
	       			var ajaxMain = {
	       		            url : 'miniHpPicture.do?folderSerial='+data,
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
</script>