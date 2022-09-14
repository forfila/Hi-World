<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<style>
	#main{
		height: 400px;
		width: 450px;
		overflow-x: hidden;
		
		/* border-bottom: 2px solid blue;
		border-top: 2px solid blue; */
	}
	
	#writeFrame{
		height: 150px;
		border-bottom: 1px solid gray;
		border-top: 1px solid gray;
		background-color: #FAFAFA;
		
	}
	#writeForm{
		margin-top: 10px;
		margin-bottom: 10px;
		margin-left: 10px;
		margin-right: 10px;
		height: 100px;
		
		/* border-bottom: 2px solid pink;
		border-top: 2px solid pink; */
	}
	.bookBtns{
		float: right;
		margin-right: 10px;
		background-color: white;
		border: 1px solid gray;
		border-radius: 5px;
	}
	.bookMiniMeFrame{
		height: 100%;
		width: 25%;
		float: left;
		background-color: white;
	}
	.bookMiniMe{
		height: 100%;
	}
	.ta{
		resize: none;
		height: 100%;
		width: 70%;
		float: right;
	}
	.books{
		margin-top: 30px;
		height: 120px;
		border-top: 1px solid gray;
		
		/* border-bottom: 2px solid pink; */
	}
	.booksTop{
		background-color: #F2F2F2;
		height: 20%;
	}
	.booksTop-left{
		float: left;
	}
	.booksTop-right{
		float: right;
	}
	.booksMiddle{
		height: 80%;
	}
	.booksContent{
		float: left;
		width: 70%;
		height: auto;
		text-align: left;
		overflow: hidden;
	}
	.booksReply{
		/* height: auto; */
		/* border-top: 1px solid red;
		border-bottom: 1px solid red; */
	}
	.replys{
		/* width: 100%;
		background-color: #F2F2F2; */
		/* height: 10px; */
	}
	.btns{
		font-size:10pt;
	}
	.date{
		font-size:10pt;
		color: gray;
	}
	.taUpdate{
		resize: none;
		height: 70%;
		width: 70%;
		float: right;
	}
	.insertReplyArea{
		height: 50px;
		background-color: #F2F2F2;
	}
	.insertReplyForm{
		margin-top: 5px;
		margin-left: 5px;
		margin-right: 5px;
		width: 360px;
		resize: none;
		float: left;
	}
	.bookBigBtns{
		float: right;
		margin-right: 10px;
		margin-top: 5px;
		height: 35px;
		background-color: white;
		border: 1px solid gray;
		border-radius: 5px;
	}
	.replySrc{
		width: 100%;
		background-color: #F2F2F2;
		text-align: left;
	}
	#secretArea{
		float: left;
		margin-left: 10px;
		font-size: 12px;
	}
</style>
<input type="hidden" id="ownerSerial" value="${ownerSerial}">
<div id="main">
	<div id="writeFrame">
		<div id="writeForm">
			<div class="bookMiniMeFrame">
				<img class="bookMiniMe" alt="미니미" src="${writerMiniMe}">
			</div>
			<textarea class="ta" id="bookWriteContent"></textarea>
		</div>
		<span id="secretArea">
			<input type="checkbox" name="secretCheck">
			비밀로 하기
		</span>
		<input id="bookInsertBtn" class="bookBtns" type="button" value="확인">
	</div>
	
	<c:forEach items="${list}" var="l">
	<c:if test="${l.isSecret==0 || l.writeUserSerial==sessionVO.userSerial}">
		<div class="books">
			<div class="booksTop" style='<c:if test="${l.isSecret==1}">background-color: #FAFABE;</c:if>'>
				<span class="booksTop-left">
					<span>${l.writeUserName}</span>
					<span class="date">(<fmt:formatDate value="${l.uDate}" pattern="yyyy-MM-dd HH:mm"/>)</span>
				</span>
				<c:if test="${l.writeUserSerial==sessionVO.userSerial}">
				<span class="booksTop-right">
					<c:if test="${l.isSecret==0}">
						<span class="btns" onclick="changeSecret('${l.bookSerial}',1)">비밀로 하기</span>
					</c:if>
					<c:if test="${l.isSecret==1}">
						<span class="btns" onclick="changeSecret('${l.bookSerial}',0)">공개로 하기</span>
					</c:if>
					<span class="btns" onclick="updateBookForm('${l.bookSerial}');">수정</span><!-- 글쓴이만 가능하게 -->
					<span class="btns" onclick="deleteBook('${l.bookSerial}')">삭제</span><!-- 글쓴이+홈피주인 -->
				</span>
				</c:if>
			</div>
			<div class="booksMiddle">
				<span class="bookMiniMeFrame">
					<img class="bookMiniMe" alt="미니미" src="${l.miniMe}">
				</span>
				<span id="booksContent-${l.bookSerial}" class="booksContent">
					<c:if test="${l.isSecret==1}">
						<img alt="lock" src="resources/images/book-lock.png" width="10">
						<font style="color: #FFC31F; font-weight: bold;">비밀이야</font>
						<span style="color: #FFC31F; font-size: 12px;">(이 글은 홈주인과 작성자만 볼 수 있어요)</span>
						<br>
					</c:if>
					<span class="secondFont" style="height: 80px;display: flex;align-items: center;overflow: hidden;"><c:out value="${l.content}" /></span>
				</span>
				<span id="booksContentUpdate-${l.bookSerial}" style="display: none;">
					<textarea class="taUpdate" id="updateContent-${l.bookSerial}">${l.content}</textarea><br>
					<input class="bookBtns" type="button" value="취소" onclick="updateBookForm('${l.bookSerial}');"><br>
					<input class="bookBtns" type="button" value="수정" onclick="updateBook('${l.bookSerial}');">
				</span>
			</div>
		</div>
		<div class="booksReply">
			<!-- 댓글 작성란, 주인 혹은 작성자만 작성 가능 -->
			<c:if test="${l.writeUserSerial==sessionVO.userSerial}">
				<div class="insertReplyArea">
					<textarea class="insertReplyForm" id="replyContent-${l.bookSerial}"></textarea>
					<input class="bookBigBtns" type="button" value="확인" onclick="insertReply('${l.bookSerial}');">
				</div>
			</c:if>
			<!-- 댓글 있을경우 가져옴 -->
			<%-- <iframe class="replys" src="MiniHpBookReply.do?bookSerial=${l.bookSerial}" frameborder="1" marginheight="0" marginwidth="0" width="100%" height="50%"></iframe> --%>
			<script> $("#replySrc-"+'${l.bookSerial}').load("MiniHpBookReply.do?bookSerial=${l.bookSerial}");</script> 
			<div id="replySrc-${l.bookSerial}" class="replySrc"></div> 
		</div>
	</c:if>
	</c:forEach>
	
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
<script>
//주인 시리얼 고정
var ownerSerial = $('#ownerSerial').val();
$(function() {
	//insert
	$('#bookInsertBtn').click(function() {insertBook();});
	//수정, 삭제 버튼 이벤트
	$('.btns').mouseover(function() {
		this.style.cursor='pointer';
		this.style.color='#FF5E00';
	}).mouseout(function() {
		this.style.color='black';
	});
});
function changeSecret(bookSerial,isSecret) {
	$.ajax({
		type: 'POST',
		url: 'miniHpBookSecret.do/'+bookSerial+'/'+isSecret,
		datatype: 'json',
		contentType:'application/json; charset=utf-8'
	}).done(function(data) {
		getBook(ownerSerial);
	}).fail(function(error) {
		alert(JSON.stringify(error));
	});
}
function insertBook() {
	var content = $('#bookWriteContent').val();
	if(content==="")
		alert('내용을 입력하세요');
	else{
		//비밀로 하기 체크 여부 확인
		var isSecret = 0;
		if($("input:checkbox[name=secretCheck]").is(":checked") == true) {
			isSecret = 1;
		}
		$.ajax({
			type: 'POST',
			url: 'miniHpBookGuest.do/'+ownerSerial+'/'+content+'/'+isSecret,
			datatype: 'json',
			contentType:'application/json; charset=utf-8'
		}).done(function() {
			getBook(ownerSerial);
		}).fail(function(error) {
			alert(JSON.stringify(error));
		});
	}
}
function deleteBook(serial) {
	if(confirm("정말 삭제하시겠습니까?")){
		$.ajax({
			type: 'DELETE',
			url: 'miniHpBook.do/'+serial,
			datatype: 'json',
			contentType:'application/json; charset=utf-8'
		}).done(function(data) {
			getBook(ownerSerial);
		}).fail(function(error) {
			alert(JSON.stringify(error));
		});
	}
}
//update창
function updateBookForm(serial) {
	$('#booksContent-'+serial).toggle();
	$('#booksContentUpdate-'+serial).toggle();
}
function updateBook(serial) {
	var content = $('#updateContent-'+serial).val();
	if(content==="")
		alert('내용을 입력하세요');
	else{
		console.log(content);
		$.ajax({
			type: 'PUT',
			url: 'miniHpBook.do/'+serial+'/'+content,
			datatype: 'json',
			contentType:'application/json; charset=utf-8'
		}).done(function() {
			getBook(ownerSerial);
		}).fail(function(error) {
			alert(JSON.stringify(error));
		});
	}
}
//페이징
function fn_paging(curPage) {
	var ajaxMain = {
	        url : 'miniHpBookGuest.do?curPage=' + curPage+'&ownerSerial='+ownerSerial,
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
//댓글
function insertReply(bookSerial) {
	var replyContent = $('#replyContent-'+bookSerial).val();
	if(replyContent==="")
		alert('내용을 입력하세요');
	else{
		var data = {
			replyContent : replyContent,
			bookSerial : bookSerial
		}
		console.log(JSON.stringify(data));
		$.ajax({
			type: 'POST',
			url: 'MiniHpBookReply.do',
			datatype: 'json',
			contentType:'application/json; charset=utf-8',
			data: JSON.stringify(data)
		}).done(function() {
			$("#replySrc-"+bookSerial).load("MiniHpBookReply.do?bookSerial="+bookSerial);
			$('#replyContent-'+bookSerial).val("");
		}).fail(function(error) {
			alert(JSON.stringify(error));
		});
	}
}
function deleteReply(bookSerial,serial) {
	if(confirm("정말 삭제하시겠습니까?")){
		$.ajax({
			type: 'DELETE',
			url: 'MiniHpBookReply.do/'+serial,
			datatype: 'json',
			contentType:'application/json; charset=utf-8'
		}).done(function(data) {
			$("#replySrc-"+bookSerial).load("MiniHpBookReply.do?bookSerial="+bookSerial);
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
function updateReply(bookSerial,serial) {
	var content = $('#updateReplyContent-'+serial).val();
	if(content==="")
		alert('내용을 입력하세요');
	else{
		console.log(content);
		$.ajax({
			type: 'PUT',
			url: 'MiniHpBookReply.do/'+serial+'/'+content,
			datatype: 'json',
			contentType:'application/json; charset=utf-8'
		}).done(function() {
			$("#replySrc-"+bookSerial).load("MiniHpBookReply.do?bookSerial="+bookSerial);
		}).fail(function(error) {
			alert(JSON.stringify(error));
		});
	}
}
</script>