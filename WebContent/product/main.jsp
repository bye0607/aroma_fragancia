<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var ="context"><%=request.getContextPath()%></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="description" content="main.jsp">
<title>AROMA, FRAGANCIA</title>
<link href="${context}/css/bootstrap.min.css" rel="stylesheet">
<link href="${context}/css/bootstrap-theme.css" rel="stylesheet">
<link href="${context}/css/vegas.min.css" rel="stylesheet">
 

<script src="${context}/js/bootstrap.min.js"></script>
<script src="${context}/js/jquery-1.9.1.js"></script>
<script src="${context}/js/jquery.cookie.js"></script>
<script src="${context}/js/common.js"></script>


</head>

<c:set var="loginUrl">${context}/user/login.jsp</c:set>

<c:set var="officeUrl">${context}/work/product/retrieveProductList.do?category=${dsProductList[0].PRODUCT_CATEGORY_CD}</c:set>
<c:set var="penUrl">${context}/work/product/retrieveProductList.do?category=${dsProductList[1].PRODUCT_CATEGORY_CD}</c:set>
<c:set var="binderUrl">${context}/work/product/retrieveProductList.do?category=${dsProductList[2].PRODUCT_CATEGORY_CD}</c:set>
<c:set var="designUrl">${context}/work/product/retrieveProductList.do?category=${dsProductList[3].PRODUCT_CATEGORY_CD}</c:set>
<c:set var="storageUrl">${context}/work/product/retrieveProductList.do?category=${dsProductList[4].PRODUCT_CATEGORY_CD}</c:set>

<c:set var="productManageUrl">${context}/work/product/retrieveProductListForManage.do</c:set>
<c:set var="statisticsForProductUrl">${context}/work/sell/retrieveStatisticsForProduct.do</c:set>
<c:set var="statisticsForStockUrl">${context}/work/product/retrieveStatisticsForStock.do?productCategoryCd=P</c:set>

<script type="text/javascript" >
$(function(){
	$(".mainveg").vegas({
		delay : 3000,
	    slides: [
	        {   src: '/mainveg/main_s1.jpg' },
	        {   src: '/mainveg/main_s2.jpg' },
	        {   src: '/mainveg/main_s3.jpg' },
	        {   src: '/mainveg/main_s4.jpg' },
	        {   src: '/mainveg/main_s5.jpg' }
	    ]
	})
});




$(document).ready(function() {
    /* 1 */
    $(window).scroll( function(){
        /* 2 */
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
  
  if(getCookie("notToday")!="Y"){
		$("#popup_image").show('fade');
}

function closePopupNotToday(){	             
		setCookie('notToday','Y', 1);
		$("#popup_image").hide('fade');
}
function setCookie(name, value, expiredays) {
	var today = new Date();
	    today.setDate(today.getDate() + expiredays);

	    document.cookie = name + '=' + escape(value) + '; path=/; expires=' + today.toGMTString() + "; domain=example.com";
}

function getCookie(name) 
{ 
  var cName = name + "="; 
  var x = 0; 
  while ( x <= document.cookie.length ) 
  { 
      var y = (x+cName.length); 
      if ( document.cookie.substring( x, y ) == cName ) 
      { 
          if ( (endOfCookie=document.cookie.indexOf( ";", y )) == -1 ) 
              endOfCookie = document.cookie.length;
          return unescape( document.cookie.substring( y, endOfCookie ) ); 
      } 
      x = document.cookie.indexOf( " ", x ) + 1; 
      if ( x == 0 ) 
          break; 
  } 
  return ""; 
}
function closeMainPopup(){
	$("#popup_image").hide('fade');
}
  
(function(){var w=window;if(w.ChannelIO){return w.console.error("ChannelIO script included twice.")}var ch=function(){ch.c(arguments)};ch.q=[];ch.c=function(args){ch.q.push(args)};w.ChannelIO=ch;function l(){if(w.ChannelIOInitialized){return}w.ChannelIOInitialized=true;var s=document.createElement("script");s.type="text/javascript";s.async=true;s.src="https://cdn.channel.io/plugin/ch-plugin-web.js";var x=document.getElementsByTagName("script")[0];if(x.parentNode){x.parentNode.insertBefore(s,x)}}if(document.readyState==="complete"){l()}else{w.addEventListener("DOMContentLoaded",l);w.addEventListener("load",l)}})();

ChannelIO('boot', {
  "pluginKey": "84091ac2-0c80-450c-a7c1-2b8955b6f6af"
});
</script>
<style>
*{

	font-family: "Crimson Pro";
}
    @keyframes fadeInUp {
        0% {
            opacity: 0;
            transform: translate3d(0, 100%, 0);
        }
        to {
            opacity: 1;
            transform: translateZ(0);
        }
    }
 
    .test_obj {
        position: relative;
        animation: fadeInUp 3s;
    }
    .test_obj2 {
        position: relative;
        animation: fadeInUp 6s;
    }
    
    
  /* 쿠키 */

.popup_image{
    margin-left: 30px;
    margin-top: 30px;
    background-color: #F7F9F6;
}

.popup_image > p{
	
	color: black;
	text-align: center;
	font-size: 25px;
	
	font-family: "Crimson Pro";
	
}
.popup_bar{
    background-color: #F7F9F6;
    color: black;
    height: 25px;
    padding: 10px 20px 36px 10px;
    width: 310px;
}
    
    /*media*/
	@media (max-width: 988px){
	
	.probtn{
		margin-left : 40%;
	}
		
	.movebtn{
		height: 200px;
		width: 500px !important;
		text-align: center;
		margin: 0 auto;
		border-radius: 70px; 
	}
	}
	@media screen and (min-width: 600px){
		.probtn{
			margin-left : 20%;
		}
		#map{
	     width: 500px;
	     height: 500px;
	     
	     margin-right: 40px;
	     margin-top: 160px;
	     margin-bottom: 30px;
	}

		.movebtn{
			width: 200px;
		}
		

	}
</style>

<body>
<jsp:include page="../common/top.jsp"></jsp:include>
	<c:if test="${sessionScope.grade != 'A'}">
	<!-- 쿠키 -->	
	<div id="popup_image" class="popup_image" style="position: absolute; z-index:1; ">
		<p>  <br>
		AROMA,FRAGANCIA<br>
		Better but different</p>
		<img src="/mainimgg/cookie1.jpg" />
		<div class="popup_bar">
			<a href="javascript:closePopupNotToday()" class="white">오늘그만보기</a>
			<a class="pull-right white" href="javascript:closeMainPopup();">닫기</a>
		</div>
	</div>
        


		<div class="mainveg" style="height: 700px;">
    		<!-- vegas -->
		</div>
		
		
        
        
		<div class="container storytext storytext1 test_obj" >
			<p>공간의 공백은 우리에게 형언할 수 없는 감정과 긴장감을 줍니다. <br> 
			그렇게 비움은 우리에게 여운을 남깁니다. <br> 
			비움이란 보이지 않지만 존재하는 것, 만져지지 않지만 가치 있는 것. AROMA FRAGANCIA는 향을 통해 ‘부재의 미학’에 대해 이야기하고자 합니다.<br>
			<br>
			AROMA FRAGANCIA는 향의 본질은 장식적인 기교나 의미 부여가 아닌 비우는 것에 있다고 생각합니다.<br> 
			비우고 버려 본질만 남았을 때 부재의 역할은 확장되고 향과 사용자 사이에 관계성을 부여합니다.<br> 
			관계성은 사용자 개인이 가지고 있는 본연의 향을 더욱 돋보이게 만들고 체향과 제품의 향을 아울러 하나의 시적 언어를 탄생시킵니다.</p>
		</div>
	 
	 	<div class="story">
			<h4> Story of <strong>AROMA FRAGANCIA</strong></h4>
		        <div class="storyproduct">
		            <div>
		                <li>
		                    <img src="/mainimgg/story1.jpg" alt="story1" class="hideimg" style="margin:0px;">
		                <li>
		            </div> 
		            <div>
		                <li>
		                <img src="/mainimgg/story2.jpg" class="hideimg" alt="story2">
		                </li>
		            </div> 
		            <div>
		                <li>
		                    <img src="/mainimgg/story3.jpg" class="hideimg" alt="story3" >
		                </li>
		            </div> 
		        </div>
			</div>
		
		<div class="container storytext test_obj test_obj2">
			<p>
			지금, 당신은 스스로에게 만족스러운 향수를 사용하고 있나요? <br>
			  - <br>
				전 세계 수만 개의 향수 중 당신의 향수를 찾는 것은 운명과도 같습니다. <br>
				그렇기에 AROMA,FRAGANCIA는 오늘도 향기와 사람을 잇는 매개체가 되어
				새로운 향수들을 끊임없이 탐구하는 일을 멈추지 않습니다. <br>
				
				당신의 일부가 되는 최적의 향수를 찾는 일, 그것이 AROMA,FRAGANCIA가 존재하는 이유입니다. <br>
			</p>
			
			<p class="story_sub">AROMA,FRAGANCIA는 조화로운 향기들을 쌓아올려 향을 통해 가장 나다운 향을 찾기 위한 여정을 함께합니다. </p>
		</div>
			
		<div class="maincolor">
			<h4> Fill Your Color </h4>
	        <div class="colorproduct">
	            <div>
	                <li class="mc-a">
	                    <img src="/mainimgg/color1.jpg" class="mc-b" alt="color1">
	                    <img src="/mainimgg/chover1.jpg" class="mc-c" alt="chover1">
	                <li>
	            </div> 
	            <div>
	                <li class="mc-a">
	                	<img src="/mainimgg/color2.jpg" class="mc-b" alt="color2">
	                    <img src="/mainimgg/chover2.jpg" class="mc-c" alt="chover2">
	                </li>
	            </div> 
	            <div>
	                <li class="mc-a">
	                    <img src="/mainimgg/color3.jpg" class="mc-b" alt="color3">
	                    <img src="/mainimgg/chover3.jpg" class="mc-c" alt="chover3">
	                </li>
	            </div> 
	            <div>
	                <li class="mc-a">
	                    <img src="/mainimgg/color4.jpg" class="mc-b" alt="color4">
	                    <img src="/mainimgg/chover4.jpg" class="mc-c" alt="chover4">
	                </li>
	            </div> 
	            <div>
	                <li class="mc-a">
	                    <img src="/mainimgg/color5.jpg" class="mc-b" alt="color5">
	                    <img src="/mainimgg/chover5.jpg" class="mc-c" alt="chover5">
	                </li>
	            </div> 
	            <div>
	                <li class="mc-a">
	                    <img src="/mainimgg/color6.jpg" class="mc-b" alt="color6">
	                    <img src="/mainimgg/chover6.jpg" class="mc-c" alt="chover6">
	                </li>
	            </div> 
	            <div>
	                <li class="mc-a">
	                    <img src="/mainimgg/color7.jpg" class="mc-b" alt="color7">
	                    <img src="/mainimgg/chover7.jpg" class="mc-c" alt="chover7">
	                </li>
	            </div> 
	            <div>
	                <li class="mc-a">
	                    <img src="/mainimgg/color8.jpg" class="mc-b" alt="color8">
	                    <img src="/mainimgg/chover8.jpg" class="mc-c" alt="chover8">
	                </li>
	            </div> 
	        </div>
	        <input onclick="javascript:fn_isLogin('${sessionScope.userCode}','${loginUrl}','${perfumeUrl}')" type="button" value="제품 둘러보기 →" class="probtn">
		</div>


	


		<div class="container sixwrap">
		 	<div class="sixcontext">
	            <div class="sixb"> <strong>Find Your Signature</strong> <br> <br> ‘가장 나다운 향’을 찾기 위한 여정을 함께합니다.</div>
	            <div class="sixb"> <strong>Eco friendly</strong> <br> <br> 내가 좋아하는 향기를 마음 편하게 사용하세요.</div>
	            <div class="sixb"> <strong>Surfactants</strong> <br> <br> 순수 천연 탈취 성분만을 고집합니다.</div> 
			</div>
		 	<div class="sixcontext">
	            <div class="sixb"> <strong>Belief</strong> <br> <br> 안전한 제품을 만들기 위해 노력합니다.</div>
	            <div class="b1"> <strong>Better but different</strong> <br> <br> 남들과는 다른, 더 나은 것들을 만듭니다.</div>
	            <div class="sixb"> <strong>Discovery Me By Perfume </strong><br> <br> 향을 통해 나를 발견하세요.</div>
			</div>
			<br>
		</div>
		<div class="movebtn"       
		onmouseenter="zoomIn(event)"
     	onmouseleave="zoomOut(event)">
			<div>
				<P>AROMA FRAGANCIA JOIN US</P>
				<br>
				회원이 되어 더 많은 향기 정보를 얻어보세요.
				자극없이 은은하고 뿌리는 순간 감각적인 무드를 연출해주는 다양한 상품들과 <br>
				온라인에서도 편리하게 만날 수 있는 향기 상담 신청 서비스를 이용해보세요.
				<br>
			</div>
			<input type="button" value="JOIN US  →" class="move">
		</div>
		
		
		
		<div class="mapp"> AROMA FRAGANCIA <br>
							오프라인 매장 찾아오시는 길</div>
		
		<div class="container">
		<div class="mainmap">
			<div id="map"></div>
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
				
				var iwContent = '<div style="padding:5px;">AROMA FRAGANCIA<br><a href="https://map.kakao.com/link/map/Hello World!,37.518818, 127.022936" style="color:blue" target="_blank">큰지도보기</a> <a href="https://map.kakao.com/link/to/AROMA FRAGANCIA,37.518818, 127.022936" style="color:blue" target="_blank">길찾기</a></div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
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
		<div class="transport">
	        <table class="table table-hover">
	          <tr>
	            <strong>
	              <span class="terms_tt1"></span>
	              <p>대중교통 / 자가용 이용 시</p>
	            </strong>
	            <td>
	              <strong>지하철 이용</strong> <br />
	              <br />
	              경의중앙선, 공항철도 이용 가능 <br />
	              지하철 2호선 홍대입구역 9번출구에서 약 80m 직진
	            </td>
	          </tr>
	          <tr>
	            <td>
	              <strong>버스 이용</strong><br />
	              <br />
	              버스정류장 홍대입구역(14-015) <br />
	              동교동삼거리방면 하차 후 100m 직진<br />
	              ※ 버스 : 733, 271A, 273, 603, 604, 761, N62,5712등
	            </td>
	          </tr>
	          <tr>
	            <td>
	              <strong>승용차 이용</strong><br />
	              <br />
	              주차공간이 협소하오니 되도록 대중교통을 이용하여 주시기 바랍니다.
	              <br />
	              주차정보안내시스템
	              <a href="http://parking.seoul.go.kr/"
	                >(http://parking.seoul.go.kr/)</a
	              >에서 오프라인 매장 주변 공영주차장을 확인하실 수 있습니다.
	            </td>
	          </tr>
	        </table>
	      </div>
		</div>
		<!-- mainmap end -->
		</div>
		<!-- container end -->				
	</c:if>
	
		
		
		
		<!-- 관리자 페이지 -->
		<c:if test="${sessionScope.grade == 'A'}">
		<div class="container" style="margin-top: 10%; margin-bottom: 10%">
			<div class="row">
				<div class="col-md-4">
				    <a href="${productManageUrl}" class="btn btn-primary" style="width: 100%; height: 250px;" role="button">
						<h1><span class="glyphicon glyphicon-list-alt" style="font-size: 80px; margin-top: 5%;"></span> <br/>재고관리</h1>
					</a>
				</div>
				<div class="col-md-4">
				    <a href="${statisticsForProductUrl}" class="btn btn-danger" style="width: 100%; height: 250px;" role="button">
						<h1><span class="glyphicon glyphicon-signal" style="font-size: 80px; margin-top: 5%;"></span> <br/>매출통계</h1>
				    </a>
				</div>
				<div class="col-md-4">
				    <a href="${statisticsForStockUrl}" class="btn btn-info" style="width: 100%; height: 250px;" role="button">
						<h1><span class="glyphicon glyphicon-eye-open" style="font-size: 80px; margin-top: 5%;"></span> <br/>재고현황</h1>
	    		    </a>
				</div>
			</div>
		</div>
		</c:if>

	<jsp:include page="../common/foot.jsp"></jsp:include>
	
		    <!-- 베가스 추가 -->
<script type="text/javascript" src="${context}/js/vegas.min.js"></script>

</body>
</html>