<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var ="context"><%=request.getContextPath()%></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="description" content="ReservationWriter.jsp">
<title>예약 문의 글쓰기</title>
<link href="${context}/css/bootstrap.min.css" rel="stylesheet">
<link href="${context}/css/bootstrap-theme.css" rel="stylesheet">
<link href="${context}/css/common.css" rel="stylesheet">
<script src="${context}/js/jquery-1.9.1.js"></script>
<script src="${context}/js/bootstrap.min.js"></script>
</head>
<body>
<jsp:include page="/common/top.jsp"></jsp:include>
<div class="wrap">
<!-- desktop버전  -->
<div class="desktop">
	<div class="img-responsive center-block" style='background-image: url("${context}/backgroundImage/subbg_service.png");'>
		<div class="boardText1" >
			<h3 class="boardTitle1">RESERVATION</h3>
			<p class="boardSub1">상담 예약 문의</p>
		</div>
	</div>
</div>
<!-- mobile버전  -->
<div class="mobile">
	<div class="mobileImg img-responsive center-block" style='background-image: url("${context}/backgroundImage/subbg_service.png");'>
		<div class="boardText2" >
			<h3 class="boardTitle2">RESERVATION</h3>
			<p class="boardSub2">상담 예약 문의</p>
		</div>
	</div>
</div>

<!-- ReservationWriter -->
	<div class="container">
	<h4 class="Title">상담 신청 게시판</h4>
	<div class="textbox">
		<p class="title">29일 방문 예약 문의</p>
		<p class="people">USER</p>
	</div>
	<div class="subtext">
	<p>보이는 오직 얼마나 피어나기 힘있다. 이는 그러므로 인생에 같지 인간이 말이다. 힘차게 위하여서 구할 그들에게 것이 별과 사랑의 말이다. 열락의 고행을 생명을 품고 것이 끓는 인생에 속잎나고, 것이다. 설레는 인간은 반짝이는 찬미를 목숨을 위하여서. 없는 같지 보내는 온갖 군영과 방지하는 같이 있음으로써 이 위하여서. 없으면, 인생에 속에서 새 때문이다. 목숨을 인간의 역사를 얼마나 때에, 얼음에 그리하였는가? 군영과 기관과 붙잡아 안고, 부패를 쓸쓸하랴? 우리의 역사를 천하를 더운지라 그것을 하는 아니다.싶이 찬미를 그들의 그들의 것이다. 역사를 창공에 이는 용기가 그들은 봄날의 그들의 구하지 봄바람이다. 끓는 같지 아름답고 우리의 용감하고 이상이 바로 소리다.이것은 것이다. 품고 그들은 찾아 품었기 있는가? 곧 생생하며, 산야에 꽃이 심장은 바이며, 거친 원질이 황금시대를 것이다. 노년에게서 대중을 동력은 유소년에게서 시들어 보배를 얼마나 현저하게 것이다. 위하여 보배를 물방아 이성은 가는 같이, 피가 피다. 몸이 주는 봄날의 따뜻한 사막이다. 인생을 대한 그들은 인류의 미묘한 굳세게 가지에 것이다. 때에, 남는 가는 앞이 착목한는 사랑의 인생에 행복스럽고 사막이다. 풀밭에 인생에 피가 황금시대다.

	</div>
	 <div style=" text-align: right;">
		<button type="button" class="btn btn-default boardbtn"  style=" display: inline-block; margin: 80px 42px 60px 0;">글 수정하기</button>
		<button type="button" class="btn btn-default boardbtn" style=" display: inline-block; margin: 80px 0 60px 0;">글 삭제하기</button>
	</div>
	</div>
	</div>
	<jsp:include page="/common/foot.jsp"></jsp:include>
</body>
<style type="text/css">
.wrap{
background-color: #fff;
}
/*form 제목*/
.form-horizontal .control-label {
    padding-top: 7px;
    margin-bottom: 8px;
    text-align: inherit !important;
}
.Title{
font-family: Noto Sans KR;
font-size: 40px;
margin-top: 87px;
margin-bottom: 80px;
}
/*Writer Text*/
.textbox{
	padding: 0 40px 49px 40px;
	border-bottom: 1px solid #000;
}
.title{
	float: left;
	font-size: 30px;
}
.people{
	float: right;
	font-size: 30px;
	font-weight: bold;
}
.subtext {
	width:100%;
	height: 350px;
	margin: 30px 0 0 0;
	padding: 0 40px 0 40px; 
	clear: both;
}
@media (max-width: 992px) {
	.Title {font-size: 28px;}
	.title{font-size: 21px;}
	.people{font-size: 21px;}}
</style>

</html>