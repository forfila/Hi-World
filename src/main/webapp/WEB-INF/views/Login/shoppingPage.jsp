<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="resources/css/shoppingPage.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script>
      function shop_character(list){
              //ajax option
               console.log("1234") 
              var ajaxOption={
                    type: "GET",
                      url : "sangpoom.do",
                      dataType : "html",
                      data: {"list":list},
                      async:true,
                      cache:false
                    
              }
              $.ajax(ajaxOption).done(function(data){
                 //Contents 영역삭제
                 $('.sangpum').children().remove();
                 console.log("1111") 
                 //Contents 영역 교체
                 $('.sangpum').html(data);
              }).fail(function(error) {
                   alert(JSON.stringify(error));
                   console.log("에러를 찾자");
               });
             };
    function shop_background(list){
              //ajax option
              console.log("1234") 
             var ajaxOption2={
                   type: "GET",
                     url : "sangpoom.do",
                     dataType : "html", 
                     data: {"list":list},
                     async:true,
                     cache:false
                   
             }
             $.ajax(ajaxOption2).done(function(data){
                //Contents 영역삭제
                $('.sangpum').children().remove();
                console.log("1111") 
                //Contents 영역 교체
                $('.sangpum').html(data);
             }).fail(function(error) {
                  alert(JSON.stringify(error));
                  console.log("에러를 찾자");
              });
            };

     function shop_music(list){
               //ajax option
               console.log("1234") 
              var ajaxOption3={
                    type: "GET",
                      url : "sangpoom.do",
                      data: {"list":list},
                      dataType : "html", 
                      async:true,
                      cache:false
                    
              }
              $.ajax(ajaxOption3).done(function(data){
                 //Contents 영역삭제
                 $('.sangpum').children().remove();
                 console.log("1111") 
                 //Contents 영역 교체
                 $('.sangpum').html(data);
              }).fail(function(error) {
                   alert(JSON.stringify(error));
                   console.log("에러를 찾자");
               });
             };


    function shop_mouse(list){
              //ajax option
              console.log("1234") 
                var ajaxOption4={
                      type: "GET",
                        url : "sangpoom.do",
                        dataType : "html", 
                        data: {"list":list},
                        async:true,
                        cache:false
                   
             }
             $.ajax(ajaxOption4).done(function(data){
                //Contents 영역삭제
                $('.sangpum').children().remove();
                console.log("1111") 
                //Contents 영역 교체
                $('.sangpum').html(data);
             }).fail(function(error) {
                  alert(JSON.stringify(error));
                  console.log("에러를 찾자");
              });
            };
            
            
            function shop_skin(list){
                 //ajax option
                 console.log("1234") 
                   var ajaxOption5={
                         type: "GET",
                           url : "sangpoom.do",
                           dataType : "html", 
                           data: {"list":list},
                           async:true,
                           cache:false
                      
                }
                $.ajax(ajaxOption5).done(function(data){
                   //Contents 영역삭제
                   $('.sangpum').children().remove();
                   console.log("1111") 
                   //Contents 영역 교체
                   $('.sangpum').html(data);
                }).fail(function(error) {
                     alert(JSON.stringify(error));
                     console.log("에러를 찾자");
                 });
               };
            
    </script>
</head>
<body>

<div id="Context">
   <div class="Navi">
      <div class="Navihover" onclick="shop_character('캐릭터')">캐릭터</div>
      <div class="Navihover" onclick="shop_background('배경')">배경화면</div>
      <div class="Navihover" onclick="shop_music('음악')">음악</div>
      <div class="Navihover" onclick="shop_mouse('마우스')">마우스포인터</div>
      <div class="Navihover" onclick="shop_skin('스킨')">스킨</div>
   </div>

   <div class="sangpum">

      
      <table>
      <tr id="tablehead">
            <td>상품</td>
            <td>종류</td>
            <td>상품명</td>
            <td>가격</td>
            <td>구매하기</td>
            <td>장바구니로가기</td>
      </tr>
      <c:forEach var="kinds" items="${ArticleList}">
         <tr>
            <c:set var="check" value="${kinds.articleImg}" />
            <c:if test="${fn:contains(check,'.png')}">
               <th style="width: 27%"><img src="${kinds.articleImg}" onerror="this.src='resources/images/article/music.png'" /></th>
               <th>${kinds.articleKinds}</th>
               <th>${kinds.articleName}</th>
               <th>${kinds.articlePrice}</th>
               <th><a href="#" class="shoppinghover" onclick="bay('${kinds.articleName}'+','+'${kinds.articlePrice}')">구매하기</a></th>
               <th><a href="#" class="shoppinghover" onclick="basket('${kinds.articleName}')">장바구니담기</a></th>
            </c:if>
            <c:if test="${fn:contains(check,'.jpg')}">
               <th><img src="${kinds.articleImg}" onerror="this.src='resources/images/article/music.png'" /></th>
               <th>${kinds.articleKinds}</th>
               <th>${kinds.articleName}</th>
               <th>${kinds.articlePrice}</th>
               <th><a href="#"   class="shoppinghover" onclick="bay('${kinds.articleName}'+','+'${kinds.articlePrice}')">구매하기</a></th>
               <th><a href="#" class="shoppinghover" onclick="basket('${kinds.articleName}')">장바구니담기</a></th>
            </c:if>
            <c:if test="${fn:contains(check, '.mp3')}">
               <th><img src="${kinds.articleImg}" onerror="this.src='resources/images/article/music.png'" /></th>
               <th>${kinds.articleKinds}</th>
               <th>${kinds.articleName}</th>
               <th>${kinds.articlePrice}</th>
               <th><a href="#" class="shoppinghover" onclick="bay('${kinds.articleName}'+','+'${kinds.articlePrice}')">구매하기</a></th>
               <th><a href="#" class="shoppinghover" onclick="basket('${kinds.articleName}')">장바구니담기</a></th>
            </c:if>
         </tr>

      </c:forEach>
         
      </table>
   
   
   <div style="text-align:center; margin-top:5px;">
   
        <c:if test="${pagination.curRange ne 1 }">
            <a href="#" class="shoppinghover" onClick="fn_paging(1)">[처음]</a> 
        </c:if>
        <c:if test="${pagination.curPage ne 1}">
            <a href="#" class="shoppinghover" onClick="fn_paging('${pagination.prevPage }')">[이전]</a> 
        </c:if>
        <c:if test="${listCnt > 4}">
        <c:forEach var="pageNum" begin="${pagination.startPage}" end="${pagination.endPage }">
            <c:choose>
                <c:when test="${pageNum eq  pagination.curPage}">
                    <span style="font-weight: bold;"><a href="#" class="shoppinghover" onClick="fn_paging('${pageNum }')">${pageNum }</a></span> 
                </c:when>
                <c:otherwise>
                    <a href="#" class="shoppinghover" onClick="fn_paging('${pageNum }')">${pageNum }</a> 
                </c:otherwise>
            </c:choose>
        </c:forEach>
        </c:if>
        <c:if test="${pagination.curPage ne pagination.pageCnt && pagination.pageCnt > 0}">
            <a href="#" class="shoppinghover" onClick="fn_paging('${pagination.nextPage }')">[다음]</a> 
        </c:if>
        <c:if test="${pagination.curRange ne pagination.rangeCnt && pagination.rangeCnt > 0}">
            <a href="#" class="shoppinghover" onClick="fn_paging('${pagination.pageCnt }')">[끝]</a> 
        </c:if>
  
   </div>
</div>
</div>


</body>
<script>

   function fn_paging(curPage) {
       var ajaxMain = {
               url : 'sangpoom.do?list=쇼핑&curPage='+curPage,
               async : true,
               type : "GET",
               dataType : "html",
               cache : false
       };
   $.ajax(ajaxMain).done(function(data){
           $('#Context').children().remove();
          // Contents 영역 교체
           $('#Context').html(data);
    });
   }

   function basket(ArticleName) {
      var UserSerial = '${sessionVO.userSerial}';
      
      if(UserSerial!=''&&UserSerial!=null){
         $.ajax({
            type: "GET",
            url: "basket.do",
            data: {
               "UserSerial" : UserSerial,
               "ArticleName" : ArticleName
            },
            success : function (data) {
               if(data==1){
                  Swal.fire("장바구니에 들어갔습니다");
               }else if(data==0){
                  Swal.fire("이미 구매한 상품입니다");
               }else if(data==-1){
                  Swal.fire("장바구니 담기 실패했습니다");
               }else if(data==-2){
                  Swal.fire("이미 장바구니에 들어가있습니다");
               }
            }
         })
      }else{
         Swal.fire("로그인 후 이용해주세요");
      }
   }

   function bay(ArticleName) {
      var UserSerial = '${sessionVO.userSerial}';
      
      /* alert 창 */
      if(UserSerial != ''){
         Swal.fire({
           title: '정말 구매하시겠습니까??',
           text: "구매 하신 후 환불은 어렵습니다",
           icon: 'warning',
           showCancelButton: true,
           confirmButtonColor: '#3085d6',
           cancelButtonColor: '#d33',
           confirmButtonText: 'Yes'
         }).then((result) => {
           if (result.isConfirmed) {
             Swal.fire(
                $.ajax({
                  type: "GET",
                  url: "bay.do",
                  data:{
                     "UserSerial" : UserSerial,
                     "ArticleName" : ArticleName
                  },
                  success: function (data) {
                     if(data==1){
                        Swal.fire({
                             position: 'center',
                             icon: 'success',
                             title: '결제성공 잠시후 메인페이지로 이동합니다',
                             showConfirmButton: false,
                             timer: 1500
                           })                     
                        setTimeout(() => {
                           location.reload();                  
                        }, 1500);
                     }else if(data==0){
                        Swal.fire('밤톨이 부족합니다 5초뒤 충전페이지가 열립니다');
                        setTimeout(() => {
                           var popupWidth =880
                               var popupHeight =580
                               var popupX = (window.screen.width/2)-(popupWidth/2);
                               var popupY = (window.screen.height/2)-(popupHeight/2);
                               window.open("BamTolCharge.do","미니홈페이지",'status=no, scrollbars=no, menubar=no, toolbar=no, height=' + popupHeight  + ', width=' + popupWidth  + ', left='+ popupX + ', top='+ popupY)  
                        }, 5000);
                     }else if(data==-1){
                        Swal.fire('이미 구매한 상품입니다.')
                     }
                  }
               })
             )
           }
        })
      }else{
         Swal.fire("로그인 후 이용해주세요");
      }
   }
</script>
</html>