<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var ="context"><%=request.getContextPath()%></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 문의 글쓰기</title>
<script src="${context}/js/jquery-1.9.1.js"></script>
	<script type="text/javascript">
		function fn_reservationList(){
			location.href = "${context}/work/board/reservation.do";
		}
		//글 삭제
		function fn_delete(){
			var VstNo = '${dsReservation.VST_NO}';
	
			if(confirm("정말 글을 삭제하시겠습니까?")){
				location.href = "${context}/work/board/deleteReservation.do?vstNo=" + VstNo;
			}
		}
		
		//글 수정
		function fn_update(){
			var VstNo = '${dsReservation.VST_NO}';
	
			location.href = "${context}/work/board/reservationModify.do?vstNo=" + VstNo;
		}
	</script>
</head>
<body>
<jsp:include page="/common/top.jsp"></jsp:include>
<div class="wrap">
<!-- title, visual start -->
<div class="titarea" style='background-image: url("${context}/img/subbg_reservation.jpg");'>
	<div class="boardText">
		<h3 class="boardTitle">RESERVATION</h3>
		<p class="boardSub">상담 예약 문의</p>
	</div>
</div>
<!-- title, visual end -->
<!-- ReservationWrite -->
	<div class="container">
	<div class="page-header">
	<div class="row">
				<div class="col-xs-8">
					<!-- 한글일 경우 title 클래스만 사용. 영문일 경우 eng 클래스 추가하세요 -->
					<h2 class="title">상담 예약 문의</h2>
				</div>
				<div class="col-xs-4 text-right">
					<button type="button" class="btn btn-lg boardbtn notice" onclick="fn_reservationList()">목록</button>
				</div>
	</div>
	<form class="form-horizontal" method="post" role="form">
		<div class="boardview">
		  <div class="form-group">
		    <label for="vstEmail" class="col-sm-2 control-label">이름</label>
		    <div class="col-sm-12 content">
		      ${dsReservation.USER_NAME}
		    </div>
		  </div>
		  <div class="form-group">
		    <label for="vstPhone" class="col-sm-2 control-label">전화번호</label>
		    <div class="col-sm-12 content">
		      ${dsReservation.VST_PHONE}
		    </div>
		  </div>
		  <div class="form-group content">
		    <label for="vstEmail" class="col-sm-2 control-label">이메일</label>
		    <div class="col-sm-12">
		      ${dsReservation.VST_EMAIL}
		    </div>
		  </div>
		  <div class="form-group title">
		    <label for="vstTitle" class="col-sm-2 control-label">제목</label>
		    <div class="col-sm-12">
		      ${dsReservation.VST_TITLE}
		    </div>
		  </div>
		   <div class="form-group content">
		    <label for="vstContent" class="col-sm-2 control-label">내용</label>
		    <div class="col-sm-12">
		     ${dsReservation.VST_CONTENT}
		    </div>
		  </div>
		<!-- board button area start -->
		<div class="row btnarea">
			<button class="btn btn-lg boardbtn" type="button" onclick="fn_update()">글 수정하기</button>
			<button class="btn btn-lg boardbtn" type="button" onclick="fn_delete()">글 삭제하기</button>
		</div>
		<!-- board button area end -->
		</div>
	</form>
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
.title {
border-bottom:none !important;
}
@media (max-width: 992px) {
	.Title {font-size: 28px;}
	.control-label{font-size: 18px;}
	}
</style>

</html>