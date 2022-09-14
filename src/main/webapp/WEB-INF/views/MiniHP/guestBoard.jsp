<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<style>
	#main{
		height: 330px;
		width: 450px;
		overflow-y: scroll;
		-ms-overflow-style: none;
	}
	#main::-webkit-scrollbar{
		display: none;
	}
</style>
<input type="hidden" id="ownerSerial" value="${ownerSerial}">
<form name="poto">
	<div id="nowFolder" style="text-align: left; padding-left: 20px; font-size: 15px; font-weight: bold;color: #1294AB;">
		${currentFolderName}
	</div>
	<img src="${pageContext.request.contextPath}/resources/images/bar.jpg" width="420" height="6" border="0" alt="">
	
	<!-- 게시판 -->
	<div id="main">
	<c:choose>
		<c:when test="${list==null}">
			<h3>등록된 글이 없습니다</h3>
		</c:when>
		<c:otherwise>
			<table style="table-layout: fixed;">
				<tr>
					<th style="width: 40%;">제목</th>
					<th style="width: 20%">작성자</th>
					<th style="width: 100px;">작성일</th>
					<th style="width: 10%">조회</th>
				</tr>
				<c:forEach items="${list}" var="l">
				<tr>
					<td style="width: 30%; height: 5px;word-break:break-all;" >
						<span onclick="moveDetailPage('${l.boardSerial}');" onmouseover="this.style.color='#FF5E00'; this.style.cursor='pointer';" onmouseout="this.style.color='black';" >
						<c:out value="${l.title}" />
						<!-- 댓글 개수 출력 -->
						[${l.replyCnt}]
						</span>
						<!-- 게시글 등록되고 3일동안 new 아이콘 표시 -->
						<c:set var="now" value="<%=new java.util.Date()%>" /><!-- 현재시간 -->
						<fmt:parseNumber value="${now.time / (1000*60*60*24)}" integerOnly="true" var="today" /><!-- 현재시간을 숫자로 -->
						<fmt:parseNumber value="${l.cDate.time / (1000*60*60*24)}" integerOnly="true" var="chgDttm" /><!-- 게시글 작성날짜를 숫자로 -->
						<c:if test="${today - chgDttm le 3}"><!-- 3일동안은 new 표시 -->
							<i><img src="resources/images/new.png" width="12px" alt="new" /></i>
						</c:if>
						<!-- 파일 있을시 파일 아이콘 표시 -->
						<c:if test="${l.file!=null}">
							<img alt="file" src="resources/images/disk-file.png" width="10px">
						</c:if>
					</td>
					<td style="height: 5px;word-break:break-all; text-align: center;">${l.userName}</td>
					<td style="height: 5px;word-break:break-all; text-align: center;">
						<fmt:formatDate value="${l.uDate}" pattern="yyyy-MM-dd"/>
					</td>
					<td style="height: 5px;word-break:break-all; text-align: center;">${l.hit}</td>
				</tr>
				</c:forEach>
			</table>
		</c:otherwise>
	</c:choose>
	</div>
	<input id="currentFolderSerial" type="hidden" value="${currentFolderSerial}">
     <div>
        <c:if test="${pagination.curRange ne 1 }">
            <a href="#" onClick="fn_paging(1)">[처음]</a> 
        </c:if>
        <c:if test="${pagination.curPage ne 1}">
            <a href="#" onClick="fn_paging('${pagination.prevPage }')">[이전]</a> 
        </c:if>
        <c:forEach var="pageNum" begin="${pagination.startPage }" end="${pagination.endPage }">
            <c:choose>
                <c:when test="${pageNum eq  pagination.curPage}">
                    <span style="font-weight: bold;"><a href="#" onClick="fn_paging('${pageNum }')">${pageNum }</a></span> 
                </c:when>
                <c:otherwise>
                    <a href="#" onClick="fn_paging('${pageNum }')">${pageNum }</a> 
                </c:otherwise>
            </c:choose>
        </c:forEach>
        <c:if test="${pagination.curPage ne pagination.pageCnt && pagination.pageCnt > 0}">
            <a href="#" onClick="fn_paging('${pagination.nextPage }')">[다음]</a> 
        </c:if>
        <c:if test="${pagination.curRange ne pagination.rangeCnt && pagination.rangeCnt > 0}">
            <a href="#" onClick="fn_paging('${pagination.pageCnt }')">[끝]</a> 
        </c:if>
    </div>
	
	<img src="${pageContext.request.contextPath}/resources/images/bar.jpg" width="420" height="6" border="0" alt="">
</form>
<script>
//주인 시리얼 고정
var ownerSerial = $('#ownerSerial').val();
//게시물 제목 클릭시 상세 페이지로 넘어감
function moveDetailPage(boardSerial){
    var ajaxOption = {
            url : "MiniHpBoardGuestDetail.do?serial="+boardSerial+"&ownerSerial="+ownerSerial,
            async : true,
            type : "GET",
            dataType : "html",
            cache : false
    };
    
    $.ajax(ajaxOption).done(function(data){
        $('#bodyContents').children().remove();
        $('#bodyContents').html(data);
    });
}
//페이징
function fn_paging(curPage) {
	var folderSerial = $('#currentFolderSerial').val();
	var ajaxMain = {
	        url : 'miniHpBoardGuest.do?folderSerial='+folderSerial+"&curPage="+curPage+"&ownerSerial="+ownerSerial,
	        async : true,
	        type : "GET",
	        dataType : "html",
	        cache : false
	};
	
	$.ajax(ajaxMain).done(function(data){
	    $('#bodyContents').children().remove();
	    $('#bodyContents').html(data);
	});
}
</script>