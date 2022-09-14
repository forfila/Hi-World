<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
				<tr>
				 	<td scope="row" style="border-bottom: none;">
				 		<img alt="" src="resources/images/reply-pen.png" width="10px">
				 		<font style="font-size: 10pt;">댓글 [${replyCnt}]</font>
				 		<span onclick="showReplyForm('${serial}');" onmouseover="this.style.color='#FF5E00'; this.style.cursor='pointer';" onmouseout="this.style.color='black';" style="font-size:10pt; float: right">댓글작성</span>
					</td>
				</tr>
				<tr>
					<td>
					<span id="replyInsertForm-${serial}" style="display: none;">
						<textarea id="replyContent-${serial}" style="resize: none; width: 405px; height: 100px;"></textarea><br>
						<input type="button" value="취소" style="float: right" onclick="showReplyForm('${serial}');">
						<input type="button" value="입력" style="float: right" onclick="insertReply('${serial}');">
					</span>
					</td>
				</tr>
				<c:if test="${replyCnt!=0}">
				<tr style="background: #EBE9E9;">
						<td scope="row" class="secondFont">
						<c:forEach items="${replyList}" var="r">
							<span id="reply-${r.replySerial}">
								${r.userName}: <c:out value="${r.replyContent}" />
								<span style="font-size: 5px; padding-top: 5px; color: gray;">
								(<fmt:formatDate value="${r.cDate}" pattern="yyyy-MM-dd"/>)
								</span>
								<c:if test="${sessionVO.userSerial==r.userSerial}">
									<img src="resources/images/folder_edit.png" width="10px" class="" height="10px" onclick="updateReplyForm('${r.replySerial}');" style="cursor:pointer;">
									<img src="resources/images/x-delete.png" width="10px" height="10px" onclick="deleteReply('${serial}','${r.replySerial}');" style="cursor:pointer;">
								</c:if>
							</span>
							<span id="replyForm-${r.replySerial}" style="display: none;">
								<input type="text" id="updateReplyContent-${r.replySerial}" value="${r.replyContent}">
								<span style="font-size:9pt;font-weight: bold;color: #1294AB; cursor: pointer;" onclick="updateReply('${serial}','${r.replySerial}');">
									수정
								</span>
								<span style="font-size:9pt;font-weight: bold;color: #1294AB; cursor: pointer;" onclick="updateReplyForm('${r.replySerial}');">
									취소
								</span>
							</span>
							<br>
						</c:forEach>
					</td>
				</tr>
				</c:if>