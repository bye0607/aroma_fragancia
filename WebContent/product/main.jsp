<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var ="context"><%=request.getContextPath()%></c:set>
<!DOCTYPE html>
<html lang="ko">
<head>
   <meta charset="UTF-8" />
   <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
   <title>AROMA, FRAGANCIA</title>
   <link href="${context}/css/bootstrap.min.css" rel="stylesheet">
   <link href="${context}/css/bootstrap-theme.css" rel="stylesheet">
   <link href="${context}/css/vegas.min.css" rel="stylesheet">
   <link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
   
   <!-- fontawesome6.3.0 관리자페이지에 사용 -->
   <link href="${context}/css/fontawesome6.3.0/solid.css" rel="stylesheet">
   <link href="${context}/css/fontawesome6.3.0/v4-shims.css" rel="stylesheet" />  
   <script defer src="${context}/js/fontawesome6.3.0/all.min.js"></script>
       
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
   
   <script src="${context}/js/bootstrap.min.js"></script>
   <script src="${context}/js/jquery-1.9.1.js"></script>
   <script src="${context}/js/common.js"></script>
   <script src="${context}/js/jquery.cookie.js"></script>
   <script type="text/javascript" >
   // 메인 상단 베가스 적용
   $(function(){
      $(".mainveg").vegas({
         delay : 3000,
          slides: [
              {   src: '${context}/img/main/main_visual01.jpg' },
              {   src: '${context}/img/main/main_visual02.jpg' },
              {   src: '${context}/img/main/main_visual03.jpg' },
              {   src: '${context}/img/main/main_visual04.jpg' },
              {   src: '${context}/img/main/main_visual05.jpg' }
          ]
      })
   
      // 쿠키 박스슬라이더 적용   
      $('.bxslider').bxSlider({
           auto: true, 
           speed: 500, 
           pause: 3000,
           mode: 'horizontal',
           autoControls: false,
           pager: false,
           captions: false,
       });
         
      //storyimg
       $(window).scroll( function(){
           $('.hideimg').each( function(i){
               var bottom_of_object = $(this).offset().top + $(this).outerHeight();
               var bottom_of_window = $(window).scrollTop() + $(window).height();
               /* 3 */
               if( bottom_of_window > bottom_of_object/2 ){
                   $(this).animate({'opacity':'1'},2000);
               }
           }); 
       });
   });
   
   // 하단 movebtn joinus 버튼   
   function zoomIn(event) {
       event.target.style.transform = "scale(1.1)";
       event.target.style.zIndex = 1;
       event.target.style.transition = "all 0.5s";
     }
     function zoomOut(event) {
       event.target.style.transform = "scale(1)";
       event.target.style.zIndex = 0;
       event.target.style.transition = "all 0.5s";
     }
   // 쿠키 팝업
  $(function () {
      if ($.cookie("AROMA") == "none") {
        $("#notice_wrap").hide();
      }
      var $expiresChk = $("#expiresChk");
      $(".closeBtn").on("click", closePop);
      function closePop() {
        if ($expiresChk.is(":checked")) {
          $.cookie("AROMA", "none", { expires: 1, path: "/" });
        }
        $("#notice_wrap").fadeOut("fast");
      }
    });

   </script>
</head>

<c:set var="productManageUrl">${context}/work/product/retrieveProductListForManage.do</c:set>
<c:set var="statisticsForProductUrl">${context}/work/sell/retrieveStatisticsForProduct.do</c:set>
<c:set var="statisticsForStockUrl">${context}/work/product/retrieveStatisticsForStock.do?productCategoryCd=P</c:set>
<c:set var="perfumeUrl">${context}/work/product/retrieveProductList.do?category=P</c:set>
<body>
<jsp:include page="${context}/common/top.jsp"></jsp:include>
<!-- 쿠키 팝업 start -->
	<c:if test="${sessionScope.grade != 'A'}">
   <div id="notice_wrap">
     <p>AROMA,FRAGANCIA<br> Better but different</p>
     <ul class="bxslider">
       <li><img src="${context}/img/main/popup_cookie01.jpg" alt="WHITE SHIRTS"></li>
       <li><img src="${context}/img/main/popup_cookie02.jpg" alt="HARSH GREEN"></li>
       <li><img src="${context}/img/main/popup_cookie03.jpg" alt="LILAC SKY"></li>
     </ul>
      <div class="closewrap">
       <br>
       <input type="checkbox" name="expiresChk" id="expiresChk" />
       <label for="expiresChk">오늘 그만보기</label>
       <button class="closeBtn">닫기</button>
     </div>
   </div>
   </c:if>
<!-- 쿠키 팝업 end-->
<c:if test="${sessionScope.grade != 'A'}">
   <!-- main visual - vegas plugin -->
   <div class="mainveg"></div>
       
   <!-- story start -->
   <div class="container storytext">
      <div class="row">
         <div class="col-xs-12 test_obj">
            <p>공간의 공백은 우리에게 형언할 수 없는 감정과 긴장감을 줍니다. <br> 
            그렇게 비움은 우리에게 여운을 남깁니다. <br> 
            비움이란 보이지 않지만 존재하는 것, 만져지지 않지만 가치 있는 것. AROMA FRAGANCIA는 향을 통해 ‘부재의 미학’에 대해 이야기하고자 합니다.
            </p>
            <p>
            AROMA FRAGANCIA는 향의 본질은 장식적인 기교나 의미 부여가 아닌 비우는 것에 있다고 생각합니다.<br> 
            비우고 버려 본질만 남았을 때 부재의 역할은 확장되고 향과 사용자 사이에 관계성을 부여합니다.<br> 
            관계성은 사용자 개인이 가지고 있는 본연의 향을 더욱 돋보이게 만들고 체향과 제품의 향을 아울러 하나의 시적 언어를 탄생시킵니다.
            </p>
         </div>
      </div>
   </div>
    <div class="story">
       <div class="container">
         <h4>Story of <strong>AROMA FRAGANCIA</strong></h4>
           <div class="row storyproduct">
               <div class="col-xs-4 text-center">
                    <img src="${context}/img/main/min_story01.jpg" class="hideimg img-responsive" alt="story1">
               </div> 
               <div class="col-xs-4 text-center">
                   <img src="${context}/img/main/min_story02.jpg" class="hideimg img-responsive" alt="story2">
               </div> 
               <div class="col-xs-4 text-center">
                    <img src="${context}/img/main/min_story03.jpg" class="hideimg img-responsive" alt="story3" >
               </div> 
           </div>
        </div>
   </div><div class="container storytext">
      <div class="row">
         <div class="col-xs-12 test_obj2">
            <p>
            지금, 당신은 스스로에게 만족스러운 향수를 사용하고 있나요? <br>
              - <br>
            전 세계 수만 개의 향수 중 당신의 향수를 찾는 것은 운명과도 같습니다. <br>
            그렇기에 AROMA,FRAGANCIA는 오늘도 향기와 사람을 잇는 매개체가 되어
            새로운 향수들을 끊임없이 탐구하는 일을 멈추지 않습니다. <br>
            당신의 일부가 되는 최적의 향수를 찾는 일, 그것이 AROMA,FRAGANCIA가 존재하는 이유입니다. <br>
            </p>
            <p>AROMA,FRAGANCIA는 조화로운 향기들을 쌓아올려 향을 통해 가장 나다운 향을 찾기 위한 여정을 함께합니다. </p>
         </div>
      </div>
   </div>
   <!-- story end -->
   <!-- fill your color start -->
   <div class="maincolor">
      <h4> Fill Your Color </h4>
        <div class="colorproduct">
            <div>
                <li class="mc-a">
                    <img src="${context}/img/main/color1.jpg" class="mc-b" alt="color1">
                    <img src="${context}/img/main/chover1.jpg" class="mc-c" alt="chover1">
                <li>
            </div> 
            <div>
                <li class="mc-a">
                   <img src="${context}/img/main/color2.jpg" class="mc-b" alt="color2">
                    <img src="${context}/img/main/chover2.jpg" class="mc-c" alt="chover2">
                </li>
            </div> 
            <div>
                <li class="mc-a">
                    <img src="${context}/img/main/color3.jpg" class="mc-b" alt="color3">
                    <img src="${context}/img/main/chover3.jpg" class="mc-c" alt="chover3">
                </li>
            </div> 
            <div>
                <li class="mc-a">
                    <img src="${context}/img/main/color4.jpg" class="mc-b" alt="color4">
                    <img src="${context}/img/main/chover4.jpg" class="mc-c" alt="chover4">
                </li>
            </div> 
            <div>
                <li class="mc-a">
                    <img src="${context}/img/main/color5.jpg" class="mc-b" alt="color5">
                    <img src="${context}/img/main/chover5.jpg" class="mc-c" alt="chover5">
                </li>
            </div> 
            <div>
                <li class="mc-a">
                    <img src="${context}/img/main/color6.jpg" class="mc-b" alt="color6">
                    <img src="${context}/img/main/chover6.jpg" class="mc-c" alt="chover6">
                </li>
            </div> 
            <div>
                <li class="mc-a">
                    <img src="${context}/img/main/color7.jpg" class="mc-b" alt="color7">
                    <img src="${context}/img/main/chover7.jpg" class="mc-c" alt="chover7">
                </li>
            </div> 
            <div>
                <li class="mc-a">
                    <img src="${context}/img/main/color8.jpg" class="mc-b" alt="color8">
                    <img src="${context}/img/main/chover8.jpg" class="mc-c" alt="chover8">
                </li>
            </div> 
        </div>
        <h4><input onclick="javascript:fn_isLogin('${sessionScope.userCode}','${loginUrl}','${perfumeUrl}')" type="button" value="제품 둘러보기 →" class="probtn"></h4>
   </div>
   <!-- fill your color end -->
   <div class="container sixwrap">
       <div class="row sixcontext">
            <div class="col-sm-6 col-md-4 sixb">
                  <p>Find Your Signature</p>
                  <span>‘가장 나다운 향’을 찾기 위한<br>여정을 함께합니다.</span>
            </div>
            <div class="col-sm-6 col-md-4 sixb">
               <p>Eco friendly</p>
               <span>내가 좋아하는 향기를<br>마음 편하게 사용하세요.</span>
            </div>
            <div class="col-sm-6 col-md-4 sixb">
               <p>Surfactants</p>
               <span>순수 천연 탈취 성분만을<br>고집합니다.</span>
            </div> 
            <div class="col-sm-6 col-md-4 sixb">
               <p>Belief</p>
               <span>안전한 제품을 만들기 위해<br>노력합니다.</span>
            </div>
            <div class="col-sm-6 col-md-4 sixb b1">
               <p>Better but different</p>
               <span>남들과는 다른,<br>더 나은 것들을 만듭니다.</span>
            </div>
            <div class="col-sm-6 col-md-4 sixb">
               <p>Discovery Me By Perfume</p>
               <span>향을 통해<br>나를 발견하세요.</span>
            </div>
      </div>
      <br>
   </div>
   <!-- JOIN US start -->
   <div class="container">
      <div class="row">
         <div class="col-xs-12">
            <div class="movebtn" onmouseenter="zoomIn(event)" onmouseleave="zoomOut(event)">
               <P class="title">AROMA FRAGANCIA JOIN US</P>
               <p>
                  회원이 되어 더 많은 향기 정보를 얻어보세요. <br>
                  자극없이 은은하고 뿌리는 순간 감각적인 무드를 연출해주는 다양한 상품들과 <br>
                  온라인에서도 편리하게 만날 수 있는 향기 상담 신청 서비스를 이용해보세요.
               </p>
               <input type="button" value="JOIN US  →" class="move" onClick="location.href='${context}/user/login.jsp'">
            </div>
         </div>
      </div>
   </div>
   <!-- JOIN US end -->
   <!-- 찾아오시는 길 start -->
   <div class="container">
      <div class="maptitle"> AROMA FRAGANCIA <br> 오프라인 매장 찾아오시는 길</div>
      <div class="row mainmap">
         <div class="col-sm-12 col-md-6">
            <div id="map"></div>
         </div>
         <script type="text/javascript" src="http://dapi.kakao.com/v2/maps/sdk.js?appkey=c2c33a097ac052287fa856172f2eb50d"></script>
         <script>
            var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
                mapOption = { 
                    center: new kakao.maps.LatLng(37.518818, 127.022936), // 지도의 중심좌표
                    level: 3 // 지도의 확대 레벨
                };
            
            var map = new kakao.maps.Map(mapContainer, mapOption);
            
            // 마커가 표시될 위치입니다 
            var markerPosition  = new kakao.maps.LatLng(37.518818, 127.022936); 
            
            // 마커를 생성합니다
            var marker = new kakao.maps.Marker({
                position: markerPosition
            });
            
            // 마커가 지도 위에 표시되도록 설정합니다
            marker.setMap(map);
            
            var iwContent = '<div style="padding:5px;">AROMA FRAGANCIA<br><a href="https://map.kakao.com/link/map/AROMA,37.518818, 127.022936" style="color:blue" target="_blank">큰지도보기</a> <a href="https://map.kakao.com/link/to/AROMA FRAGANCIA,37.518818, 127.022936" style="color:blue" target="_blank">길찾기</a></div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
                iwPosition = new kakao.maps.LatLng(37.518818, 127.022936); //인포윈도우 표시 위치입니다
            
            // 인포윈도우를 생성합니다
            var infowindow = new kakao.maps.InfoWindow({
                position : iwPosition, 
                content : iwContent 
            });
              
            // 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
            infowindow.open(map, marker); 
            
              // onresize 이벤트 함수를 이용하여 맵과 마커의 위치를 relayout함수로 불러오고, 마커의 위치를 센터로 지정
              window.onresize = function () {
                    console.log("resize");
                    if (map != null) { map.relayout();
                        if (marker != null) {
                          var markerPosition = marker.getPosition();
                          map.setCenter(markerPosition);
                        }
                      }
                    };
         </script>
         <div class="col-sm-12 col-md-6 transport">
            <h3>대중교통 / 자가용 이용 시</h3>
              <table class="table table-hover">
                <tr>
                  <td>
                    <p class="tptitle">지하철 이용</p> 
                    <p class="tptext">
                          신분당선, 서울지하철 3호선 이용 가능 <br>
                          지하철 3호선 신사역 8번출구에서 약 80m 직진
                    </p>
                  </td>
                </tr>
                <tr>
                  <td>
                     <p class="tptitle">버스 이용</p>
                     <p class="tptext">
                      버스정류장 신사역(12-345) <br>
                   NH농협은행 방면 하차 후 100m 직진<br>
                    ※ 버스 : 733, 271A, 273, 603, 604, 761, N62,5712등
                    </p>
                  </td>
                </tr>
                <tr>
                  <td>
                     <p class="tptitle">승용차 이용</p>
                     <p class="tptext">
                      주차공간이 협소하오니 되도록 대중교통을 이용하여 주시기 바랍니다.
                     <br>
                       주차정보안내시스템
                     <a href="http://parking.seoul.go.kr/">(http://parking.seoul.go.kr/)</a>에서 오프라인 매장 주변 공영주차장을 확인하실 수 있습니다.
                     </p>
                  </td>
                </tr>
              </table>
         </div>
      </div>
      <!-- 찾아오시는 길 start -->
   </div>
   <!-- container end -->            
</c:if>
         
      <!-- 관리자 페이지 -->
      <c:if test="${sessionScope.grade == 'A'}">
      <div class="container adminmode">
          <div class="row">
               <div class="col-md-4 text-center adminlink" onclick="location.href='${productManageUrl}'">
               <div class="img-circle">
                  <span>
                     <i class="fa-solid fa-store fa-8x" style="color:white;"></i>
                  </span>
               </div>
               <h1>재고관리</h1>
            </div>
               <div class="col-md-4 text-center adminlink" onclick="location.href='${statisticsForProductUrl}'">
                  <div class="img-circle">
                     <span>
                        <i class="fa-solid fa-chart-pie fa-8x" style="color:white;"></i>
                  </span>
                </div>
               <h1>매출통계</h1>
            </div>
               <div class="col-md-4 text-center adminlink" onclick="location.href='${statisticsForStockUrl}'">
                  <div class="img-circle">
                     <span>
                        <i class="fa-solid fa-boxes-stacked fa-8x" style="color:white;"></i>
                  </span>
                 </div>
               <h1>재고현황</h1>
            </div> 
         </div>
      </div>
      </c:if>

<jsp:include page="${context}/common/foot.jsp"></jsp:include>
   
<!-- 베가스 추가 -->
<script type="text/javascript" src="${context}/js/vegas.min.js"></script>
<!-- 박스슬라이더 추가 -->
<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>

</body>
</html>