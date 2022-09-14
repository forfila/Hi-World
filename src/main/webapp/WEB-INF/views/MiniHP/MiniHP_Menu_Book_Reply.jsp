<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

				<div class="secondFont">
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
								<span style="font-size:9pt;font-weight: bold;color: gray; cursor: pointer;" onclick="updateReply('${serial}','${r.replySerial}');">
									수정
								</span>
								<span style="font-size:9pt;font-weight: bold;color: gray; cursor: pointer;" onclick="updateReplyForm('${r.replySerial}');">
									취소
								</span>
							</span>
							<br>
						</c:forEach>
				</div>