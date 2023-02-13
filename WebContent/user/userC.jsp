<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var ="context"><%=request.getContextPath()%></c:set>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>회원가입</title>
	<link href="//code.jquery.com/ui/1.11.3/themes/smoothness/jquery-ui.css" rel="stylesheet" >
	<link href="${context}/css/common.css" rel="stylesheet">
	<script src="${context}/js/jquery-1.9.1.js"></script>
	<script src="${context}/js/jquery.form.js"></script>
	
    <!-- 필수입력 미입력시 빨간색배경 fadeout 효과 -->
    <script src="//code.jquery.com/ui/1.11.3/jquery-ui.js"></script>
    
    <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script type="text/javascript">

	var dong;
	var imageFolder;

	$(document).ready(function(){
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
 		$("#postNum").val($("#postNum1").val());
 		$("#address").val($("#address1").val() + $("#postNum2").val() + "/" + $("#address2").val());

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
<jsp:include page="${context}/common/top.jsp"></jsp:include>
<div class="container-fluid backgroundImg">
	<div class="row">
       	<div class="col-md-6 col-md-offset-3">
	        <div class="loginbox">
	        	<!-- login tab button start -->
	        	<div class="logintab">
			        <div class="col-xs-6 tabbtn"><a href="${context}/user/login.jsp">Login</a></div>
					<div class="col-xs-6 tabbtn on"><a href="${context}/work/user/createUser.do">Register</a></div>
				</div>
	        	<!-- login tab button end -->
				<form id="joinFrm" method="post" action="${context}/work/user/createUser.do" role="form">
					
					<!-- 아이디 -->
					<div class="form-group">
						<div class="col-sm-12">
							<label for="id" class="control-label hidden"><b>아이디</b></label>
							<input class="form-control" type="text" name="id" id="id" required="required" autofocus="autofocus" onkeyup="idCheck();" placeholder="Id"/>
						</div>
						<div class="col-sm-12" id="message"></div>
					</div>
		
					<!-- 비밀번호 -->
					<div class="form-group">
						<div class="col-sm-12">
							<label for="pw" class="control-label hidden"><b>비밀번호</b></label>
							<input class="form-control" type="password" name="pw" id="pw" required="required" placeholder="Password"/>
						</div>
					</div>
					
					<!-- 이름 -->
					<div class="form-group">
						<div class="col-sm-12">
							<label for="name" class="control-label hidden"><b>이름</b></label>
							<input class="form-control" type="text" id="name" name="name" autofocus="autofocus" required="required" placeholder="Name"/>
						</div>
					</div>
				
					<!-- 이메일 -->
					<div class="form-group">
						<div class="col-sm-12">
							<label for="email" class="control-label hidden"><b>이메일</b></label>
							<input class="form-control" type="email" name="email" id="email" required="required" placeholder="E-mail"/>
						</div>
					</div>
					
					<!-- 생년월일 -->
			        <div class="form-group">
					    <div class="col-sm-12">
							<label for="birth" class="control-label hidden"><b>생년월일</b></label>
					        <input class="form-control" id="birth" name="birth" required="required" maxlength="10" placeholder="Birth" autocomplete="off"/>
					    </div>
					</div> 
							
					<!-- 전화번호 -->
					<div class="form-group">
					    <div class="col-sm-12">
							<label for="phoneCd" class="control-label hidden"><b>전화번호</b></label>
					        <select class="form-control" id="phoneCd" name="phoneCd" required="required">
								<c:forEach items="${dsCode1}" var="code1">
								    <option value="${code1.commCd}">${code1.commCdNm}</option>
								</c:forEach>
					        </select>
			  	    	</div>
					    <div class="col-sm-12">
					       <input class="form-control" type="text" id="phone1" name="phone1" maxlength="4" required="required" placeholder="전화번호 네자리" onkeydown="return fn_showKeyCode(event)"/>
					    </div>
					    <div class="col-sm-12">
					       <input class="form-control" type="text" id="phone2" name="phone2" maxlength="4" required="required" placeholder="끝번호 네자리" onkeydown="return fn_showKeyCode(event)"/>
				        </div>
					    <input type="hidden" id="phoneNum" name="phoneNum">
					</div>
					
					<!-- 주소 -->
					<div class="form-group">
					    <div class="col-sm-12">
							<div class="input-group">
								<label for="address" class="control-label hidden"><b>주소</b></label>
						    	<input type="text" class="form-control postcode" placeholder="Address" id="postNum1" name="address" disabled="disabled" required="required">
					    		<span class="input-group-btn">
					    			<button class="btn btn-default postsearch" id="sample6_execDaumPostcode()" onclick="sample6_execDaumPostcode()" type="button">Search</button>
					    		</span>
					    		<input type="hidden" id="postNum" name="postNum">
						    </div>
					    </div>
				    </div>
		            <!-- 주소 1 -->
		            <div class="form-group hidden">
		            	<div class="col-sm-12">
		                <input class="form-control" placeholder="Details 1" id="postNum2" name="details 1" disabled="disabled" type="hidden">
		                </div>
		            </div>
		            <!-- 주소 2 -->
		            <div class="form-group">
		            	<div class="col-sm-12">
		                <input class="form-control" placeholder="Details 1" id="address1" disabled="disabled" type="text">
		                </div>
		            </div>
		            <!-- 주소 3 -->
		            <div class="form-group">
		            	<div class="col-sm-12">
		                	<input class="form-control" placeholder="Details 2" id="address2" type="text">
		                	<input type="hidden" id="address" name="address">
		                </div>
		            </div>
					
					<input type="hidden" id="flag" name="flag" value="false">
					<div class="form-group">
	                	<div class="col-sm-12">
							<button class="form-control btn Loginbtn" type="button" name="btnSubmit" id="btnSubmit" onclick="fn_save()">CREATE ACCOUNT</button>
						</div>
					</div>
					&nbsp;
				</form>
			</div>
		</div>
	</div>
</div>

<jsp:include page="${context}/common/foot.jsp"></jsp:include>
</body>
</html>