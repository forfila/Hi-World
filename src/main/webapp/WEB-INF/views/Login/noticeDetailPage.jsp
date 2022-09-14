<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="resources/css/noticeDetailPage.css">
</head>
<body>
	<div id="noticeDCon">
		<table id="noticeDtable">
			<tr>
				<td style="font-weight: 600;color: orangered;">${boardVO.title}</td>
			</tr>
			<tr> 
				<td><textarea rows="20" cols="80" readonly disabled>${boardVO.content}</textarea></td>
			</tr>
			
		</table>
	
		<table >
			<tr id="replyTable">
				<td style="width: 400px;font-weight: 600;color:orangered;">댓글</td>
				<td style="width: 175px;font-weight: 600;color:orangered;">작성자</td>
				<td style="width: 112px;font-weight: 600;color:orangered;">작성일</td>
				<td></td>
			</tr>
			<c:choose>
				<c:when test="${list != '[]'}">
					<c:forEach var="kinds" items="${list}">
						<tr id="${kinds.replySerial}">
							<td>${kinds.replyContent}</td>
							<td>${kinds.userID}</td>
							<td>${kinds.cDate}</td>
						<c:if test="${sessionVO.userSerial == kinds.userSerial || sessionVO.userSerial == 1}">
							<td style="width:50px;" class="noticehover" onclick="deleteReply('${kinds.replySerial}')">삭제</td>
						</c:if>
						<c:if test="${sessionVO.userSerial != kinds.userSerial}">
							<td style="width:50px;"></td>
						</c:if>
						</tr>
					</c:forEach>
				</c:when>
			
				<c:otherwise>
					<tr id="none">
						<td colspan="4">등록된 댓글이 없습니다.</td>
					</tr>
				</c:otherwise>
			</c:choose>
		</table>
		<form name="reply" id="reply">
			<input type="text" placeholder="댓글 작성하세요" name="replyContent" id="replyContent"/>
			<input type="hidden" name="boardSerial" value="${boardVO.boardSerial}" />
			<button type="button" onclick="replyInsert()">댓글등록</button>
		</form>
	</div>
			

	
</body>

<script>
	function replyInsert() {
		var userSerial = '${sessionVO.userSerial}';
		if(userSerial!=''){
			var reply = $("form[name=reply]").serialize();
			$.ajax({
				url : 'replyInsert.do',
				type : "GET",
				data : reply,
				dataType : "text",
				success : function(data) {
					$('#replyTable').after(data);			
					$('#none').remove();
					$('#replyContent').val('');
				}
			})
		}else{
			Swal.fire("로그인 후 이용해주세요");
		}
	}
	
	function deleteReply(replySerial) {
		console.log(replySerial);
		$.ajax({
			url : "deleteReply.do",
			type : "GET",
			data : {"replySerial":replySerial},
			success : function(data) {
				$('#'+replySerial).remove();
			}
		})
	}
	

</script>

</html>