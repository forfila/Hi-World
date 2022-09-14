//홈 이동
function moveHome(ownerSerial) {
	//사이드 불러오기
	getProfileSide(ownerSerial);
	// 메인 불러오기
    var ajaxMain = {
            url : 'miniHp_rightGuest.do?OwnerSerial='+ownerSerial,
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

//사진첩 사이드 불러오기
function getPictureSide(ownerSerial) {
	var ajaxSide = {
	        url : "MiniHpPictureGuestSide.do?ownerSerial="+ownerSerial,
	        async : true,
	        type : "GET",
	        dataType : "html",
	        cache : false
	};
	$.ajax(ajaxSide).done(function(data){
	    $('#sideContents').children().remove();
	    $('#sideContents').html(data);
	});
}
//사진첩 이동
function movePicture(ownerSerial){
	//사이드 불러오기
	getPictureSide(ownerSerial);
    // 메인 불러오기
    var ajaxMain = {
            url : 'miniHpGuestPicture.do?ownerSerial='+ownerSerial,
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

//프로필 사이드 불러오기
function getProfileSide(OwnerSerial) {
	var ajaxSide = {
            url : "MiniHpGuestDefaultSide.do?OwnerSerial="+OwnerSerial,
            async : true,
            type : "GET",
            dataType : "html",
            cache : false
    };
	
	 $.ajax(ajaxSide).done(function(result){
	        // Contents 영역 삭제
	        $("#sideContents").children().remove();
	        // Contents 영역 교체
	        $("#sideContents").html("<iframe frameborder='0' width='160' height='440' src="+result+"></iframe>");
	 });
}

function moveProfile(ownerID,ownerSerial) {
	//사이드 불러오기
	getProfileSide(ownerSerial);
	
	// 메인 불러오기
    var ajaxMain = {
            url : 'miniHpProfileGuest.do?ownerID='+ownerID,
            async : true,
            type : "GET",
            dataType : "html",
            cache : false
    };
    
    $.ajax(ajaxMain).done(function(result){
        // Contents 영역 삭제
        $("#bodyContents").children().remove();
        // Contents 영역 교체
        $("#bodyContents").html(result);
    });
}

//게시판 사이드 불러오기
function getBoardSide(ownerSerial) {
	
	var ajaxSide = {
            url : "MiniHpBoardGuestSide.do?ownerSerial="+ownerSerial,
            async : true,
            type : "GET",
            dataType : "html",
            cache : false
    };
    
    $.ajax(ajaxSide).done(function(data){
        // Contents 영역 삭제
        $('#sideContents').children().remove();
        // Contents 영역 교체
        $('#sideContents').html(data);
    });
}

//게시판 이동
function moveBoard(ownerSerial){
	//사이드 불러오기
	getBoardSide(ownerSerial);
	
    // 메인 불러오기
    var ajaxMain = {
            url : 'miniHpBoardGuest.do?ownerSerial='+ownerSerial,
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

//동영상 사이드 불러오기
function getVideoSide(ownerSerial) {
	var ajaxSide = {
	        url : "MiniHpVideoGuestSide.do?ownerSerial="+ownerSerial,
	        async : true,
	        type : "GET",
	        dataType : "html",
	        cache : false
	};
	$.ajax(ajaxSide).done(function(data){
	    $('#sideContents').children().remove();
	    $('#sideContents').html(data);
	});
}
//동영상 이동
function moveVideo(ownerSerial){
	//사이드 불러오기
	getVideoSide(ownerSerial);
    // 메인 불러오기
    var ajaxMain = {
            url : 'miniHpVideoGuest.do?ownerSerial='+ownerSerial,
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

//방명록 이동
function moveBook(ownerSerial){
	//사이드 불러오기
	getProfileSide(ownerSerial);
    // 메인 불러오기
	getBook(ownerSerial);
}
//방명록 메인 부분만 가져오기
function getBook(ownerSerial){
    var ajaxMain = {
            url : 'miniHpBookGuest.do?ownerSerial='+ownerSerial,
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