function pausePlay(index) {
	if($(".audio-control-btn").hasClass("btn-play")) {
		// 재생 -> 일시정지
		$(".audio-control-btn").addClass("btn-pause");
		$(".audio-control-btn").removeClass("btn-play");
		$(".audio-control-btn").find("i").attr("class", "fa fa-pause");
		console.log(document.getElementById("audio"+index).volume);
		document.getElementById("audio"+index).play();
		startAudioTimer(index);
	} else if($(".audio-control-btn").hasClass("btn-pause")) {
		// 일시정지 -> 재생
		$(".audio-control-btn").addClass("btn-play");
		$(".audio-control-btn").removeClass("btn-pause");
		$(".audio-control-btn").find("i").attr("class", "fa fa-play");
		document.getElementById("audio"+index).pause();
	}
}
//노래 끝날 시 다음곡 로딩
function nextLoad(index) {
	var currentAudioDiv = document.getElementById("audio-player"+index);
	var currentAudio = document.getElementById("audio"+index);
	
	currentAudioDiv.style.display = "none";
	currentAudio.currentTime = 0;
	
	var size = document.getElementById("listSize").value;
	
	if(index == (size-1)) {
		var firstAudioDiv = document.getElementById("audio-player0");
		var firstAudio = document.getElementById("audio0");
		var firstTitle = document.getElementById("audio-title0").value;
		
		firstAudioDiv.style.display = "block";
		$(".audio-title-wrap #audio-title").replaceWith('<marquee id="audio-title" behavior="scroll" direction="left" scrollamount="3">'+firstTitle+'</marquee>');
		
		firstAudio.play();
		stopAudioTimer();
		startAudioTimer(0);
	} else {
		var nextAudioDiv = document.getElementById("audio-player"+(index+1));
		var nextAudio = document.getElementById("audio"+(index+1));
		var nextTitle = document.getElementById("audio-title"+(index+1)).value;

		nextAudioDiv.style.display = "block";
		$(".audio-title-wrap #audio-title").replaceWith('<marquee id="audio-title" behavior="scroll" direction="left" scrollamount="3">'+nextTitle+'</marquee>');

		nextAudio.play();
		stopAudioTimer();
		startAudioTimer((index+1));
	}
}
//다음곡 버튼 클릭시
function nextPlay(index) {	
	var currentAudioDiv = document.getElementById("audio-player"+index);
	var currentAudio = document.getElementById("audio"+index);
	
	currentAudioDiv.style.display = "none";
	currentAudio.currentTime = 0;
	currentAudio.pause();
	
	var size = document.getElementById("listSize").value;

	if(index == (size-1)) {
		var firstAudioDiv = document.getElementById("audio-player0");
		var firstAudio = document.getElementById("audio0");
		var firstTitle = document.getElementById("audio-title0").value;
		console.log(firstTitle)
		
		firstAudioDiv.style.display = "block";
		$(".audio-title-wrap #audio-title").replaceWith('<marquee id="audio-title" behavior="scroll" direction="left" scrollamount="3">'+firstTitle+'</marquee>');
		
		if($(".audio-control-btn").hasClass("btn-play")) {
			firstAudio.load();
		} else {
			firstAudio.play();
			stopAudioTimer();
			startAudioTimer(0);
		}
	} else {
		var nextAudioDiv = document.getElementById("audio-player"+(index+1));
		var nextAudio = document.getElementById("audio"+(index+1));
		var nextTitle = document.getElementById("audio-title"+(index+1)).value;
		console.log(nextTitle)
		
		nextAudioDiv.style.display = "block";
		$(".audio-title-wrap #audio-title").replaceWith('<marquee id="audio-title" behavior="scroll" direction="left" scrollamount="3">'+nextTitle+'</marquee>');

		if($(".audio-control-btn").hasClass("btn-play")) {
			nextAudio.load();
		} else {
			nextAudio.play();
			stopAudioTimer();
			startAudioTimer((index+1));
		}
	}
}
//이전곡 버튼 클릭시
function prevPlay(index) {
	var currentAudioDiv = document.getElementById("audio-player"+index);
	var currentAudio = document.getElementById("audio"+index);
	
	currentAudioDiv.style.display = "none";
	currentAudio.currentTime = 0;
	currentAudio.pause();
	
	var size = document.getElementById("listSize").value;
	
	if(index == 0) {
		var lastAudioDiv = document.getElementById("audio-player"+(size-1));
		var lastAudio = document.getElementById("audio"+(size-1));
		var lastTitle = document.getElementById("audio-title"+(size-1)).value;
		
		lastAudioDiv.style.display = "block";
		$(".audio-title-wrap #audio-title").replaceWith('<marquee id="audio-title" behavior="scroll" direction="left" scrollamount="3">'+lastTitle+'</marquee>');
		
		if($(".audio-control-btn").hasClass("btn-play")) {
			lastAudio.load();
		} else {
			lastAudio.play();
			stopAudioTimer();
			startAudioTimer((size-1));
		}
	} else {
		var prevAudioDiv = document.getElementById("audio-player"+(index-1));
		var prevAudio = document.getElementById("audio"+(index-1));
		var prevTitle = document.getElementById("audio-title"+(index-1)).value;

		prevAudioDiv.style.display = "block";
		$(".audio-title-wrap #audio-title").replaceWith('<marquee id="audio-title" behavior="scroll" direction="left" scrollamount="3">'+prevTitle+'</marquee>');
		
		if($(".audio-control-btn").hasClass("btn-play")) {
			prevAudio.load();
		} else {
			prevAudio.play();
			stopAudioTimer();
			startAudioTimer((index-1));
		}
	}
}

function startAudioTimer(index) {
    //플레이어가 재생중일때 실시간재생 시간을 초단위로 출력
    var progressBar = $(".play-progress-bar");
    var progress_val = 0;	// 재생 progress bar 값
    var playtime = 0;		// 재생 시간

    audioTimer = setInterval(function(){
		var player = document.getElementById("audio"+index);
		var maxTime = player.duration;
        // audio 태그에서 현재 재생시간을 가져온다.
        currentTime = Math.round(player.currentTime);
        // 00:00의 형식으로 표기하기위해 포맷변경
        playtime = setTimeFormat(currentTime);
        endtime = setTimeFormat(maxTime);
		// 가져온 현재 재생시간을 progress bar에 표기하기위해 currentTime가공
   		// 재생 완료를 100으로 잡고 현재 재생시간을 계산
    	// 소수점 첫번째 자리까지 계산
   		progress_val = (currentTime/maxTime)*100;
    	progress_val = progress_val.toFixed(1);
    	$(".play-time.start").html(playtime);
    	$(".play-time.end").html(endtime);
    	progressBar.css("width", progress_val+"%");
	}, 1000);
}

//노래 변경시 기존 타이머 초기화
function stopAudioTimer(){
    clearInterval(audioTimer);
    $(".play-progress-bar").css('width',0);
}

//재생시간 포멧변경
function setTimeFormat(sec_time){
    var sec_num = parseInt(sec_time);
    var minutes = Math.floor(sec_num / 60);
    var seconds = sec_num - (minutes * 60);

    if (minutes < 10) {
    	minutes = "0" + minutes;
    }
    if (seconds < 10) {
    	seconds = "0" + seconds;
    }

    return minutes + ":" + seconds;
}

function volumeMute(index) {
	var bgm_player = document.getElementById("audio"+index);
    if($(".volume-control-btn").hasClass('btn-volume')) {
    	// 볼륨 -> 음소거
    	$(".volume-control-btn").addClass('btn-mute');
       	$(".volume-control-btn").removeClass('btn-volume');
      	$(".volume-control-btn").find('i').attr('class','fa fa-volume-off');
      	bgm_player.muted = true;  	
    } else if($(".volume-control-btn").hasClass('btn-mute')){
    	// 음소거 -> 볼륨
       	$(".volume-control-btn").addClass('btn-volume');
      	$(".volume-control-btn").removeClass('btn-mute');
      	$(".volume-control-btn").find('i').attr('class','fa fa-volume-up');
      	bgm_player.muted = false;
    }
}

function volumeControl(index) {
	// jQuery slider
    $(".play-volume-slider").slider({
        slide: function(event,ui){
            var volume = ui.value;
            if(volume > 0){ // 볼륨 up
            	var bgm_player = document.getElementById("audio"+index);
				volume = volume/100;
				volume = volume.toFixed(1);
				/* console.log(volume); */
				bgm_player.muted = false;
				bgm_player.volume = volume;
				console.log(bgm_player.volume);
                // 음소거 아이콘 토글
				$(".volume-control-btn").addClass('btn-volume');
		      	$(".volume-control-btn").removeClass('btn-mute');
		      	$(".volume-control-btn").find('i').attr('class','fa fa-volume-up');
            } else {	// 음소거
				var bgm_player = document.getElementById("audio"+index);
				bgm_player.muted = true;
                // 음소거 아이콘 토글
				$(".volume-control-btn").addClass('btn-mute');
		       	$(".volume-control-btn").removeClass('btn-volume');
		      	$(".volume-control-btn").find('i').attr('class','fa fa-volume-off');
            }
        }
    });
}