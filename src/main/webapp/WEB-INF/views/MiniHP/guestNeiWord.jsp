<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

				<div>
						<c:forEach items="${list}" var="l">
							<span id="reply-${l.serial}">
								${l.writeUserName}: <c:out value="${l.content}" />
								<span style="font-size: 5px; padding-top: 5px; color: gray;">
								(<fmt:formatDate value="${l.cDate}" pattern="yyyy-MM-dd"/>)
								</span>
								<c:if test="${l.writeUserSerial==sessionVO.userSerial}">
									<img src="resources/images/folder_edit.png" width="10px" class="" height="10px" onclick="updateNeiWordForm('${l.serial}');" style="cursor:pointer;">
									<img src="resources/images/x-delete.png" width="10px" height="10px" onclick="deleteNeiWord('${l.serial}');" style="cursor:pointer;">
								</c:if>
							</span>
							<span id="replyForm-${l.serial}" style="display: none;">
								<input type="text" id="updateReplyContent-${l.serial}" value="${l.content}">
								<span style="font-size:9pt;font-weight: bold;color: gray; cursor: pointer;" onclick="updateNeiWord('${l.serial}');">
									수정
								</span>
								<span style="font-size:9pt;font-weight: bold;color: gray; cursor: pointer;" onclick="updateNeiWordForm('${l.serial}');">
									취소
								</span>
							</span>
							<br>
						</c:forEach>
				</div>