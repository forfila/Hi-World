var pw = false;
var pwc = false;
var tel = false;
var address = false;
	$(document).ready(function() {
			
		/* 패스워드 정규규현식과 더불어 패스워드가 같은지 질문*/
		  
		 $("input[class=Pwchc1]").blur(function() {
					var userpw = $("input[name=userPW]").val();
					var pwCheck = RegExp(/^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#$%^*()\-_=+\\\|\[\]{};:\'",.<>\/?]).{8,16}$/);
					if (userpw.search(/\s/) != -1) {
						pw = false;
						var html = "<tr><td colspan='3' style='color: red'>공백없이 작성 하세요</td></tr>";
						$('.message').empty();
						$('.message').html(html);
						$("input[class=Pwchc1]").focus();
					} else if (userpw == "") {
						pw = false;
						var html = "<tr><td colspan='3' style='color: red'>필수 사항 입니다.</td></tr>";
						$('.message').empty();
						$('.message').html(html);
						$("input[class=Pwchc1]").focus();
					} else if (!pwCheck.test(userpw)) {
						pw = false;
						var html = "<tr><td colspan='3' style='color: red'>사용 불가능한 비밀번호 입니다.</td></tr>";
						$('.message').empty();
						$('.message').html(html);
						$("input[class=Pwchc1]").focus();
					} else {
						pw = true;
						var html = "<tr><td colspan='3' style='color: green'>사용가능한 비밀번호입니다.</td></tr>";
						$('.message').empty();
						$('.message').html(html);
					}
				});
				//패스워드 확인
				$("input[name=userPW1]").blur(function() {
					if ($("input[name=userPW1]").val() != $("input[class=Pwchc1]").val()) {
						pwc = false;
						var html = "<tr><td colspan='3' style='color: red'>비밀번호가 다릅니다.</td></tr>";
						$('.message1').empty();
						$('.message1').html(html);
						$("input[name=userPW1]").focus();
					}
					//같을 경우
					else{
						pwc = true;
						$('.message1').empty();
						}
				});
				
				//연락처 정규식 및 안적었을때 기능
				$('input[name=userTel').blur(function() {
					var phone = RegExp(/^[0-9]{3}(-)[0-9]{4}(-)[0-9]{4}$/);
					var phone1 = $('input[name=userTel').val();
					if(phone1 .search(/\s/) != -1){
						$('input[name=userTel').focus();
						tel = false;
						var html = "<tr><td colspan='3' style='color: red'>공백 없이 작성 하세요</td></tr>";
						$('.message2').empty();
						$('.message2').html(html);
						
					} else if(phone1 == ''){
						tel = false;
						var html = "<tr><td colspan='3' style='color: red'>필수사항 입니다.</td></tr>";
						$('.message2').empty();
						$('.message2').html(html);
						$('input[name=userTel').focus();
					} else if(phone.test(phone1)){
						tel = true;
						$('.message2').empty();
					}	else {
						tel = false;
						var html = "<tr><td colspan='3' style='color: red'>예)010-0000-0000 처럼 적어주세요</td></tr>";
						$('.message2').empty();
						$('.message2').html(html);
						$('input[name=userTel').focus();
					}
				});
				
	
				//주소 정규식과 기능 구현
				$('input[name=useraddress]').blur(function() {
					var add = /^[가-힣a-zA-Z0-9\s]*$/;
					var add1 = $('input[name=useraddress]').val();
					if(!add.test(add1)){
						address = false;
						var html = "<tr><td colspan='3' style='color: red'>사용 불가능한 주소입니다.</td></tr>";
						$('.message3').empty();
						$('.message3').html(html);
						add1.focus();
					}
					
					else{
						address = true;
						$('.message3').empty();
						}
				});	
	 
	});
	      
	      
	      
	/* +++++++++++++++++++++++++++++++++++++++++++++  */




/*  여기부터 userview Update */

			function pwUpdate() {
				if (pw != true) {
				$("input[name=userPW]").focus()
				return false;
				}else if(pwc !=true){
				$("input[name=userPW1]").focus()
				return false;
				}
				else{
				var ajaxPW = $('input[name=userPW]').val();
				var upDatech = 1;
				$.ajax({
					url : "UserUpdate.do",
					type:"POST",
					data : {"userDate" : ajaxPW, "upDatech":upDatech},
					success: function(data) {
						
						if($('.hiden1').css('display') == 'none'){
							$('.hiden1').val(ajaxPW);
							$('.hiden1').show();
							$('.pwhiden').hide();
							}
						},
					   			error : function () {
									alert("error")
					}
				});
			}
		}
		function telUpdate() {
			if (tel != true) {
				$("input[name=userTel]").focus()
				return false;
				}
			var ajaxTel = $('input[name=userTel]').val();
			var upDatech = 2;
			$.ajax({
				url : "UserUpdate.do",
				type:"POST",
				data : {"userDate" : ajaxTel, "upDatech":upDatech},
				success: function(data) {
					
					if($('.telhiden').css('display') == 'none'){
						$('.telhiden').html(ajaxTel).css('color','red').append('<input type="button" id="telbut1" value="수정" onclick="telUpdate1()" />');
						$('.telhiden').show();
						$('.telhiden1').hide();
						}
					},
				   			error : function () {
								alert("error")
				}
			});
		}

		
		function addressUpdate() {
			if (address != true) {
				$("input[name=useraddress]").focus()
				return false;
				}
			var ajaxaddress = $('input[name=useraddress]').val();
			var upDatech = 3;
			$.ajax({
				url : "UserUpdate.do",
				type:"POST",
				data : {"userDate" : ajaxaddress, "upDatech":upDatech},
				success: function(data) {
					
					if($('.address_hiden1').css('display') == 'none'){
						$('.address_hiden1').html(ajaxaddress).css('color','red').append('<input type="button" id="addressBut" value="수정" onclick="addressUpdate1()" />');
						$('.address_hiden1').show();
						$('.address_hiden').hide();
						}
					},
				   			error : function () {
								alert("error")
				}
			});
		}
	
		function pwUpdate1() {
			if($('.pwhiden').css('display') == 'none'){
				$('.hiden1').hide();
				$('.pwhiden').show();
			}
		}
		
		function cancle2() {
			if($('.hiden1').css('display') == 'none'){
				$('.pwhiden').hide();
				$('.hiden1').show();
			}
		}
		
		function telUpdate1() {
			if($('.telhiden1').css('display') == 'none'){
				$('.telhiden1').show();
				$('.telhiden').hide();
			}
		}
		function cancle3() {
			if($('.telhiden').css('display') == 'none'){
				$('.telhiden').show();
				$('.telhiden1').hide();
			}
		}
		
		function addressUpdate1() {
			if($('.address_hiden').css('display') == 'none'){
				$('.address_hiden').show();
				$('.address_hiden1').hide();
			}
		}
		function cancle5() {
			if($('.address_hiden1').css('display') == 'none'){
				$('.address_hiden1').show();
				$('.address_hiden').hide();
			}
		}
/* =================여기까지 입니다.=============================  */
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
 