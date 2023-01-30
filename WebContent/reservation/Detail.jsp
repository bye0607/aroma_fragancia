<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var ="context"><%=request.getContextPath()%></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="description" content="main.jsp">
<title>예약 상세 페이지</title>
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

<!-- Detail -->
	<div class="container">
	<h4 style="text-align: left; font-size: 32px; margin: 110px 0 138px 0;">상담신청하기</h4>
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
		  
		  <div class="form-group">
		    <label for="exampleInputFile" class="col-sm-2 control-label">파일 선택</label>
		    <div class="col-sm-12">
		    <input type="file" id="exampleInputFile" class="form-control">
		    </div>
		  </div>
  
		  <div style=" text-align: right;">
		  <button type="button" class="btn btn-default" style=" display: inline-block; margin: 150px 0 60px 0;">글 등록하기</button>
		  </div>
		  <!-- 
		  <div class="form-group">
		    <div class="col-sm-offset-2 col-sm-10">
		      <div class="checkbox">
		        <label>
		          <input type="checkbox"> Remember me
		        </label>
		      </div>
		    </div>
		  </div>
		  <div class="form-group">
		    <div class="col-sm-offset-2 col-sm-10">
		      <button type="submit" class="btn btn-default">Sign in</button>
		    </div>
		  </div>
		   -->
		</form>
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


</style>
</html>