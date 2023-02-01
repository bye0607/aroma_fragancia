<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var ="context"><%=request.getContextPath()%></c:set>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="description" content="pwFind.jsp">
<title>Password Find</title>
<link href="../css/bootstrap.min.css" rel="stylesheet">
<link href="../css/bootstrap-theme.css" rel="stylesheet">
<link href="../css/plugins/metisMenu/metisMenu.min.css" rel="stylesheet">
<link href="../css/plugins/social-buttons.css" rel="stylesheet">
<link href="../font-awesome-4.4.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">

<script src="../js/jquery-1.9.1.js"></script>
<script src="../js/bootstrap.min.js"></script>
   <script src="../js/plugins/metisMenu/metisMenu.min.js"></script>

<script src="../js/sb-admin-2.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#email").keydown(function (key){
			if(key.keyCode == 13){
				retrieveUserPw();
			}

		});
	});

	function retrieveUserPw(){
		var id = $("#id").val();
		var email = $("#email").val();

		var param = {};

		param["id"] = id;
		param["email"] = email;

		var access = $("#message");

		$.ajax({
			url:"${context}/work/user/retrieveUserPw.do",
			contentType:"application/json",
			dataType:"json",
			data:param,
			success:function(result){
				access.html(result["checkMsg"]);
			}
		});
	}
</script>
</head>
<body>
	<jsp:include page="../common/top.jsp"></jsp:include>
	<div class="backgroundImg" style="background-image: url('${context}/backgroundImage/loginImg.png');">
    <div class="container">
        <div class="row">
           <div class="col-md-6 col-md-offset-3">
                   <div class="login-panel panel-default"  style="margin-bottom: 112%;">
                    <div class="panel-heading login">
                        <div class="pwFind">Password Find</div>
                        <div class="pwFind2"></div>
                    </div>
                    <div class="panel-body">
                        <form action="${context}/work/user/login.do" method="post" role="form" id="loginFrm">
                            <fieldset>
                                <div class="form-group">
                                <div class="col-sm-12" id="formIcon" style="float: none; margin 0 auto;">
                                    <input class="form-control" type="text" name="id" id="id" required="required" autofocus="autofocus" placeholder="User"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                <div class="col-sm-12" style="float: none; margin 0 auto;">
                                   <input class="form-control" type="email" name="email" id="email" required="required" placeholder="Email"/>
                                    </div>
		                       <div class="form-group">
									<div class="col-sm-12">
										<input class="Loginbtn form-control" type="button" name="btnSubmit" id="btnSubmit" value="확인" onclick="retrieveUserPw()"/>
									</div>
								</div>
								<div class="form-group" id="message">
							</div>
							</div>
							</fieldset>
                        </form>
						 </div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../common/foot.jsp"></jsp:include>
</body>
<style type="text/css">
.backgroundImg {
	width: 100%;
	height: 968px;
	box-sizing: border-box;
	background-position: center;
	background-size: cover;
	display:flex !important; 
	justify-content:center !important; 
	align-items:center!important;
}
.panel-default>.panel-heading {
    background-color: #fff !important;
    border-color: #fff !important;
}
.login{
	width: 566px;
	height: 62px;
	padding: 0px;
	margin: -5px;
	background-color: #fff;
	border-radius: 30px 30px 0 0!important; 
	font-family:'DM Serif Display';
}
.panel-body{
	clear:both;
	width: 566px;
	height: 370px;
	background-color: #fff;
	border-radius: 0 0 30px 30px !important; 
	position:absolute !important; 
	top:50% !important; 
	left:50%!important; 
	transform: translate(-50%,-76%) !important;;
}
.fieldset {
	background-position: center;
}
#id {
	margin-top: 35px;
}
#pw {
	margin-top: 30px;
}

#id::-webkit-input-placeholder{
  background-image: url('${context}/userImg/user.svg') ;
  background-size: contain;
  background-position:  1px center;
  background-repeat: no-repeat;
  padding: 0 15px 0 0;
  text-indent: 0;
  text-align:left;
  padding-left:40px;
  font-family: Crimson Pro;
  filter: invert(98%) sepia(0%) saturate(15%) hue-rotate(142deg) brightness(87%) contrast(85%);
}
#email::-webkit-input-placeholder{
  background-image: url('${context}/userImg/mail.svg') ;
  background-size: contain;
  background-position:  1px center;
  background-repeat: no-repeat;
  padding: 0 15px 0 0;
  text-indent: 0;
  text-align:left;
  padding-left:40px;
  font-family: Crimson Pro;
  filter: invert(98%) sepia(0%) saturate(15%) hue-rotate(142deg) brightness(87%) contrast(85%);
}
.form-control {
	width: 450px;
	height: 66px;
	font-size: 20px;
	margin: 0 auto;
	border-radius: 15px!important; 
}
.pwFind{
	background-color:#fff;
	width: 283px;
	height: 62px;
	text-align: center;
	float: left;
	font-size: 28px;
	font-family:'DM Serif Display';
	line-height: 64px;
	border-radius: 30px 0 0 0!important;
	background-color: #fff;
}
.pwFind2{
	width: 283px;
	height: 62px;
	text-align: center;
	float: left;
	font-size: 28px;
	font-family:'DM Serif Display';
	line-height: 64px;
	border-radius: 0 30px 0 0 !important; 
	background-color: #fff;
}

a{
	color: #9CA09F;
}
a:hover{
	color: #818483;
}
.Loginbtn{
font-size: 25px;
font-weight: bold;
font-family: Crimson Pro;
color: #fff;
margin-top: 30px;
background-color: #9CA09F;
}
.forgotText {
	font-weight: semibold;
	font-size: 20px;
	font-family: Crimson Pro;
	text-decoration: underline;
	text-align: center;
	margin-top: 22px;
}

@media (max-width: 992px) {
	.panel-body {top: 57% !important;}
	.login{margin: -56px !important;}}
}
</style>
</html>