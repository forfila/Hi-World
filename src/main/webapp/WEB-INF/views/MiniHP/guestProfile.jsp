<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<body leftmargin="5" topmargin="0">
	<table border="0" width="420" cellpadding="0" cellspacing="0">
		<tr>
			<td>&nbsp;&nbsp;<b>프로필</b></td>
		</tr>
		<tr>
			<td align="center">
				<div id="change">
					<img src="${pageContext.request.contextPath}/resources/images/bar.jpg" width="420" height="6" border="0" alt="">
					<div style="height: 310px; white-space: pre-line;">
						<font>
							<span class="secondFont" id="appendContent" align="center"></span>
						</font>
					</div>
					<img src="${pageContext.request.contextPath}/resources/images/bar.jpg" width="420" height="6" border="0" alt="">
				</div>
			</td>
		</tr>
	</table>
</body>
<script>
	$.ajax({
		type : 'GET',
		url : 'miniHp_get_profile.do',
		/* userId session 받기 */
		data : { UserID : '${ownerID}' }
	}).done(function(result) {
		console.log('ajax success');
		console.log(result);
		content = result;
		$("#appendContent").text(content);
	});
</script>