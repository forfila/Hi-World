<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="resources/css/MiniHpFolder.css?ver=1" />
<body>
	
	<div id="folder-header" style="width: 150px;height: 30px;" align="left">
		<font  style="font-size:15pt; font-weight: bold; color: #1294AB; letter-spacing: 1px;">Video</font>
	</div>
	
	<div style="border-top: 3px solid #EBEBEB; border-bottom: 3px solid #EBEBEB; width: 150px; height: 370px; word-break:break-all;overflow: auto;overflow-x: hidden;" align="left">
		<br>
		<c:forEach var="i" items="${folderList}">
			<div>
			<img alt="" src="${pageContext.request.contextPath}/resources/images/folder_icon.png" height="13px" width="13px">
			<span id="folder-${i.serial}">
				<span class="folderNames" onclick="goToFolder('${i.serial}');" onmouseover="this.style.color='#FF5E00'; this.style.cursor='pointer';" onmouseout="this.style.color='black';" style="font-size:10pt;"><c:out value="${i.folderName}" /></span>
				<img src="resources/images/folder_edit.png" width="10px" height="10px" style="cursor:pointer;" onclick="updateForm('${i.serial}');">
				<img src="resources/images/folder_deleted.png" width="10px" height="10px" style="cursor:pointer;" onclick="deletedFolder('${i.serial}');">
			</span>
			<span id="folderForm-${i.serial}"  style="display: none;">
				<input type="text" id="folderName-${i.serial}" style="width: 100px;" value="${i.folderName}" /><br />
				<font style="font-size:7pt;font-weight: bold;color: #1294AB;">
					공개범위
				</font><br>
				<font size="1pt"> 
					<c:if test="${i.scope==2}">
						<label class="updateFolder-radio"><input type="radio" name="scope-${i.serial}" value="2" checked="checked"><span>전체공개</span></label>
						<label class="updateFolder-radio"><input type="radio" name="scope-${i.serial}" value="1"><span>이웃공개</span></label>
						<label class="updateFolder-radio"><input type="radio" name="scope-${i.serial}" value="0"><span>비공개</span></label>
					</c:if>
					<c:if test="${i.scope==1}">
						<label class="updateFolder-radio"><input type="radio" name="scope-${i.serial}" value="2"><span>전체공개</span></label>
						<label class="updateFolder-radio"><input type="radio" name="scope-${i.serial}" value="1" checked="checked"><span>이웃공개</span></label>
						<label class="updateFolder-radio"><input type="radio" name="scope-${i.serial}" value="0"><span>비공개</span></label>
					</c:if>
					<c:if test="${i.scope==0}">
						<label class="updateFolder-radio"><input type="radio" name="scope-${i.serial}" value="2"><span>전체공개</span></label>
						<label class="updateFolder-radio"><input type="radio" name="scope-${i.serial}" value="1"><span>이웃공개</span></label>
						<label class="updateFolder-radio"><input type="radio" name="scope-${i.serial}" value="0" checked="checked"><span>비공개</span></label>
					</c:if>
				</font><br>
				<span style="font-size:9pt;font-weight: bold;color: #1294AB; cursor: pointer;" onclick="updateFolder(${i.serial});">
					■수정
				</span>&nbsp;
				<span style="font-size:9pt;font-weight: bold;color: #1294AB; cursor: pointer;" onclick="cancelFolder();">
					■취소
				</span>
			</span>
			</div>
		</c:forEach>
		<br><br>
		<img src="resources/images/folder_add.png" width="10px" height="10px" align="left" onclick="addFolder();">
		<div id="addFolder" style="display: none;">
			<br>
			<font style="font-size:9pt;font-weight: bold;color: #1294AB;">
				폴더 이름
			</font>
			<input type="text" id="folderName" style="width: 70px;" /><br />
			<font style="font-size:7pt;font-weight: bold;color: #1294AB;">
				공개범위
			</font><br>
			<font size="1pt"> 
				<label class="addFolder-radio"><input type="radio" name="scope" value="2" checked="checked"><span>전체공개</span></label>
				<label class="addFolder-radio"><input type="radio" name="scope" value="1"><span>이웃공개</span></label>
				<label class="addFolder-radio"><input type="radio" name="scope" value="0"><span>비공개</span></label>
			</font><br>
			<span style="font-size:9pt;font-weight: bold;color: #1294AB; cursor: pointer;" onclick="insertFolder();">
				■추가
			</span>&nbsp;
			<span style="font-size:9pt;font-weight: bold;color: #1294AB; cursor: pointer;" onclick="cancelFolder();">
				■취소
			</span>
		</div>
	</div>
</body>
<script>
	//폴더 클릭시 해당 폴더로 이동
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

	//"+" 버튼 클릭시 폴더 제목 작성란, 공개 범위 설정창 열림
	function addFolder() {
		if($('#addFolder').css("display")==="none")
			$('#addFolder').css("display","");
		else
			$('#addFolder').css("display","none");
	}
	//폴더 추가 취소
	function cancelFolder() {
		getVideoSide();
	}
	
	//폴더 추가
	function insertFolder() {
		var folderName = $('#folderName').val();
		if(folderName==="")
			alert('폴더명을 입력하세요');
		else{
			var scope = $(":input:radio[name=scope]:checked").val();
			
			var data = {
				folderName : folderName,
				scope : scope
			}
			console.log(JSON.stringify(data));
			$.ajax({
				type: 'POST',
				url: 'MiniHpVideoSide.do',
				datatype: 'json',
				contentType:'application/json; charset=utf-8',
				data: JSON.stringify(data)
			}).done(function() {
				//사이드 불러오기
				getVideoSide();
			}).fail(function(error) {
				alert(JSON.stringify(error));
			});
		}
	}
	//폴더 삭제
	function deletedFolder(serial) {
		if(confirm("정말 삭제하시겠습니까?")){
			$.ajax({
				type: 'DELETE',
				url: 'MiniHpVideoSide.do/'+serial,
				datatype: 'json',
				contentType:'application/json; charset=utf-8'
			}).done(function(data) {
				//실패할수도 있어서 alert 있어야됨
				alert(data);
				//사이드 불러오기
				getVideoSide();
			}).fail(function(error) {
				alert(JSON.stringify(error));
			});
		}
	}
	
	//폴더 수정하기
	function updateFolder(serial) {
		
		var folderName = $('#folderName-'+serial).val();
		if(folderName==="")
			alert('폴더명을 입력하세요');
		else{
			var scope = $(":input:radio[name=scope-"+serial+"]:checked").val();
			$.ajax({
				type: 'PUT',
				url: 'MiniHpVideoSide.do/'+serial+'/'+folderName+'/'+scope,
				datatype: 'json',
				contentType:'application/json; charset=utf-8'
			}).done(function() {
				//alert('폴더가 수정되었습니다.');
				//사이드 불러오기
				getVideoSide();
			}).fail(function(error) {
				alert(JSON.stringify(error));
			}); 
		}
	}
	
	//폴더명 수정화면 펼치기
	function updateForm(serial,beforeFolderName) {
		$('#folder-'+serial).toggle();
		$('#folderForm-'+serial).toggle();
	}
</script>