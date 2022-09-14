<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<title>Document</title>
<link rel="stylesheet" href="resources/css/noticePage.css">
</head>
<body>

	<div id="Context">
		<div id="noticetitle">
			<p>공지사항</p>	
		</div>
		<c:choose>
			<c:when test="${list != '[]'}">
				<table>
					<tr style="border-top:none">
						<td>NO.</td>
						<td>제목</td>
						<td>작성자</td>
						<td>작성일</td>
						<td>조회수</td>
						<td></td>
					</tr>
					<c:set var="number" value="${number}"/>
					<c:forEach var="kinds" items="${list}">
						<tr id="${kinds.boardSerial}">
							<td>${number}</td>
							<td><a href="#" class="noticemainhover" onclick="boardView('${kinds.boardSerial}')">${kinds.title}</a></td>
							<td>${kinds.userName}</td>
							<td>${kinds.cDate}</td>
							<td>${kinds.lookUp}</td>
							<c:if test="${sessionVO.userSerial eq kinds.userSerial}">
								<td><p  id="deletenotice" onclick="deleteBoard('${kinds.boardSerial}')">삭제</p></td>
							</c:if>
						</tr>
					<c:set var="number" value="${number+1}"/>
					</c:forEach>
				</table>
			</c:when>

	<c:otherwise>
		등록된 공지사항이 없습니다
	</c:otherwise>

	</c:choose>
	
		
		
		
		
		
		
		<div style="text-align: center; margin-top: 10px;">
        <c:if test="${pagination.curRange ne 1 }">
            <a href="#" class="noticehover" onClick="fn_paging(1)">[처음]</a> 
        </c:if>
        <c:if test="${pagination.curPage ne 1}">
            <a href="#" class="noticehover" onClick="fn_paging('${pagination.prevPage }')">[이전]</a> 
        </c:if>
        <c:if test="${listCnt > 15}">
        <c:forEach var="pageNum" begin="${pagination.startPage}" end="${pagination.endPage }">
            <c:choose>
                <c:when test="${pageNum eq  pagination.curPage}">
                    <span style="font-weight: bold;"><a href="#" class="noticehover" onClick="fn_paging('${pageNum }')">${pageNum }</a></span> 
                </c:when>
                <c:otherwise>
                    <a href="#" class="noticehover" onClick="fn_paging('${pageNum }')">${pageNum }</a> 
                </c:otherwise>
            </c:choose>
        </c:forEach>
        </c:if>
        <c:if test="${pagination.curPage ne pagination.pageCnt && pagination.pageCnt > 0}">
            <a href="#" class="noticehover" onClick="fn_paging('${pagination.nextPage }')">[다음]</a> 
        </c:if>
        <c:if test="${pagination.curRange ne pagination.rangeCnt && pagination.rangeCnt > 0}">
            <a href="#" class="noticehover" onClick="fn_paging('${pagination.pageCnt }')">[끝]</a> 
        </c:if>
		</div>
		
		
	</div>
		
		
		
		
	
</body>

<script>
	function boardView(boardSerial) {
		$.ajax({
			url : "boardView.do",
			type : "GET",
			data : {"boardSerial" : boardSerial},
			success : function(data) {
				$('#Context').html(data);
			}
		})
	}
	
	function deleteBoard(boardSerial) {
		$.ajax({
			url : "deleteBoard.do",
			type : "GET",
			data : {"boardSerial" : boardSerial},
			success : function(data) {
				$("#"+boardSerial).remove();
			}
		})
	}
	
	function fn_paging(curPage) {
	    var ajaxMain = {
	            url : 'noticePage.do?curPage='+curPage,
	            async : true,
	            type : "GET",
	            dataType : "html",
	            cache : false
	    };

	    $.ajax(ajaxMain).done(function(data){
	        $('#Context').children().remove();
	    	// Contents 영역 교체
	        $('#Context').html(data);
	    });
	}
</script>

</html>