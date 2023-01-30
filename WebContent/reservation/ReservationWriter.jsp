<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var ="context"><%=request.getContextPath()%></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="description" content="main.jsp">
<title>예약 문의 글쓰기</title>
<link href="${context}/css/bootstrap.min.css" rel="stylesheet">
<link href="${context}/css/bootstrap-theme.css" rel="stylesheet">
<script src="${context}/js/jquery-1.9.1.js"></script>
<script src="${context}/js/bootstrap.min.js"></script>
</head>

<script type="text/javascript"></script>
<body>

<!-- desktop버전  -->
<div class="desktop">
	<div class="img-responsive center-block" style='background-image: url("${context}/reservationImg/RESERVATION.jpg");'>
		<div class="text1" >
			<h3 style="text-align: center; font-size: 24px;">RESERVATION</h3>
			<p style="text-align: center; font-size: 16px;">상담 예약 문의</p>
		</div>
	</div>
</div>
<!-- mobile버전  -->
<div class="mobile">
	<div class="mobileImg img-responsive center-block" style='background-image: url("${context}/reservationImg/RESERVATION.jpg");'>
		<div class="text2" >
			<h3 style="text-align: center; font-size: 16px;">RESERVATION</h3>
			<p style="text-align: center; font-size: 10px;">상담 예약 문의</p>
		</div>
	</div>
</div>

<!-- Writer -->
<div class="container">
	<h4 style="text-align: left; font-size: 32px; margin: 110px 0 138px 0;">상담 신청 게시판</h4>
	<div class="textbox">
		<p class="title">29일 방문 예약 문의</p>
		<p class="people">USER</p>
	</div>
	<div class="subtext">
	<p>보이는 오직 얼마나 피어나기 힘있다. 이는 그러므로 인생에 같지 인간이 말이다. 힘차게 위하여서 구할 그들에게 것이 별과 사랑의 말이다. 열락의 고행을 생명을 품고 것이 끓는 인생에 속잎나고, 것이다. 설레는 인간은 반짝이는 찬미를 목숨을 위하여서. 없는 같지 보내는 온갖 군영과 방지하는 같이 있음으로써 이 위하여서. 없으면, 인생에 속에서 새 때문이다. 목숨을 인간의 역사를 얼마나 때에, 얼음에 그리하였는가? 군영과 기관과 붙잡아 안고, 부패를 쓸쓸하랴? 우리의 역사를 천하를 더운지라 그것을 하는 아니다.싶이 찬미를 그들의 그들의 것이다. 역사를 창공에 이는 용기가 그들은 봄날의 그들의 구하지 봄바람이다. 끓는 같지 아름답고 우리의 용감하고 이상이 바로 소리다.이것은 것이다. 품고 그들은 찾아 품었기 있는가? 곧 생생하며, 산야에 꽃이 심장은 바이며, 거친 원질이 황금시대를 것이다. 노년에게서 대중을 동력은 유소년에게서 시들어 보배를 얼마나 현저하게 것이다. 위하여 보배를 물방아 이성은 가는 같이, 피가 피다. 몸이 주는 봄날의 따뜻한 사막이다. 인생을 대한 그들은 인류의 미묘한 굳세게 가지에 것이다. 때에, 남는 가는 앞이 착목한는 사랑의 인생에 행복스럽고 사막이다. 풀밭에 인생에 피가 황금시대다.
<br><br>
열락의 것은 노년에게서 끝에 수 부패를 얼마나 방지하는 인생에 피다. 위하여 트고, 것은 갑 웅대한 주며, 얼음과 못할 황금시대다. 같이 충분히 눈이 할지니, 이 가진 대고, 목숨을 뿐이다. 공자는 그들의 것은 천하를 옷을 피어나기 무엇을 그들은 뿐이다. 황금시대를 오직 청춘이 동력은 영원히 너의 이상의 황금시대다. 청춘의 앞이 이상은 힘있다. 불러 산야에 무한한 풍부하게 투명하되 쓸쓸한 인간의 것이다. 천고에 것은 풍부하게 작고 이성은 품으며, 설산에서 유소년에게서 쓸쓸하랴? 인생을 아름답고 튼튼하며, 것이다. 같이, 그들의 하여도 웅대한 찬미를 크고 있는가?</p>
	</div>
	 <div style=" text-align: right;">
		<button type="button" class="btn btn-default" style=" display: inline-block; margin: 150px 0 60px 0;">글 수정하기</button>
		<button type="button" class="btn btn-default" style=" display: inline-block; margin: 150px 0 60px 0;">글 삭제하기</button>
	</div>
	</div>
</body>
<style type="text/css">
@font-face {
  font-family: "Safira";
  src: url("../fonts/SafiraMarch.otf") format('opentype');
}
/*font 적용*/
h3{
	font-family: Safira;
	padding-bottom: 8px;
}

/*form 제목*/
.form-horizontal .control-label {
    padding-top: 7px;
    margin-bottom: 8px;
    text-align: inherit !important;
}
/*desktop버전 css*/
.img-responsive {
	height: 600px;
	max-width:100% !important;
	background-position: center;
	background-size: cover;
	position : relative !important;
	align-items: center;
	display:flex !important; 
	justify-content:center !important; 
	align-items:center!important;
}
.text1 {
	position:absolute !important; 
	top:50% !important; 
	left:50%!important; 
	transform:translate(-50%,80%) !important;
	width: 390px !important; 
	height: 173px !important; 
	background-color: #fff !important;
	color: #000 !important;
	border-radius: 37px 37px 0 0 !important; 
    bottom: -10px !important;
    padding-top: 35px;
}

/*desktop버전 css*/	
.mobileImg{
	height: 600px;
	max-width:100% !important;
	display:flex !important; 
	justify-content:center !important; 
	align-items:center!important;
}
	
.text2 {
	position:absolute !important; 
	top:50% !important; 
	left:50%!important; 
	transform:translate(-30%,150%) !important;
	width: 262px !important; 
	height: 120px !important; 
	background-color: #fff !important;
	color: #000 !important;
	border-radius: 37px 37px 0 0 !important; 
    bottom: -10px !important;
    right: 40% !important;
    left: 40% !important;
    padding-top: 18px;
}
/*media*/
@media (min-width: 412px){
  .desktop {
    display: none !important; 
  }
  .mobile {
    display: block !important; 
  }
  
}
@media (min-width: 768px){
  .mobile {
    display: none !important; 
  }
  .desktop {
    display: block !important; 
  }
}

/*Writer Text*/
.textbox{
	width:100%;
	height: 50px;
	border-bottom: 1px solid #b9b9b9;
	padding: 0 40px 0 40px; 
}
.title{
	float: left;
	font-size: 12px;
}
.people{
	float: right;
	font-size: 18px;
	font-weight: bold;
}
.subtext {
	width:100%;
	height: 350px;
	margin: 30px 0 0 0;
	padding: 0 40px 0 40px; 
	clear: both;
}
</style>

</html>