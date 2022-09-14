<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="resources/css/questionMainPage.css">
<meta charset="UTF-8">
<title>Insert title here</title>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>


	<div id="Context">

		<div id="serchQuestion">
			문의사항 혹은 이름을 검색하세요 <input type="text" id="search" />
		</div>
		
		
		<c:choose>
			<c:when test="${list != '[]'}">
				<table>
					<tr>
						<td style="width:95px; ">NO.</td>
						<td style="width:95px; ">제목</td>
						<td style="width:95px; ">작성자</td>
						<td style="width:95px; ">작성일</td>
						<td style="width:95px; ">조회수</td>
						<td style="width:95px; ">답변여부</td>
						<td style="width:95px; "></td>
					
					</tr>
					<tbody id="tbody">
						<c:set var="number" value="${number}"/>
						<c:forEach var="kinds" items="${list}">
							<tr id="${kinds.boardSerial}">
								<td>${number}</td>
								<c:choose>
									<c:when	test="${kinds.userSerial eq sessionVO.userSerial || sessionVO.userSerial == 1 || kinds.banUser == 1}">
										<td><a href="#" class="questionhover3" onclick="boardView('${kinds.boardSerial}')">${kinds.title}</a> </td>
									</c:when>
									<c:otherwise>
										<td>비밀글입니다</td>
									</c:otherwise>
								</c:choose>
								<td>${kinds.userName}</td>
								<td>${kinds.cDate}</td>
								<td>${kinds.lookUp}</td>
								
								<c:choose>
									<c:when test="${kinds.adminReply > 0}">
										<td>관리자 답변완료</td>
									</c:when>
									<c:otherwise>
										<td>관리자 미답변</td>
									</c:otherwise>
								</c:choose>

								<c:choose>
									<c:when test="${sessionVO.userSerial eq kinds.userSerial || sessionVO.userSerial == 1}">
										<td><div class="questionhover" onclick="deleteBoard('${kinds.boardSerial}')">삭제</div></td>
									</c:when>
									<c:otherwise>
										<td></td>
									</c:otherwise>
								</c:choose>

							</tr>
						<c:set var="number" value="${number+1}"/>
						</c:forEach>
					</tbody>

					<tfoot id="tfoot">
						<c:set var="number" value="${number}"/>
						<c:forEach var="kinds" items="${list}">
							<tr id="${kinds.boardSerial}">
								<td>${number}</td>
								<c:choose>
									<c:when	test="${kinds.userSerial eq sessionVO.userSerial || sessionVO.userSerial == 1 || kinds.banUser == 1}">
										<td style="display: none;">${kinds.title} ${kinds.userName}</td>
										<td><a href="#" class="questionhover3" onclick="boardView('${kinds.boardSerial}')">${kinds.title}</a> </td>
									</c:when>
									<c:otherwise>
										<td style="display: none;">비밀글입니다 ${kinds.userName}</td>
										<td>비밀글입니다 </td>
									</c:otherwise>
								</c:choose>
								<td>${kinds.userName}</td>
								<td>${kinds.cDate}</td>
								<td>${kinds.lookUp}</td>
									<c:choose>
									<c:when test="${kinds.adminReply > 0}">
										<td>관리자 답변완료</td>
									</c:when>
									<c:otherwise>
										<td>관리자 미답변</td>
									</c:otherwise>
								</c:choose>
								<c:choose>
									<c:when test="${sessionVO.userSerial eq kinds.userSerial || sessionVO.userSerial == 1}">
										<td><div class="questionhover" onclick="deleteBoard('${kinds.boardSerial}')">삭제</div></td>
									</c:when>
									<c:otherwise>
										<td></td>
									</c:otherwise>
								</c:choose>


							</tr>
						<c:set var="number" value="${number+1}"/>
						</c:forEach>
					</tfoot>

				</table>


			</c:when>


		<c:otherwise>
			등록된 문의사항이 없습니다.
		</c:otherwise>



		</c:choose>




		<div id="paging">
			<c:if test="${pagination.curRange ne 1 }">
				<a href="#" class="questionhover" onClick="fn_paging(1)">[처음]</a>
			</c:if>
			<c:if test="${pagination.curPage ne 1}">
				<a href="#" class="questionhover" onClick="fn_paging('${pagination.prevPage }')">[이전]</a>
			</c:if>
			<c:forEach var="pageNum" begin="${pagination.startPage}"
				end="${pagination.endPage }">
				<c:choose>
					<c:when test="${pageNum eq  pagination.curPage}">
						<span style="font-weight: bold;"><a href="#" class="questionhover"
							onClick="fn_paging('${pageNum }')">${pageNum }</a></span>
					</c:when>
					<c:otherwise>
						<a href="#" class="questionhover" onClick="fn_paging('${pageNum }')">${pageNum }</a>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:if
				test="${pagination.curPage ne pagination.pageCnt && pagination.pageCnt > 0}">
				<a href="#" class="questionhover" onClick="fn_paging('${pagination.nextPage }')">[다음]</a>
			</c:if>
			<c:if
				test="${pagination.curRange ne pagination.rangeCnt && pagination.rangeCnt > 0}">
				<a href="#" class="questionhover" onClick="fn_paging('${pagination.pageCnt }')">[끝]</a>
			</c:if>
		</div>

		<c:if test="${sessionVO.userSerial != 1}">
			<a href="#"  class="questionhover2" onclick="questionWrite()">문의사항 작성하기</a>
		</c:if>

	</div>




</body>

<script>
	$(document).ready(function() {
		$("#tfoot").hide();
		$("#tfoot>tr").hide();
	})

	$("#search").keyup(
			function() {
				var key = $(this).val();

				if (key == '') {
					$("#tbody>tr").show();
					$("#tfoot").hide();
					$("#tfoot>tr").hide();
					$("#paging").show();
				} else {
					/* 일단 검색시 목록 전체안보이게 */
					$("#tbody>tr").hide();
					$("tfoot>tr").hide();
					$("#paging").hide();
					var writer = $("#tfoot>tr>td:nth-child(2):contains('" + key + "')");
					$("#tfoot").show();
					$(writer).parent().show();
				}

			})

	function boardView(boardSerial) {
		$.ajax({
			url : "questionDetailPage.do",
			type : "GET",
			data : {
				"boardSerial" : boardSerial
			},
			success : function(data) {
				$('#Context').html(data);
			}
		})
	}

	function deleteBoard(boardSerial) {
		$.ajax({
			url : "deleteBoard.do",
			type : "GET",
			data : {
				"boardSerial" : boardSerial
			},
			success : function(data) {
				$("#" + boardSerial).remove();
			}
		})
	}

	function fn_paging(curPage) {
		var ajaxMain = {
			url : 'questionPage.do?curPage=' + curPage,
			async : true,
			type : "GET",
			dataType : "html",
			cache : false
		};

		$.ajax(ajaxMain).done(function(data) {
			$('#Context').children().remove();
			// Contents 영역 교체
			$('#Context').html(data);
		});
	}

	function questionWrite() {
		$.ajax({
			url : "questionBoard.do",
			dataType : "html",
			type : "GET",
			success : function(data) {
				$('#bodyContext').html(data);
			}
		})
	}
</script>


</html>