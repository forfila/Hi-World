//홈 이동
function moveHome() {
	//사이드 불러오기
	getProfileSide();
	// 메인 불러오기
    var ajaxMain = {
            url : 'MiniHP_Right.do',
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
function getPictureSide() {
	var ajaxSide = {
	        url : "MiniHpPictureSide.do",
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
function movePicture(){
	//사이드 불러오기
	getPictureSide();
    // 메인 불러오기
    var ajaxMain = {
            url : 'miniHpPicture.do',
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
function getProfileSide() {
	var ajaxSide = {
            url : "MiniHpDefaultSide.do",
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

function moveProfile() {
	//사이드 불러오기
	getProfileSide();
	
	// 메인 불러오기
    var ajaxMain = {
            url : 'miniHpProfile.do',
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
function getBoardSide() {
	
	var ajaxSide = {
            url : "MiniHpBoardSide.do",
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
function moveBoard(){
	//사이드 불러오기
	getBoardSide();
	
    // 메인 불러오기
    var ajaxMain = {
            url : 'miniHpBoard.do',
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
function getVideoSide() {
	var ajaxSide = {
	        url : "MiniHpVideoSide.do",
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
function moveVideo(){
	//사이드 불러오기
	getVideoSide();
    // 메인 불러오기
    var ajaxMain = {
            url : 'miniHpVideo.do',
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
function moveBook(){
	//사이드 불러오기
	getProfileSide();
    // 메인 불러오기
	getBook();
}
//방명록 메인 부분만 가져오기
function getBook(){
    var ajaxMain = {
            url : 'miniHpBook.do',
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

//관리탭 불러오기
function getSettingSide() {
	var ajaxSide = {
			url : "MiniHpSettingSide.do",
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

function moveSetting() {
	getSettingSide();
	
	// 메인 불러오기
    var ajaxMain = {
            url : "miniHpSetting.do?menu=menu7",
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