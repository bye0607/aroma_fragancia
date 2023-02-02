<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var ="context"><%=request.getContextPath()%></c:set>
<!DOCTYPE html>
<html>
<head>
		<meta name="description" content="userC.jsp">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Information</title>
	
	<link href="${context}/css/bootstrap.min.css" rel="stylesheet">
	<link href="${context}/css/bootstrap-theme.css" rel="stylesheet">
	<link href="${context}/css/plugins/metisMenu/metisMenu.min.css" rel="stylesheet">
	<link href="${context}/css/plugins/social-buttons.css" rel="stylesheet">
	<link href="${context}/font-awesome-4.4.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
	<link href="//code.jquery.com/ui/1.11.3/themes/smoothness/jquery-ui.css" rel="stylesheet" >
		<link href="${context}/css/plugins/dataTables.bootstrap.css" rel="stylesheet">
    <link href="${context}/css/process.css" rel="stylesheet">

	<script src="${context}/js/jquery-1.9.1.js"></script>
	<script src="${context}/js/jquery.form.js"></script>
    <script src="${context}/js/plugins/metisMenu/metisMenu.min.js"></script>

	<script src="${context}/js/plugins/dataTables/jquery.dataTables.js"></script>
    <script src="${context}/js/plugins/dataTables/dataTables.bootstrap.js"></script>
    
   

    <script src="//code.jquery.com/ui/1.11.3/jquery-ui.js"></script>
	<script type="text/javascript">

	var dong;
	var imageFolder;

	$(document).ready(function(){
// 		$('#dataTables-example').dataTable();
		fn_init();

		imageFolder = "userImg";

		$( "#birth" ).datepicker({
	    	dateFormat: 'yy-mm-dd',
	    	changeMonth: true,
	        changeYear: true,
	        yearRange: "1980:2015"
	    });

		$("#dong").keydown(function (key){
			if(key.keyCode == 13){
				fn_postCheck();
			}

		});
	});

	function fn_setData(self){
		var postAllData = self.children().text();

		var postSplit = postAllData.split(" ");

		var zipcode = postSplit[0].split("-");
		var postNum1 = zipcode[0];
		var postNum2 = zipcode[1];
		var sido = postSplit[1];
		var gugun = postSplit[2];
		var dong = postSplit[3];
		var subDong = postSplit[4];

		if(subDong == null) subDong = "";

		var detailAddress = sido + " " + gugun + " " + dong + " " + subDong;

		$("#postNum1").val(postNum1);
		$("#postNum2").val(postNum2);

		$("#address1").val(detailAddress);

		$("#searchPost").modal('hide');
	}

	function fn_postCheck(){
		dong = $("#dong").val();

		if(dong == ""){
			alert("동을 입력하세요.");
			return;
		}
		$("#postBody").children().remove();

		var aheadHtml = "<tr><td style='text-align: center;'><a onclick=javascript:fn_setData($(this))><b>";
		var backHtml = "</b></a></td></tr>";
		var appendHtml = "";
		var param = {};


		param["dong"] = dong;

		$.ajax({
   			url:"${context}/work/applicant/retrievePostByDong.do",
			contentType:"application/json",
			dataType:"json",
			data:param,
   			success:function(result){
   				for(var i = 0; i < result.length; i++){
   					appendHtml
   					   += aheadHtml
   					   + result[i].zipcode + " "
					   + result[i].sido    + " "
				       + result[i].gugun   + " "
					   + result[i].dong    + " "
					   + backHtml;
   				}
   					$("#postBody").append(appendHtml);
   			}
   		});
	}

	function fn_save(){
		if(!fn_validation()) return;
		if($("#flag").val() == "false"){
			alert("이미 사용중인 ID입니다");
			$("id").focus();
			return;
		}


		$("#phoneNum").val($("#phone1").val() + "-" + $("#phone2").val());
 		$("#postNum").val($("#postNum1").val() + "-" + $("#postNum2").val());
 		$("#address").val($("#address1").val() + "/" + $("#address2").val());

 		$("#joinFrm").submit();
	}

	function idCheck(){
		var id = $("#id").val();
		var access = $("#message");
		$.ajax({
			url:"${context}/work/user/idCheck.do?id=" + id,
			success:function(result){
				result2 = result.replace(/"/gi, "");
				var splResult = result2.split("@");
				access.html(splResult[0]);
				$("#flag").val(splResult[1]);
			}
		});
	}

	function fn_upload(){
		$("#ajaxform").ajaxSubmit({
	        type: "POST",
	        dataType: 'text',
	        url: $("#ajaxform").attr("action"),
	        data: $("#ajaxform").serialize(),
	        success: function (data) {
	        	data2 = data.replace(/"/gi, "");
	        	var imageUrl = "${context}/userImg/" + data2;
	        	$("#pic").attr("src", imageUrl);
	        	$("#userImage").val(data2);
	        },
	        error: function (xhr, status, error) {
	            alert(error);
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
                   <div class="login-panel panel-default"  style="margin-bottom: 133%;">
                    <div class="panel-heading login">
                        <div class="Changing1">Information</div>
                        <div class="Changing2"></div>
                    </div>
                    <div class="panel-body">
                    
                        <form action="${context}/work/user/login.do" method="post" role="form" id="loginFrm" class="form-horizontal">
                            <div class="form-group">
                            <div class="col-sm-12" style="float: none; margin 0 auto;">
									<input class="form-control" type="text" name="id" id="id" required="required" autofocus="autofocus" onkeyup="idCheck();" placeholder="User"/>
								</div>
								<p id="message"></p>
							</div>
							
                                <div class="form-group">
								    <div class="col-sm-12" style="float: none; margin 0 auto;">
								      <input class="form-control" type="email" name="email" id="email" required="required" placeholder="Email"/>
								    </div>
								  </div>
								  
                                <div class="form-group">
                                <div class="col-sm-12" style="float: none; margin 0 auto;">
                                    <input class="form-control" placeholder="Password" id="pw" name="pw" type="password">
                                    </div>
                                </div>
                                
								
								<div class="form-group">
                                <div class="col-sm-12" id="formIcon" style="float: none; margin 0 auto;">
                                    <input class="form-control" placeholder="Address" id="address" name="address" type="text">
                                    <input type="button" name="name" value="Search">
                                    </div>
                                </div>
                                
                              
                                
                                <div class="form-group">
                                <div class="col-sm-12" id="formIcon" style="float: none; margin 0 auto;">
                                    <input class="form-control" placeholder="Details 1" id="details" name="details 1" type="text">
                                    </div>
                                </div>
                                
                                 <div class="form-group">
                                <div class="col-sm-12" id="formIcon" style="float: none; margin 0 auto;">
                                    <input class="form-control" placeholder="Details 2" id="details" name="details 2" type="text" style="margin-bottom: 0 !important;">
                                    </div>
                                </div>
								
                                <div class="form-group">
							    <div class="col-sm-12" style="float: none; margin 0 auto;">
							      <div class="checkbox checkbox1">
							        <label>
							          <input type="checkbox"><p class="checkboxText">I agree the <span class="forgotText">Terms & Conditions</span></p>
							        </label>
							      </div>
							    </div>
							  </div>
				               <div class="form-group">
								<button type="button" class="Loginbtn1 form-control" onclick="fn_back()">뒤로가기</button>
								<button class="Loginbtn2 form-control" type="button" name="btnSubmit" id="btnSubmit" onclick="fn_save()">등록하기</button>
							</div>
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
input[id="address"]{
	color: #9CA09F !important;
	  margin-left: 40px;
      width:70%;
      height: 66px;
      display:inline;
      outline:none;
      font-family: Crimson Pro;
      box-sizing: border-box;
      color:black;

    }
    input[value="Search"]{
      width: 18%;
      height: 66px;
      background-color: lightgray;
      border:none;
      background-color: white;
      font-size: 20px;
      font-family: Crimson Pro;
      color:#9CA09F;
      outline:none;
      display:inline;
      margin-left: -22px;
      box-sizing: border-box;
      border: 1px solid #ccc;
      border-radius: 0 15px 15px 0;
    }
    input[value="Search"]:hover{
     background:#9CA09F;
     color:#fff
    }
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
	height: 758px;
	background-color: #fff;
	border-radius: 0 0 30px 30px !important; 
	position:absolute !important; 
	top:50% !important; 
	left:50%!important; 
	transform:translate(-50%,-45%) !important;
}
.fieldset {
	background-position: center;
}

#id {
	margin-top: 34px;
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
  color: #9CA09F !important;
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
#address::-webkit-input-placeholder{
  background-image: url('${context}/userImg/map-pin.svg') ;
  background-size: contain;
  background-position:  1px center;
  background-repeat: no-repeat;
  padding: 0 15px 0 0;
  text-indent: 0;
  text-align:left;
  padding-left:40px;
  filter: invert(98%) sepia(0%) saturate(15%) hue-rotate(142deg) brightness(87%) contrast(85%);
}
#details::-webkit-input-placeholder{
  background-image: url('${context}/userImg/map-pin.svg') ;
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
	margin-bottom: 15px;
	border-radius: 15px!important; 
}
.Changing1{
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
.Changing2{
	width: 283px;
	height: 62px;
	text-align: center;
	float: left;
	font-size: 28px;
	font-family:'DM Serif Display';
	line-height: 64px;
	border-radius: 0 30px 0 0 !important; 
	background-color:#fff;
}
input[type="checkbox"]{
	width: 20px; /*Desired width*/
	height: 20px; /*Desired height*/
	color: #818483;
}

.checkbox label {
	padding-left: 64px;
}
.checkbox1{
	width: 450px;
	height: 20px;
	margin-bottom: 20px;
	padding-top: 0px !important;
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
.Loginbtn1{
	font-size: 25px;
	font-weight: bold;
	font-family: Crimson Pro;
	width: 220px;
	color: #fff;
	background-color: #9CA09F;
	float: left;
	margin: 0 0 0 58px;
}

.Loginbtn2{
	font-size: 25px;
	font-weight: bold;
	font-family: Crimson Pro;
	width: 220px;
	color: #fff;
	background-color: #9CA09F;
	float: left;
	margin: 0 50px 0 10px;
}

.forgotText {
	font-weight: bold;
	font-size: 20px;
	font-family: Crimson Pro;
	text-decoration: underline;
	text-align: center;
	margin-top: 22px;
}


@media (max-width: 992px) {
	.panel-body {top: 62% !important;}
	.login{margin: -56px !important;}
	.backgroundImg {height: 1100px;}
	}
	@media (max-width: 991px) and (min-width: 769px) {
	.panel-body {top: 649% !important}
	.login{margin: 77px !important;}
}
@media (max-width: 768px) {
	.panel-body {top: 649% !important}
	.login{margin: 77px !important;}
}
</style>
</html>