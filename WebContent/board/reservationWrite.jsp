<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var ="context"><%=request.getContextPath()%></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 상세 페이지</title>
<script src="${context}/js/jquery-1.9.1.js"></script>
<script type="text/javascript">
		$(document).ready(function(){
			fn_init();
		});
	
		function fn_save(){
			if(!fn_validation()){ 
				return;
			}else{
				var boardContent = String($("#vstContent").val());
	
				boardContent = boardContent.replace(/\n/gi, "<br/>");
	
				$("#vstContent").val(boardContent);
	
		 		$("#reservationWrite").submit();
			}
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
<!-- Detail -->
	<div class="container">
	<h4 class="Title">상담신청하기</h4>
		<form id="reservationWrite" class="form-horizontal boardwrite" method="post" action="${context}/work/board/reservationWrite.do" role="form">
		
		<!--
		  <div class="form-group">
		    <label for="inputEmail3" class="col-sm-2 control-label">이름</label>
		    <div class="col-sm-12">
		      <input type="text" class="form-control" id="vstRegId" name="vstRegId" placeholder="이름을 입력해주세요">
		    </div>
		  </div>
		  -->
		  <div class="form-group">
		    <label for="vstPhone" class="col-sm-2 control-label">전화번호</label>
		    <div class="col-sm-12">
		      <input type="tel" class="form-control" id="vstPhone" name="vstPhone" placeholder="전화번호을 입력해주세요">
		    </div>
		  </div>
		  <div class="form-group">
		    <label for="vstEmail" class="col-sm-2 control-label">이메일</label>
		    <div class="col-sm-12">
		      <input type="email" class="form-control" id="vstEmail" name="vstEmail" placeholder="이메일을 입력해주세요">
		    </div>
		  </div>
		  <div class="form-group">
		    <label for="vstTitle" class="col-sm-2 control-label">제목</label>
		    <div class="col-sm-12">
		      <input type="text" class="form-control" id="vstTitle" name="vstTitle" placeholder="제목을 입력해주세요">
		    </div>
		  </div>
		   <div class="form-group">
		    <label for="vstContent" class="col-sm-2 control-label">내용</label>
		    <div class="col-sm-12">
		     <textarea class="form-control" rows="4" style="width: 100%; height: 272px !important;" id="vstContent" name="vstContent" placeholder="내용을 입력해주세요"></textarea>
		    </div>
		  </div>
		  
		  <!-- 
		  <div class="form-group">
		    <label for="exampleInputFile" class="col-sm-2 control-label">파일 선택</label>
		    <div class="col-sm-12">
		    <input type="file" id="exampleInputFile" class="form-control">
		    </div>
		  </div>
  		 -->
  		 	<!-- board button area start -->
			<div class="row btnarea">
				<button class="btn btn-lg boardbtn" type="button" onclick="fn_save()">글 등록하기</button>
				<button type="button" class="btn btn-lg boardbtn" onclick="fn_back()">취소</button>
			</div>
			<!-- board button area end -->
		</form>
	</div>
	</div>
	<jsp:include page="/common/foot.jsp"></jsp:include>
</body>
<style type="text/css">
/*background*/
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