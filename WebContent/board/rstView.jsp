<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var ="context"><%=request.getContextPath()%></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="description" content="rstWriter.jsp">
<title>예약 문의 글쓰기</title>
<link href="${context}/css/bootstrap.min.css" rel="stylesheet">
<link href="${context}/css/bootstrap-theme.css" rel="stylesheet">
<link href="${context}/css/common.css" rel="stylesheet">
<script src="${context}/js/jquery-1.9.1.js"></script>
<script src="${context}/js/bootstrap.min.js"></script>
	<script type="text/javascript">
		function fn_boardList(){
			location.href = "${context}/work/board/Board.do";
		}
		//글 삭제
		function fn_delete(){
			var boardNo = '${dsBoard.BOARD_NO}';
	
			if(confirm("정말 글을 삭제하시겠습니까?")){
				location.href = "${context}/work/board/deleteBoard.do?boardNo=" + boardNo;
			}
		}
		
		//글 수정
		function fn_update(){
			var boardNo = '${dsBoard.BOARD_NO}';
	
			location.href = "${context}/work/board/modifyBoard.do?boardNo=" + boardNo;
		}
	</script>
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
		<p class="title">${dsVstList.VST_TITLE}</p>
		<p class="people">${dsVstList.USER_NAME}</p>
	</div>
	<div class="subtext">
	<p>${dsVstList.VST_CONTENT}</p>

	</div>
	 <div style=" text-align: right;">
		<button type="button" class="btn btn-default boardbtn"  style=" display: inline-block; margin: 80px 42px 60px 0;" onclick="location.href='rstList.jsp">목록</button>
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