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
   <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
   

   <script src="//code.jquery.com/ui/1.11.3/jquery-ui.js"></script>
   <script type="text/javascript">

   var dong;

   $(document).ready(function(){
      fn_init();

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

      //U페이지 해당
      fn_setDetailInfo();
   });

   function fn_setDetailInfo(){
      $("#id").val('${dsUser.id}');
      $("#pw").val('${dsUser.pw}');
      $("#email").val('${dsUser.email}');

      $("#name").val('${dsUser.name}');
      $("#birth").val('${dsUser.birth}');

      var phoneArr = '${dsUser.phoneNum}'.split("-");
      var postNumArr = '${dsUser.postNum}'.split("-");
      var addressArr = '${dsUser.address}'.split("/");

      var userImage = '${dsUser.userImage}';
      userImage = userImage.replace(/"/gi, "");

      $("#phone1").val(phoneArr[0]);
      $("#phone2").val(phoneArr[1]);

      $("#phoneCd").val('${dsUser.phoneCd}');

      $("#postNum1").val(postNumArr[0]);
      $("#postNum2").val(postNumArr[1]);

      $("#address1").val(addressArr[0]);
      $("#address2").val(addressArr[1]);

      $("#pic").attr("src", '${context}/userImg/' + userImage);
      $("#userImage").val(userImage);

   }

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

      if(confirm("수정하시겠습니까?")){
         $("#phoneNum").val($("#phone1").val() + "-" + $("#phone2").val());
          $("#postNum").val($("#postNum1").val());
          $("#address").val($("#address1").val() + $("#postNum2").val() + "/" + $("#address2").val());

          $("#joinFrm").submit();
      }
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
                    document.getElementById("address2").value = '';
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
<!-- top 끝 -->
<div class="backgroundImg" style="background-image: url('${context}/backgroundImage/loginImg.png');">
	<div class="container">
		<form id="joinFrm" method="post" action="${context}/work/user/updateUser.do" role="form" class="form-horizontal">
			<div class="row">
				<div class="col-md-6 col-md-offset-3">
					<div class="panel-body">
						<div class="panel-title login">Edit user information</div>
							<!-- 아이디 -->
							<div class="form-group">
							<label for="id" class="control-label col-md-2 idUser" hidden="hidden;"><b>아이디</b></label>
								<div class="col-sm-12">
									<input class="form-control" type="text" name="id" id="id" required="required" autofocus="autofocus" onkeyup="idCheck();" placeholder="아이디"/>
									<p id="message"></p>
								</div>
							</div>
							<!-- 비밀번호 -->
							<div class="form-group">
							<label for="pw" class="control-label col-md-2 pwUser" hidden="hidden;"><b>비밀번호</b></label>
								<div class="col-sm-12">
									<input class="form-control" placeholder="비밀번호" id="pw" name="pw" type="password">
								</div>
							</div>
							<!-- 이메일 -->
							<div class="form-group">
							<label for="email" class="control-label col-md-2 emailUser" hidden="hidden;"><b>이메일</b></label>
								<div class="col-sm-12">
									<input class="form-control" type="email" name="email" id="email" required="required" placeholder="이메일"/>
								</div>
							</div>
							<!-- 이름 -->
							<div class="form-group" >
							<label for="name" class="control-label col-md-2 nameUser" hidden="hidden;"><b>성명</b></label>
								<div class="col-sm-12">
									<input class="form-control" type="text" id="name" name="name" autofocus="autofocus" required="required" placeholder="성명"/>
								</div>
							</div>
							<!-- 생년월일 -->
							<div class="form-group">
							<label for="birth" class="control-label col-md-2 birthUser" hidden="hidden;"><b>생년월일</b></label>
								<div class="col-sm-12">
									<input class="form-control" type="text" id="birth" name="birth" required="required" maxlength="10" placeholder="생년월일"/>
								</div>
							</div> 
							<!-- 전화번호 -->
							<div class="col-sm-12 col-md-6 col-lg-4 phoneGroup">
								<div class="form-group">
								<label for="phoneCd" class="control-label col-md-2 phoneUser" hidden="hidden;"><b>연락처</b></label>
									<select class="form-control form-phone" id="phoneCd" name="phoneCd" required="required" style="font-size: 15px !important;">
										<c:forEach items="${dsCode1}" var="code1">
											<option value="${code1.commCd}">${code1.commCdNm}</option>
										</c:forEach>
									</select>
								</div>
								<div class="form-group">
									<input class="form-control form-phone" type="text" id="phone1" maxlength="4" required="required" placeholder="전화번호 네자리" onkeydown="return fn_showKeyCode(event)"/>
								</div>
								<div class="form-group">
									<input class="form-control form-phone" type="text" id="phone2" maxlength="4" required="required" placeholder="끝번호 네자리" onkeydown="return fn_showKeyCode(event)"/>
								</div>
									<input type="hidden" id="phoneNum" name="phoneNum">
							</div>
							<!-- 주소 -->
							<div class="form-group">
							<label for="postnum1" class="control-label col-md-2 addressUser" hidden="hidden;"><b>주소</b></label>
								<div class="col-sm-12" id="formIcon"">
									<input type="button" id="sample6_execDaumPostcode()" onclick="sample6_execDaumPostcode()" name="name" value="Search">
									<input class="form-control address1" placeholder="우편번호" type="text" id="postNum1" disabled="disabled" required="required"/>
								</div>
								<!-- 주소 동,로,가 -->
								<div class="col-sm-12" id="formIcon">
									<input class="form-control" type="hidden" placeholder="동,로,가" id="postNum2" disabled="disabled"/>
								</div>
									<input type="hidden" id="postNum" name="postNum">
							</div>
							<!-- 주소 1 -->
							<div class="form-group">
								<div class="col-sm-12" id="formIcon">
									<input class="form-control" placeholder="주소" type="text" id="address1" disabled="disabled" required="required"/>
								</div>
									<input type="hidden" id="extraAddr" name="extraAddr">
							</div>
							<!-- 추가 상세 주소 2 -->
							<div class="form-group">
								<div class="col-sm-12" id="formIcon">
									<input class="form-control" placeholder="상세주소" type="text" id="address2"/>
								</div>
									<input type="hidden" id="address" name="address">
							</div>
							<!-- 사진 추가 기능 사용 안함 -->
							<div class="form-group">
								<div class="col-md-6">
									<input type="hidden" id="userImage" name="userImage">
								</div>
									<input type="hidden" id="flag" name="flag" value="false">
							</div>
							<!-- 사진 추가 기능 끝 -->
							<!-- Ajax saveFile.do 안씀 -->
							<form id="ajaxform" action="${context}/work/product/saveFile.do" method="post" enctype="multipart/form-data" role="form" >
								<div class="col-md-6">
									<input class="form-control" type="hidden" id="imageFile" name="imageFile" onchange="fn_upload()"/>
									<input type="hidden" id="imageFolder" name="imageFolder" value="userImg">
								</div>
							</form>
							<!-- 체크박스 -->
							<div class="form-group">
								<div class="col-md-12">
									<div class="checkbox checkbox1">
										<label><input type="checkbox"><p class="checkboxText">I agree the <span class="forgotText">Terms & Conditions</span></p></label>
									</div>
								</div>
							</div>      
							<!-- 버튼 -->
							<div class="form-group">
								<div class="col-md-12">
									<button type="button" class="Loginbtn1 form-control" onclick="fn_back()">뒤로가기</button>
									<button class="Loginbtn2 form-control" type="button" name="btnSubmit" id="btnSubmit" onclick="fn_save()">등록하기</button>
								</div>
							</div>
						</div>
					<!-- panel-body 끝 -->
				</div>
				<!-- col-md-6 col-md-offset-3 끝 -->
			</div>
			<!-- row 끝 -->
		</form>
		<!-- joinFrm 끝 -->
	</div>
	<!-- container 끝 -->
</div>
<!-- backgroundImg 끝 -->
<jsp:include page="../common/foot.jsp"></jsp:include>
<!-- footer 끝 -->
</body>
<style type="text/css">


.form-group {
   float: none; 
   margin 0 auto;
}

.phoneGroup {
    display: flex;
    margin-left: 40px;
    justify-content: flex-start;
}

font[Attributes Style] {
    color: #000 !important;
    font-size: medium;
}
.address1 {
   float: left !important;
   width: 380px !important;
   margin-left: 42px !important;
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
   height: 1500px;
   box-sizing: border-box;
   background-position: center;
   background-size: cover;
   justify-content:center !important; 
   align-items:center!important;
}
.login{
   font-family:'DM Serif Display';
   font-size: 30px;
}
.panel-title{
   padding-left: 15px;
   padding-top: 1em;
}
.panel-body{
   clear:both;
   width: 550px;
   height: 1150px;
   background-color: #fff;
   border-radius: 30px !important; 
   position: absolute !important; 
   top: 35px;
}
.fieldset {
   background-position: center;
}

#id {
   margin-top: 40px;
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
#sample6_postcode::-webkit-input-placeholder{
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
#sample6_address::-webkit-input-placeholder{
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
#sample6_detailAddress::-webkit-input-placeholder{
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
#sample6_extraAddress::-webkit-input-placeholder{
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
   margin: 0 auto;
   margin-bottom: 15px;
   border-radius: 15px!important; 
   font-size: 15px!important; 
}

.form-phone {
   width: 140px!important;
   height: 66px;
   margin-bottom: 15px;
   margin-right: 50px;
   border-radius: 15px!important; 
   font-size: 15px!important; 
}

input[type="checkbox"]{
   width: 20px; /*Desired width*/
   height: 20px; /*Desired height*/
   color: #818483;
}

input{
   float: none; 
   margin 0 auto;
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
   width: 200px;
   color: #fff;
   background-color: #9CA09F;
   float: left;
   margin: 0 0 0 58px;
}

.Loginbtn2{
   font-size: 25px;
   font-weight: bold;
   font-family: Crimson Pro;
   width: 200px;
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
   .panel-body {top: 716% !important}
   .login{margin: 77px !important;}
}
@media (max-width: 768px) {
   .panel-body {top: 716% !important;}
   .login{margin: 77px !important;}
}
</style>
</html>