<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	
<style>
	#serchclient{
		padding-top: 10px;
    	margin-left: 240px;
	}
	#serchclient h1{
		margin-left: 100px;
   		font-size: xx-large;	
	}
	#serchclient input{
	margin-top: 10px;
	}
	#bantable{
		margin-left: 145px;
	    margin-top: 20px;
	    border-collapse: separate;
	    border-spacing: 0 5px;
	}
	#bantable td{
		
		width:190px;
	}
	#clientlist{
		margin-left:330px;
		width: 120px;
		background: gray;
	}
	
	#Context{
		overflow-y:scroll;
	}
</style>	
</head>
<body>
<div id="Context">
	<div id="serchclient">
		<h1>banList</h1>
		회원 검색하기
		<input type="text" id="search" />
	</div>
	
	<table border="1" id="bantable">
		<tr>
			<td style="text-align: center;">유저번호</td>
			<td>유저이름(아이디)</td>
			<td>밴풀기</td>
		</tr>
		<tbody id="tbody">
			<c:forEach var="kinds" items="${list}">
				<tr id="${kinds.userSerial}">
					<td style="width:150px;text-align: center;">${kinds.userSerial}</td>
					<td>${kinds.userName}(${kinds.userID})</td>
					<td><input type="button" value="unBan" onclick="UserUnBan(${kinds.userSerial})" /></td>
				</tr>
			</c:forEach>
		</tbody>
		
		<tfoot id="tfoot">
				<c:forEach var="kinds" items="${alist}">
					<!-- 벤안되었을때 -->
					<tr id="${kinds.userSerial}">
						<td style="width:150px;text-align: center;">${kinds.userSerial}</td>
						<td>${kinds.userName}(${kinds.userID})</td>
						<td><input type="button" value="unBan" onclick="UserBan(${kinds.userSerial})" /></td>
					</tr>
				</c:forEach>
		</tfoot>

		
	</table>
	<div id="clientlist">
		<a href="#" onclick="Manage_Client()">회원 목록 보기</a>
	</div>
	
	
	
	
	
	<div id="pagingid" style="text-align: center; margin-top:5px;">
        <c:if test="${pagination.curRange ne 1 }">
            <a href="#" onClick="fn_paging(1)">[처음]</a> 
        </c:if>
        <c:if test="${pagination.curPage ne 1}">
            <a href="#" onClick="fn_paging('${pagination.prevPage }')">[이전]</a> 
        </c:if>
        <c:forEach var="pageNum" begin="${pagination.startPage}" end="${pagination.endPage }">
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
</body>

<script>
	$(document).ready(function() {
		$("#tfoot").hide();
		$("#tfoot>tr").hide();
	})

	$("#search").keyup(function() {
		var key = $(this).val();
		console.log(key);
		
		if(key==''){
			$("#tbody>tr").show();
			$("#pagingid").show();
			$("#tfoot").hide();
			$("#tfoot>tr").hide();
		}else{
			/* 일단 검색시 목록 전체안보이게 */
			$("#tbody>tr").hide();
			$('#tfoot>tr').hide();
			$("#pagingid").hide();
			var writer = $("#tfoot>tr>td:nth-child(2):contains('"+key+"')");
			$("#tfoot").show();
			$(writer).parent().show();
		}
		
	})
	
	function UserUnBan(userSerial) {
		$.ajax({
			url: "userBan.do",
			type: "GET",
			data: {
				"UserSerial":userSerial,
				"BanCheck":"unBan"
				},
			success: function() {
				$("#"+userSerial).remove();
			}
		})
	}
	
	function Manage_Client(){
		$.ajax({
			url: "Manage_Client.do",
			type: "GET",
			data: {"check":"all"},
			dataType: "html",
			success: function(data) {
				$("#bodyContext").html(data);
			}
		})
	}	
	
	function fn_paging(curPage) {
	    var ajaxMain = {
	            url : 'Manage_Client.do?check=ban&curPage='+curPage,
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