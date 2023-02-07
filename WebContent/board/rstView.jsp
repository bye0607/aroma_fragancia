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
	<!-- 
		<p class="title">29일 방문 예약 문의</p>
		<p class="people">USER</p>  -->
	</div>
	<form class="form-horizontal" method="post" action="${context}/work/reservation/rstWrite.do" role="form">
		
		  <div class="form-group">
		    <label for="inputEmail3" class="col-sm-2 control-label">이름</label>
		    <div class="col-sm-12">
		      <input type="text" class="form-control" id="inputName3">
		    </div>
		  </div>
		  <div class="form-group">
		    <label for="inputTel3" class="col-sm-2 control-label">전화번호</label>
		    <div class="col-sm-12">
		      <input type="tel" class="form-control" id="inputTel3">
		    </div>
		  </div>
		  <div class="form-group">
		    <label for="inputPassword3" class="col-sm-2 control-label">이메일</label>
		    <div class="col-sm-12">
		      <input type="email" class="form-control" id="inputEmail3">
		    </div>
		  </div>
		  <div class="form-group">
		    <label for="inputTitle3" class="col-sm-1 control-label">제목</label>
		    <div class="col-sm-12">
		      <input type="text" class="form-control" id="inputTitle3">
		    </div>
		  </div>
		   <div class="form-group">
		    <label for="inputtextarea3" class="col-sm-2 control-label">내용</label>
		    <div class="col-sm-12">
		     <textarea class="form-control" rows="4" style="width: 100%; height: 272px !important;"></textarea>
		    </div>
		  </div>
	 <div style=" text-align: right;">
		<button type="button" class="btn btn-default boardbtn"  style=" display: inline-block; margin: 80px 42px 60px 0;" onclick="location.href='rstList.jsp">목록</button>
		<button type="button" class="btn btn-default boardbtn"  style=" display: inline-block; margin: 80px 42px 60px 0;">글 수정하기</button>
		<button type="button" class="btn btn-default boardbtn" style=" display: inline-block; margin: 80px 0 60px 0;">글 삭제하기</button>
	</div>
	</form>
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
/*form 제목*/
.form-control {
    padding-top: 7px;
    margin-bottom: 40px;
    margin-top:10px;
    height: 90px !important;
    background-color: #D9D9D9 !important;
}
.control-label {
	font-size:24px;
    text-align: inherit !important;
}
.Title{
font-family: Noto Sans KR;
font-size: 40px;
margin-top: 90px;
margin-bottom: 100px;
}

@media (max-width: 992px) {
	.Title {font-size: 28px;}
	.control-label{font-size: 18px;}
	}
</style>

</html>