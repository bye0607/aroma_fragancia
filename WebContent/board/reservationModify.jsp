<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var ="context"><%=request.getContextPath()%></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="description" content="reservationModify.jsp">
<title>예약 문의 글쓰기</title>
<link href="${context}/css/bootstrap.min.css" rel="stylesheet">
<link href="${context}/css/bootstrap-theme.css" rel="stylesheet">
<link href="${context}/css/common.css" rel="stylesheet">
<script src="${context}/js/jquery-1.9.1.js"></script>
<script src="${context}/js/bootstrap.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			fn_init();
	
			//글수정 기존 내용 셋팅
			fn_setDetailInfo();
		});
	
		function fn_setDetailInfo(){
			$("#vstTitle").val('${dsReservation.VST_TITLE}');
			$("#vstNo").val('${dsReservation.VST_NO}');
			$("#vstPhone").val('${dsReservation.VST_PHONE}');
			$("#vstEmail").val('${dsReservation.VST_EMAIL}');
	
			var vstContent = '${dsReservation.VST_CONTENT}';
	
			vstContent = vstContent.replace(/<br ?\/?>/gi, "\n");
	
			$("#vstContent").val(vstContent);
		}
	
		function fn_save(){
			if(!fn_validation()){
				return;
			}else{
				
				//alert("ddddd");
				var vstContent = String($("#vstContent").val());
	
				vstContent = vstContent.replace(/\n/gi, "<br/>");
	
				//alert(vstContent);
				
				$("#vstContent").val(vstContent);
	
		 		$("#reservationModify").submit();
			}
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

<!-- ReservationWrite -->
	<div class="container">
	<h4 class="Title">상담 신청 게시판</h4>
		<form id="reservationModify" class="form-horizontal" method="post" action="${context}/work/board/reservationModify.do?vstNo=${dsReservation.VST_NO}" role="form">
		  <!-- 
		  <div class="form-group">
		    <label for="inputEmail3" class="col-sm-2 control-label">이름</label>
		    <div class="col-sm-12">
		      <input type="text" class="form-control" id="vstRegId" name="vstRegId">
		    </div>
		  </div>
		   -->
		  <div class="form-group">
		    <label for="vstPhone" class="col-sm-2 control-label">전화번호</label>
		    <div class="col-sm-12">
		      <input type="tel" class="form-control" id="vstPhone" name="vstPhone">
		    </div>
		  </div>
		  <div class="form-group">
		    <label for="vstEmail" class="col-sm-2 control-label">이메일</label>
		    <div class="col-sm-12">
		      <input type="email" class="form-control" id="vstEmail" name="vstEmail">
		    </div>
		  </div>
		  <div class="form-group">
		    <label for="vstTilte" class="col-sm-2 control-label">제목</label>
		    <div class="col-sm-12">
		      <input type="text" class="form-control" id="vstTitle" name="vstTitle">
		    </div>
		  </div>
		   <div class="form-group">
		    <label for="vstContent" class="col-sm-2 control-label">내용</label>
		    <div class="col-sm-12">
		     <textarea id="vstContent" name="vstContent" class="form-control" rows="4" style="width: 100%; height: 272px !important;"></textarea>
		    </div>
		  </div>
	 <div style=" text-align: right;">
		<button type="button" class="btn btn-default boardbtn"  style=" display: inline-block; margin: 80px 42px 60px 0;" onclick="fn_save()">저장 하기</button>
		<button type="button" class="btn btn-default boardbtn" style=" display: inline-block; margin: 80px 0 60px 0;" onclick="fn_back()">취소</button>
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