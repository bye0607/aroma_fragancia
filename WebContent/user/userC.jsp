<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var ="context"><%=request.getContextPath()%></c:set>
<!DOCTYPE html>
<html>
<head>
		<meta name="description" content="userC.jsp">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
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
    <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    
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

	});

	

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
	
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("postNum2").value = extraAddr;
                
                } else {
                    document.getElementById("postNum1").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('postNum1').value = data.zonecode;
                document.getElementById("address1").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("address2").focus();
            }
        }).open();
    }

</script>
</head>
<body>
<jsp:include page="../common/top.jsp"></jsp:include>
<div class="backgroundImg" style="background-image: url('${context}/backgroundImage/loginImg.png');">
	<div class="container">
		<div class="row">
           <div class="col-md-6 col-md-offset-3">
                <div class="login-panel panel-default"  style="margin-bottom: 224%;" >
                    <div class="panel-heading login">
                        <div class="panel-title loginButton"><a href="${context}/user/login.jsp">Login</a></div>
						<div class="panel-title registerButton"><a href="${context}/work/user/createUser.do">Register</a></div>
                    </div>
		            <div class="panel-body">
		                    
					<form id="joinFrm" method="post" action="${context}/work/user/createUser.do" role="form">
					
						<!-- 이름 -->
						<div class="form-group"  style="margin-top: 5%;">
							<div class="col-sm-12" style="float: none; margin 0 auto;">
								<input class="form-control" type="text" id="name" name="name" autofocus="autofocus" required="required" placeholder="Name"/>
							</div>
						</div>
						
						<!-- 아이디 -->
						<div class="form-group">
							<div class="col-sm-12" style="float: none; margin 0 auto;">
								<input class="form-control" type="text" name="id" id="id" required="required" autofocus="autofocus" onkeyup="idCheck();" placeholder="Id"/>
							</div>
							<p id="message" style="margin-left: 10%"></p>
						</div>
			
						<!-- 비밀번호 -->
						<div class="form-group">
							<div class="col-sm-12" style="float: none; margin 0 auto;">
								<input class="form-control" type="password" name="pw" id="pw" required="required" placeholder="Password"/>
							</div>
						</div>
			
						<!-- 이메일 -->
						<div class="form-group">
							<div class="col-sm-12" style="float: none; margin 0 auto;">
								<input class="form-control" type="email" name="email" id="email" required="required" placeholder="E-mail"/>
							</div>
						</div>
						
						<!-- 생년월일 -->
				        <div class="form-group">
						    <div class="col-sm-12" style="float: none; margin 0 auto;">
						        <input class="form-control" id="birth" name="birth" required="required" maxlength="10" placeholder="Birth"/>
						    </div>
						</div> 
						
						<!-- 전화번호 -->
						<div class="form-group">
						    <div class="col-sm-12" style="float: none; margin 0 auto;">
						        <select class="form-control" style="margin 0 auto;" id="phoneCd" name="phoneCd" required="required" style="margin 0 auto;">
									<c:forEach items="${dsCode1}" var="code1">
									    <option value="${code1.commCd}">${code1.commCdNm}</option>
									</c:forEach>
						       </select>
					  	    </div>
						    <div class="col-sm-12" style="float: none; margin 0 auto;">
						       <input class="form-control" type="text" id="phone1" maxlength="4" required="required" placeholder="Phone" onkeydown="return fn_showKeyCode(event)"/>
						    </div>
						    <div class="col-sm-12" style="float: none; margin 0 auto;" >
						       <input class="form-control" style="margin 0 auto;" type="text" id="phone2" maxlength="4" required="required" placeholder="Phone" onkeydown="return fn_showKeyCode(event)"/>
					        </div>
						    <input type="hidden" id="phoneNum" name="phoneNum">
					     </div>
				
						<!-- 주소 -->
						<div class="form-group">
				            <div class="col-sm-12" id="formIcon" style="float: none; margin 0 auto;">
				  	            <input type="button" id="sample6_execDaumPostcode()" onclick="sample6_execDaumPostcode()" name="name" value="Search">
				               	<input class="form-control address1" placeholder="Address" id="postNum1" name="address" disabled="disabled" type="text">
				            </div>
			              	<input type="hidden" id="postNum" name="postNum">
			            </div>
				                             
			            <!-- 주소 1 -->
			            <div class="form-group">
			            	<div class="col-sm-12" id="formIcon" style="float: none; margin 0 auto;">
			                <input class="form-control" placeholder="Details 1" id="postNum2" name="details 1" disabled="disabled" type="text">
			                </div>
			            </div>
			            
			            <!-- 주소 2 -->
			            <div class="form-group">
			            	<div class="col-sm-12" id="formIcon" style="float: none; margin 0 auto;">
			                <input class="form-control" placeholder="Details 2" id="address1" name="details 2" disabled="disabled" type="text">
			                </div>
			            </div>
			            
			            
			            
			            <!-- 주소 3 -->
			            <div class="form-group">
			            	<div class="col-sm-12" id="formIcon" style="float: none; margin 0 auto;">
			                	<input class="form-control" placeholder="Details 3" id="address2" name="details 3" type="text" style="margin-bottom: 0 !important;">
			                </div>
			                <input type="hidden" id="address" name="address">
			            </div>
			
			
						<!-- 사진 추가 기능 사용 안함 -->
						<div class="form-group" style="display: none">
							<label class="control-label col-md-2" style="display: none"><b>사진</b></label>
							<img id="pic" style="margin-left: 15px;" height="180px" width="150px" src="${context}/backgroundImage/defaultpic.png" style="display: none"><br/>
							<div class="col-md-6">
								<input type="hidden" id="userImage" name="userImage" style="display: none">
							</div>
						</div>
						<!-- 사진 추가 기능 끝 -->
						
						<input type="hidden" id="flag" name="flag" value="false">
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
							<button class="Loginbtn form-control" type="button" name="btnSubmit" id="btnSubmit" onclick="fn_save()">CREATE ACCOUNT</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

	
	
	
				<!--  사진 파일 저장 ajax 사용 안함  -->
				<form id="ajaxform" action="${context}/work/product/saveFile.do" method="post" enctype="multipart/form-data" role="form" >
					<div class="form-group" style="display: none">
					<label class="control-label col-md-2"></label>
						<div class="col-md-6" style="display: none">
							<input class="form-control" type="file" id="imageFile" name="imageFile" onchange="fn_upload()" style="display: hidden" />
							<input type="hidden" id="imageFolder" name="imageFolder" value="userImg" style="display: none">
						</div>
					</div>
					<br><br><br>
				</form>
			    <!-- /.panel -->
	</div>
</div>

	<jsp:include page="../common/foot.jsp"></jsp:include>
</body>
<style type="text/css">

.address1 {
float: left !important;
width: 380px !important;
margin-left: 27px !important;
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
	height: 2000px;
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
	height: 1170px;
	background-color: #fff;
	border-radius: 0 0 30px 30px !important; 
	position:absolute !important; 
	top:40% !important; 
	left:50%!important; 
	transform:translate(-50%,-45%) !important;
}
.fieldset {
	background-position: center;
}


#name::-webkit-input-placeholder{
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
#birth::-webkit-input-placeholder{
  background-image: url('${context}/userImg/calendar.svg') ;
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
#phone1::-webkit-input-placeholder{
  background-image: url('${context}/userImg/phone.svg') ;
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
#phone2::-webkit-input-placeholder{
  background-image: url('${context}/userImg/phone.svg') ;
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

#postNum2::-webkit-input-placeholder{
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
#postNum1::-webkit-input-placeholder{
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
#address1::-webkit-input-placeholder{
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
#address2::-webkit-input-placeholder{
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
	font-family: Crimson Pro;
}
.loginButton{
	width: 283px;
	height: 62px;
	text-align: center;
	float: left;
	font-size: 28px;
	font-family:'DM Serif Display';
	line-height: 64px;
	border-radius: 30px 0 0 0!important; 
	background-color: #9E9C9C;
}
.registerButton{
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
.Loginbtn{
	font-size: 25px;
	font-weight: bold;
	font-family: Crimson Pro;
	color: #fff;
	background-color: #9CA09F;
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
	.panel-body {top: 1036% !important;}
	.login{margin: 77px !important;}
}

@media (max-width: 992px) and (min-width: 769px) {
	.panel-body {top: 1036% !important}
	.login{margin: 77px !important;}
}
@media (max-width: 768px) {
	.panel-body {top: 1036% !important;}
	.login{margin: 77px !important;}
}
</style>
</html>