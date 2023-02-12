<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var ="context"><%=request.getContextPath()%></c:set>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>LOGIN</title>
<%-- 
    <link href="${context}/css/bootstrap.min.css" rel="stylesheet">
    <link href="${context}/css/plugins/metisMenu/metisMenu.min.css" rel="stylesheet"> --%>
    <link href="${context}/css/common.css" rel="stylesheet">
<%--     <link href="${context}/css/sb-admin-2.css" rel="stylesheet">
    <link href="${context}/font-awesome-4.4.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
 --%>
    <!-- jQuery -->
    <script src="${context}/js/jquery-1.9.1.js"></script>
<%-- 
    <!-- Bootstrap Core JavaScript -->
    <script src="${context}/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="${context}/js/plugins/metisMenu/metisMenu.min.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="${context}/js/sb-admin-2.js"></script> --%>
	<script type="text/javascript">
		$(document).ready(function(){
			$("#pw").keydown(function (key){
				if(key.keyCode == 13){
					ajaxLoginCheck();
				}

			});
		});

		function ajaxLoginCheck(){
			var id = $("#id").val();
			var pw = $("#pw").val();

			var param = {};

			param["id"] = id;
			param["pw"] = pw;

			$.ajax({
				url:"${context}/work/user/ajaxLoginCheck.do",
				contentType:"application/json",
				dataType:"json",
				data:param,
				success:function(result){
					if(result['loginYn'] == 'success'){
						alert("로그인에 성공하였습니다.");
						$("#loginFrm").submit();
					}else{
						alert('로그인에 실패하셨습니다.');
						$("#id").val('');
						$("#pw").val('');
					}
				}
			});
		}
	</script>
</head>

<body>
<jsp:include page="${context}/common/top.jsp"></jsp:include>
<div class="container-fluid backgroundImg">
	<div class="row">
        <div class="col-md-6 col-md-offset-3">
	        <div class="loginbox">
	        	<!-- login tab button start -->
	        	<div class="logintab">
			        <div class="col-xs-6 tabbtn on"><a href="${context}/user/login.jsp">Login</a></div>
					<div class="col-xs-6 tabbtn"><a href="${context}/user/userC.jsp">Register</a></div>
				</div>
				<!-- login tab button end -->
				<form action="${context}/work/user/login.do" method="post" role="form" id="loginFrm">
                    <fieldset>
                        <div class="form-group">
	                        <div class="col-sm-12" id="formIcon">
	                            <input class="form-control input-lg" type="text" name="id" id="id" required="required" autofocus="autofocus" placeholder="ID"/>
                            </div>
                        </div>
                        <div class="form-group">
	                        <div class="col-sm-12">
	                            <input class="form-control input-lg" placeholder="Password" id="pw" name="pw" type="password">
                            </div>
                        </div>
                        <div class="form-group">
						    <div class="col-sm-12">
						      <div class="checkbox">
						        <label>
						          <input type="checkbox"><p class="checkboxText">Remember me</p>
						        </label>
						      </div>
						    </div>
						 </div>
                         <!-- Change this to a button or input when using this as a form -->
                         <button type="button" class="form-control btn Loginbtn" onclick="ajaxLoginCheck();">LOGIN</button>
                         <div class="form-group">
                         	<p class="forgotText"><a href="${context}/user/pwFind.jsp">Forgot your password?</a></p>
                         </div>
                	</fieldset>
                </form>
            <%-- <div class="login-panel panel-default" >
             <div class="panel-heading login">
                 <div class="panel-title loginButton"><a href="${context}/user/login.jsp">Login</a></div>
		<!-- <div class="panel-title registerButton"><a href="${context}/work/user/createUser.do">Register</a></div>  -->
		<div class="panel-title registerButton"><a href="${context}/user/userC.jsp">Register</a></div>
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
                                <input class="form-control" placeholder="Password" id="pw" name="pw" type="password">
                                </div>
                            </div>
                            <div class="form-group">
			    <div class="col-sm-12" style="float: none; margin 0 auto;">
			      <div class="checkbox">
			        <label>
			          <input type="checkbox"><p class="checkboxText">Remember me</p>
			        </label>
			      </div>
			    </div>
			  </div>
                            <!-- Change this to a button or input when using this as a form -->
                            <button type="button" class="Loginbtn form-control" onclick="ajaxLoginCheck();">LOGIN</button>
                            <div class="form-group">
                            	<p class="forgotText"><a href="${context}/user/pwFind.jsp">Forgot your password?</a></p>
                            </div>
                        </fieldset>
                    </form>
                </div>
            </div> --%>
            </div>
			</div>
        </div>
</div>
<jsp:include page="${context}/common/foot.jsp"></jsp:include>

</body>


<style type="text/css">
.backgroundImg {
	background-image: url('${context}/backgroundImage/loginImg.png');
	/* width: 100%;
	height: 968px;
	box-sizing: border-box;
	background-position: center; */
	background-size: cover;
	/* display:flex !important; 
	justify-content:center !important; 
	align-items:center!important; */
	margin-bottom:-100px;
	padding:100px 15px;
}
.loginbox {
	max-width: 566px;
	/*height: 62px; */
	background:#fff;
	padding: 0px;
	/* margin: -5px; */
	margin:0 auto;
	border-radius: 30px; 
	/* font-family:'DM Serif Display'; */
}
.logintab {overflow:hidden;border-radius: 30px 30px 0 0; text-align:center;}
.logintab .tabbtn {background:#9E9C9C;}
.logintab .tabbtn a {display:block;width:100%;height:62px;font-size:28px;padding-top:10px}
.logintab .tabbtn a:hover {color:#fff;transition:0.3s}
.logintab .tabbtn.on {background:#fff;pointer-events : none;}
.loginbox form {padding:30px 50px;font-family: Crimson Pro;font-size:20px;}
.loginbox form .form-control {
	/* width: 100%; */
	height: 66px;
	/* margin: 0 auto;*/
	border-radius: 15px!important; 
	margin-bottom:15px;
}
.loginbox form ::-webkit-input-placeholder {font-family: Crimson Pro;font-size:20px;}
.loginbox form #id::-webkit-input-placeholder{
  background-image: url('${context}/userImg/user.svg') ;
  background-size: contain;
  background-position:  1px center;
  background-repeat: no-repeat;
  padding: 0 15px 0 0;
  /* text-indent: 0; */
  /* text-align:left; */
  padding-left:40px;
  /* font-family: Crimson Pro;
  font-size:20px; */
  filter: invert(98%) sepia(0%) saturate(15%) hue-rotate(142deg) brightness(87%) contrast(85%);
}
.loginbox form #pw::-webkit-input-placeholder{
  background-image: url('${context}/userImg/key.svg') ;
  background-size: contain;
  background-position:  1px center;
  background-repeat: no-repeat;
  padding: 0 15px 0 0;
  text-indent: 0;
  text-align:left;
  padding-left:40px;
 /*  font-family: Crimson Pro;
  font-size:20px; */
  filter: invert(98%) sepia(0%) saturate(15%) hue-rotate(142deg) brightness(87%) contrast(85%);
}
.loginbox form input[type="checkbox"]{
	width: 20px;
	height: 20px;
	/* color: #818483; */
}
.loginbox form .checkbox label {
	/* padding-left: 50px; */
	/* font-size: 20px;
	font-family: Crimson Pro; */
	/* margin-left: 16px; */
	color: #818483;
}
.loginbox .checkboxText {
	/* font-size: 20px;
	font-family: Crimson Pro; */
	margin-left: 16px;
	/* color: #818483; */
}
.loginbox .Loginbtn{
	font-size: 25px;
	font-weight: bold;
	/* font-family: Crimson Pro; */
	color: #fff;
	background-color: #9CA09F;
}

/* .panel-body{
	clear:both;
	width: 566px;
	height: 420px;
	background-color: #fff;
	border-radius: 0 0 30px 30px !important; 
	position:absolute !important; 
	top:50% !important; 
	left:50%!important; 
	transform:translate(-50%,-50%) !important;
}
.fieldset {
	background-position: center;
}
#id {
	margin-top: 35px;
	margin-bottom: 30px;
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
#pw::-webkit-input-placeholder{
  background-image: url('${context}/userImg/key.svg') ;
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
  	font-family: Crimson Pro;
	border-radius: 15px!important; 
}*/
/*
input[type="checkbox"]{
	width: 20px;
	height: 20px;
	color: #818483;
}

.checkbox label {
	padding-left: 50px;
}
.checkbox{
	width: 450px;
	height: 20px;
	margin-bottom: 20px;
}
.checkboxText {
	font-size: 20px;
	font-family: Crimson Pro;
	margin-left: 16px;
	color: #818483;
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
	.login{margin: -56px !important;}
}
@media (max-width: 992px) and (min-width: 769px) {
	.panel-body {top: 438% !important;}
	.login{margin: 77px !important;}
}
@media (max-width: 768px) {
	.panel-body {top: 438% !important;}
	.login{margin: 77px !important;}
} */
</style>
</html>
