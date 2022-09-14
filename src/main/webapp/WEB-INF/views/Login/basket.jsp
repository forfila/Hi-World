<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="resources/css/basket.css">
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
	@charset "UTF-8";

#basketCon{
	width:100%;
	height: 100%;
	overflow-y:scroll;
}

h1{
	margin-bottom: 30px;
    padding: 20px;
    text-align: center;
}


.sangpum table{
    border:1px solid black;
    width: 700%;
    height: 80%;
    text-align: center;
    display: table;
    border-spacing: 0 10px;
    border-collapse: separate;
    border-collapse: none;
    margin-left:100px;

}

#tablehead{
	text-align: center;
}

#tbody tr,th{
	vertical-align: middle;
	text-align: center;
	margin-bottom:20px;
}

.total{
	vertical-align: center;
	width: 100%;
	margin-bottom: 20px;
    font-weight: 800;
    font-size: xx-large;
    text-align: center;
}	
th img{
	border:1px solid;
}

#paybutton:hover{
	color:red;
}

</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>
	<div id="basketCon">
		<h1>장바구니 목록</h1>
		<c:choose>
			<c:when test="${ArticleList != '[]'}">
				<table class="sangpum" style="width:70%;border-collapse: separate;margin-left:100px;border-spacing:0 20px;">
					<tbody id="tbody">
	
						<c:forEach var="kinds" items="${ArticleList}">
							<tr class="${kinds.articleSerial}">
								<c:set var="check" value="${kinds.articleImg}" />
								<c:if test="${fn:contains(check,'.png')}">
									<th style="width: 27%;"><img style="width: 100px;height: 100px;border:1px solid;" src="${kinds.articleImg}" onerror="this.src='resources/images/article/music.png'" style= width:100px;height:100px; /></th>
									<th style="width: 50px;">${kinds.articleKinds}</th>
									<th>${kinds.articleName}</th>
									<th id="${kinds.articleSerial}">${kinds.articlePrice}BT</th>
									<th class="baskethover" onclick="deleteArticle('${kinds.articleSerial}')">취소</th>
								</c:if>
								<c:if test="${fn:contains(check,'.jsp')}">
									<th><img style="width: 100px;height: 100px;border:1px solid;" src="${kinds.articleImg}" onerror="this.src='resources/images/article/music.png'" style= width:150px;height:100px;/></th>
									<th>${kinds.articleKinds}</th>
									<th>${kinds.articleName}</th>
									<th id="${kinds.articleSerial}">${kinds.articlePrice}BT</th>
									<th class="baskethover" onclick="deleteArticle('${kinds.articleSerial}')">취소</th>
								</c:if>
								<c:if test="${fn:contains(check, '.mp3')}">
									<th><img style="width: 100px;height: 100px;border:1px solid;" src="${kinds.articleImg}" onerror="this.src='resources/images/article/music.png'" style= width:150px;height:100px; /></th>
									<th>${kinds.articleKinds}</th>
									<th>${kinds.articleName}</th>
									<th id="${kinds.articleSerial}">${kinds.articlePrice}BT</th>
									<th class="baskethover" onclick="deleteArticle('${kinds.articleSerial}')">취소</th>
									<%-- <td><input type="button" value="10초 미리듣기"	onclick="PLAY('${kinds.articleImg}')" /></td> --%>
								</c:if>
								<c:set var="total" value="${total+kinds.articlePrice}" />
							</tr>
						</c:forEach>
					
	
					</tbody>
					
				</table>
	
				<div class="total">
					<div>
						총금액 : <b id="totalPrice"></b>BT 입니다.
					</div>
				</div>
				<div class="total">
					<div>
						<a href="#" onclick="totalBay()" id="paybutton">결제하기</a>
					</div>
				</div>
	
	
	
	
			</c:when>
	
	
			<c:otherwise>
			<div style="text-align: center">
				장바구니에 담은 목록이 아무것도 없습니다.
			</div>
			</c:otherwise>
	
	
		</c:choose>
	</div>

</body>

<script>
	$().ready(function() {
		var total = ${total};
		$("#totalPrice").html(total);
	})
	function deleteArticle(articleSerial) {
		var tr = document.getElementsByClassName(articleSerial);
		var totalTr = $(".total");
		var priceText = $("#" + articleSerial).text();
		var last = priceText.indexOf('B');
		var price = priceText.substring(0, last);
		
		var total = $("#totalPrice").text();
		$.ajax({
			type : "GET",
			url : "delArticle.do",
			data : {
				"ArticleSerial" : articleSerial
			},
			success : function(data) {
				total = total - price;
				if (total == 0) {
					$(tr).remove();
					$(totalTr).remove();
					var innerHtml = "<tr><td>장바구니에 담은 목록이 아무것도 없습니다.</td></tr>";
					$('#tbody').append(innerHtml);
				} else {
					$("#totalPrice").html(total);
					$(tr).remove();
				}
			}
		})

	}

	function totalBay() {
		var total = $("#totalPrice").text();
		
		$.ajax({
			type : "GET",
			url : "totalBay.do",
			data : {"total" : total},
			success : function(data) {
				if (data == 1) {
					/* 결제 성공 */
					Swal.fire("결제성공 5초후 메인페이지로 이동합니다");
					
					setTimeout(() => {
						location.reload();						
					}, 5000);
				} else {
					/* 밤톨부족 결제 실패 */
					Swal.fire("결제실패 밤톨이 부족합니다");
				}
			}
		})
	}
</script>

</html>