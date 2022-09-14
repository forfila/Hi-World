<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
#menuUpdateBoard {
  border-collapse: collapse;
  line-height: 1.5;
  border-left: 1px solid #ccc;
  margin: 20px 10px;
  height: 400px;
}

#menuUpdateBoard thead th {
  font-weight: bold;
  border-top: 1px solid #ccc;
  border-right: 1px solid #ccc;
  background: #E6E6E6;
}
#menuUpdateBoard tbody th {
  font-weight: bold;
  border-right: 1px solid #ccc;
  border-bottom: 1px solid #ccc;
  background: #ececec;
}
#menuUpdateBoard td {
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
		<table id="menuUpdateBoard">
			<thead>
				<tr>
					<th scope="cols" colspan="2">게시물 수정</th>
				</tr>
			</thead>
			<tbody>
				<tr height="20">
					<th width="20%" scope="row">제목</th>
					<td><input type="text" name="title" id="title" value="${board.title}" style="outline: none;"></td>
				</tr>
				<tr>
					<td colspan="2">
					<font size="1">내용</font><br>
						<textarea name="content" id="content">${board.content}</textarea>
					</td>
				</tr>
				<tr>
					<!-- 파일 업로드 -->
					<th scope="row">파일</th>
					<td>
						<div id="fileArea">
						<c:choose>
							<c:when test="${board.file!=null}">
								${board.file}
								<img src="resources/images/x-delete.png" width="10px" height="10px" style="cursor:pointer;" onclick="deleteFile();">
								<!-- <input type="button" value="삭제" onclick="deleteFile();"> -->
							</c:when>
							<c:otherwise>
								<input type="file" name="file1" id="file" style="margin-top: 5px;">
							</c:otherwise>
						</c:choose>
						</div>
					</td>
				</tr>
				<tr style="text-align: right">
					<td colspan="2">
						<input type="hidden" value="${board.boardSerial}" name="boardSerial">
						<input type="hidden" value="${board.file}" name="file">
						<input type="button" value="수정" onclick="updateBoard();">
					</td>
				</tr>
			</tbody>
		</table>
	</form>
</body>
<script>
function updateBoard(){
	if($('#title').val()==="")
		alert('제목을 입력하세요');
	else if($('#content').val()==="")
		alert('내용을 입력하세요');
	else{
		 var form = $("form")[0];       
	     var formData = new FormData(form);
	
	     $.ajax({
	         cache : false,
	         url : "MiniHpBoardUpdate.do", // 요기에
	         processData: false,
	         contentType: false,
	         type : 'POST', 
	         data : formData, 
	         success : function(data) {
	        	 $('#bodyContents').children().remove();
		        $('#bodyContents').html(data);
	         }, 
	         error : function(xhr, status) {
	             alert(xhr + " : " + status);
	         }
	     });
	}
}
function deleteFile() {
	if(confirm("정말 파일을 삭제하시겠습니까?"))
		$('#fileArea').html('<input type="file" name="file1" id="file">');
}
</script>