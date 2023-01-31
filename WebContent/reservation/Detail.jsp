<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var ="context"><%=request.getContextPath()%></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="description" content="Detail.jsp">
<title>예약 상세 페이지</title>
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
	<div class="img-responsive center-block" style='background-image: url("${context}/backgroundImage/RESERVATION.jpg");'>
		<div class="boardText1" >
			<h3 class="boardTitle1">RESERVATION</h3>
			<p class="boardSub1">상담 예약 문의</p>
		</div>
	</div>
</div>
<!-- mobile버전  -->
<div class="mobile">
	<div class="mobileImg img-responsive center-block" style='background-image: url("${context}/backgroundImage/RESERVATION.jpg");'>
		<div class="boardText2" >
			<h3 class="boardTitle2">RESERVATION</h3>
			<p class="boardSub2">상담 예약 문의</p>
		</div>
	</div>
</div>

<!-- Detail -->
	<div class="container">
	<h4 class="Title">상담신청하기</h4>
		<form class="form-horizontal">
		<div class="form-group">
		    <label for="inputTitle3" class="col-sm-1 control-label">제목</label>
		    <div class="col-sm-12">
		      <input type="text" class="form-control" id="inputTitle3" placeholder="Title">
		    </div>
		  </div>
		  <div class="form-group">
		    <label for="inputEmail3" class="col-sm-2 control-label">이름</label>
		    <div class="col-sm-12">
		      <input type="text" class="form-control" id="inputName3" placeholder="Name">
		    </div>
		  </div>
		  <div class="form-group">
		    <label for="inputTel3" class="col-sm-2 control-label">전화번호</label>
		    <div class="col-sm-12">
		      <input type="tel" class="form-control" id="inputTel3" placeholder="Tel">
		    </div>
		  </div>
		  <div class="form-group">
		    <label for="inputPassword3" class="col-sm-2 control-label">이메일</label>
		    <div class="col-sm-12">
		      <input type="email" class="form-control" id="inputEmail3" placeholder="Email">
		    </div>
		  </div>
		   <div class="form-group">
		    <label for="inputtextarea3" class="col-sm-2 control-label">내용</label>
		    <div class="col-sm-12">
		     <textarea class="form-control" rows="5" placeholder="예약일은 꼭 적어주세요"></textarea>
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
  		 
		  <div style=" text-align: right;">
		  <button type="button" class="btn btn-default boardbtn" style=" display: inline-block; margin: 80px 0 84px 0;">글 등록하기</button>
		  </div>
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
.form-horizontal .control-label {
    padding-top: 7px;
    margin-bottom: 8px;
    text-align: inherit !important;
}
.Title{
font-family: Noto Sans KR;
font-size: 40px;
margin-top: 90px;
margin-bottom: 100px;
}
</style>
</html>