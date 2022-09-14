<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<style>
	table.videoTable {
	  border-collapse: collapse;
	  text-align: left;
	  line-height: 1.5;
	  margin: 20px 10px;
	  width: 410px;
	}
	
	table.videoTable thead th {
	  border-bottom: 1px dotted #ccc;
	  font-weight: normal;
	}
	table.videoTable tbody th {
	  vertical-align: top;
	  border-bottom: 1px dotted #ccc;
	  background: #ececec;
	}
	table.videoTable td {
	  vertical-align: top;
	  border-bottom: 1px dotted #ccc;
	}
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
<script>
//글쓰기 버튼 클릭시
function moveInsertPage(){
	var currentFolderSerial = $('#currentFolderSerial').val();
    var ajaxOption = {
            url : "MiniHpVideoInsert.do/"+currentFolderSerial,
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
function showPopup(serial) {
	window.open("updateVideoFolder.do?serial="+serial, "동영상 폴더 이동", "width=400, height=300, left=100, top=50");
}
function goToFolder(folderSerial) {
	var ajaxMain = {
            url : 'miniHpVideo.do?folderSerial='+folderSerial,
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
function deleteVideo(videoSerial,file,folderSerial) {
	if(confirm("정말 삭제하시겠습니까?")){
		$.ajax({
			type: 'DELETE',
			url: 'miniHpVideo.do?videoSerial='+videoSerial+"&fileName="+file,
			datatype: 'html'
		}).done(function(data) {
			goToFolder(folderSerial);
		}).fail(function(error) {
			alert(JSON.stringify(error));
		});
	}
}
function updateVideo(videoSerial) {
	var ajaxMain = {
            url : 'MiniHpVideoUpdate.do?serial='+videoSerial,
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
//댓글 작성 화면 펼치기
function showReplyForm(serial) {
	$('#replyInsertForm-'+serial).toggle();
}
//댓글
/* function getReplyAll(videoSerial) {
	var ajaxReply = {
            url : 'MiniHpVideoReply.do?videoSerial='+videoSerial,
            async : true,
            type : "GET",
            dataType : "html",
            cache : false
    };
    
    $.ajax(ajaxReply).done(function(data){
		$('#reply-'+videoSerial).html(data);
    });
} */

function insertReply(videoSerial) {
	var replyContent = $('#replyContent-'+videoSerial).val();
	if(replyContent==="")
		alert('내용을 입력하세요');
	else{
		var data = {
			replyContent : replyContent,
			videoSerial : videoSerial
		}
		console.log(JSON.stringify(data));
		$.ajax({
			type: 'POST',
			url: 'MiniHpVideoReply.do',
			datatype: 'json',
			contentType:'application/json; charset=utf-8',
			data: JSON.stringify(data)
		}).done(function() {
			//var currentFolderSerial = $('#currentFolderSerial').val();
			//goToFolder(currentFolderSerial);
			$("#replyTbody-"+videoSerial).load("MiniHpVideoReply.do?videoSerial="+videoSerial);
		}).fail(function(error) {
			alert(JSON.stringify(error));
		});
	}
}
function deleteReply(videoSerial,serial) {
	if(confirm("정말 삭제하시겠습니까?")){
		$.ajax({
			type: 'DELETE',
			url: 'MiniHpVideoReply.do/'+serial,
			datatype: 'json',
			contentType:'application/json; charset=utf-8'
		}).done(function(data) {
			//var currentFolderSerial = $('#currentFolderSerial').val();
			//goToFolder(currentFolderSerial);
			$("#replyTbody-"+videoSerial).load("MiniHpVideoReply.do?videoSerial="+videoSerial);
		}).fail(function(error) {
			alert(JSON.stringify(error));
		});
	}
}
//update 칸 만들기
function updateReplyForm(serial) {
	$('#reply-'+serial).toggle();
	$('#replyForm-'+serial).toggle();
}
function updateReply(videoSerial,serial) {
	var content = $('#updateReplyContent-'+serial).val();
	if(content==="")
		alert('내용을 입력하세요');
	else{
		console.log(content);
		$.ajax({
			type: 'PUT',
			url: 'MiniHpVideoReply.do/'+serial+'/'+content,
			datatype: 'json',
			contentType:'application/json; charset=utf-8'
		}).done(function() {
			//var currentFolderSerial = $('#currentFolderSerial').val();
			//goToFolder(currentFolderSerial);
			$("#replyTbody-"+videoSerial).load("MiniHpVideoReply.do?videoSerial="+videoSerial);
		}).fail(function(error) {
			alert(JSON.stringify(error));
		});
	}
}
//페이징
function fn_paging(curPage) {
	var folderSerial = $('#currentFolderSerial').val();
	var ajaxMain = {
	        url : 'miniHpVideo.do?folderSerial='+folderSerial+"&curPage="+curPage,
	        async : true,
	        type : "GET",
	        dataType : "html",
	        cache : false
	};
	
	$.ajax(ajaxMain).done(function(data){
	    // Contents 영역 삭제
	    $('#bodyContents').children().remove();
	    // Contents 영역 교체
	    $('#bodyContents').html(data);
	});
}
</script>
<form name="poto">
	<div id="nowFolder" style="float: left; padding-left: 30px; font-size: 15px; font-weight: bold;color: #1294AB;">
		${currentFolderName}
	</div>
	<div id="write-btn" style="float: right; padding-right: 30px;">
		<button type="button" onclick="moveInsertPage();"><img alt="" src="resources/images/reply-pen.png" width="10px">동영상올리기</button>
	</div>
	<img src="${pageContext.request.contextPath}/resources/images/bar.jpg" width="420" height="6" border="0" alt="">
	
	
	<div id="main">
	<c:choose>
		<c:when test="${list==null}">
			<h3>등록된 동영상이 없습니다</h3>
		</c:when>
		<c:otherwise>
			<table class="videoTable">
				<c:forEach items="${list}" var="l">
				<tbody>
					<tr style=" border-bottom: none;">
				  		<th>
				  			<font style="font-weight: bold;"><c:out value="${l.title}" /></font>
				  			<span style="float: right;">
				  				<span onclick="showPopup('${l.videoSerial}');" onmouseover="this.style.color='#FF5E00'; this.style.cursor='pointer';" onmouseout="this.style.color='black';" style="font-size:10pt;">이동</span>
				  				<span onclick="deleteVideo('${l.videoSerial}','${l.file}','${l.folderSerial}');" onmouseover="this.style.color='#FF5E00'; this.style.cursor='pointer';" onmouseout="this.style.color='black';" style="font-size:10pt;">삭제</span>
				  				<span onclick="updateVideo('${l.videoSerial}');" onmouseover="this.style.color='#FF5E00'; this.style.cursor='pointer';" onmouseout="this.style.color='black';" style="font-size:10pt;">수정</span>
				  			</span>
				  		</th>
					</tr>
				</tbody>
				<tbody>
					<tr>
						<td scope="row">
							${l.userName}
							<span style="font-size: 5px; float: right; padding-top: 5px;">
							(<fmt:formatDate value="${l.uDate}" pattern="yyyy-MM-dd"/>)
							</span>
						</td>
					</tr>
					<c:if test="${l.file!=null}">
					<tr>
			  			<td style="border-bottom: none;">
							<video src="resources/upload/${l.file}" style="max-width: 100%" controls>
								해당 브라우저에서는 지원하지 않습니다.
							</video>
						</td>
					</tr>
					</c:if>
					<tr>
			 			<td>
			 				<span class="secondFont" style="width: 400px; text-overflow: ellipsis; overflow: hidden;">
			 					<pre><c:out value="${l.content}" /></pre>
			 				</span>
						</td>
					</tr>
				</tbody>
				<script>
					//getReplyAll('${l.videoSerial}');
					$("#replyTbody-"+'${l.videoSerial}').load("MiniHpVideoReply.do?videoSerial=${l.videoSerial}");
				</script>
				<tbody id="replyTbody-${l.videoSerial}">
				
				</tbody>
				<tr><td style="border-bottom: none;"><br><br></td></tr>
				</c:forEach>
			</table>
		</c:otherwise>
	</c:choose>
	     <!-- 페이징 -->
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
	</div>
	<input id="currentFolderSerial" type="hidden" value="${currentFolderSerial}">
	
	<img src="${pageContext.request.contextPath}/resources/images/bar.jpg" width="420" height="6" border="0" alt="">
</form>
