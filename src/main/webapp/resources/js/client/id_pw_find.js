$(document).ready(function() {
	  $('#myinput1').click(function() {
		  var copyText = document.getElementById('myinput1')
			copyText.select();
			copyText.setSelectionRange(0,99999);
			document.execCommand("copy");
			Swal.fire("입력한 정보의 ID가 Ctrl + C 되었습니다.")
	});
	  
	  $('#myinput2').click(function() {
		  var copyText = document.getElementById('myinput2')
			copyText.select();
			copyText.setSelectionRange(0,99999);
			document.execCommand("copy");
			Swal.fire("입력한 정보의 입시 비밀번호가 Ctrl + C 되었습니다.")
	  });
	  
  });
	function pwFind() {
		if($('#hide1').css('display') == 'none'){
			$('#hide').hide();
			$('#hide1').show();
			$('input:radio[name=radio]').prop('checked',false);
		}
	}

	function idFind() {
		if($('#hide').css('display') == 'none'){
			$('#hide1').hide();
			$('#hide').show();
			$('input:radio[name=radio1]').prop('checked',false);
		}
	}
	
var check = 0;
	
function findId() {
	check = 1;
	var UserName = $('input[name=username]').val();
	var UserTel = $('input[name=userTel]').val();
	$.ajax({
		type:"post",
		url:"find_id_pw.do",
		data:{'check' : check, 'UserName' : UserName,'UserTel' : UserTel},
		success: function (find) {
			console.log(find);
		$('.main').hide();
		$('#ImMassege').show();
		$('#myinput1').val(find);

		},
		error: function(find) {
			Swal.fire("입력한 정보가 없습니다.")
		}
	});
}

function Pw_Find() {
	check = 2;
	var UserId =$('input[name=userId]').val();
	var UserTel = $('input[name=userTel1]').val();
	$.ajax({
		type:"post",
		url:"find_id_pw.do",
		data:{'check' : check, 'UserID' : UserId,'UserTel' : UserTel},
		success: function (find) {
			console.log(find);
			$('.main').hide();
			$('#ImMassege1').show();
			$('#myinput2').val(find);
		},
		error: function (find) {
			Swal.fire('입력한 정보가 없습니다.');
			
		}
	});
}


function Close() {
	window.close();
}

function zoomIn(event) {
    event.target.style.transform = "scale(2.2)";
    event.target.style.zIndex = 1;
    event.target.style.transition = "all 0.5s";
  }

  function zoomOut(event) {
    event.target.style.transform = "scale(1)";
    event.target.style.zIndex = 0;
    event.target.style.transition = "all 0.5s";
  }
  