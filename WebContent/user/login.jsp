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
    <script src="${context}/js/jquery-1.9.1.js"></script>
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
					<div class="col-xs-6 tabbtn"><a href="${context}/work/user/createUser.do">Register</a></div>
				</div>
				<!-- login tab button end -->
				<form action="${context}/work/user/login.do" method="post" role="form" id="loginFrm">
                    <fieldset>
                        <div class="form-group">
	                        <div class="col-sm-12">
	                            <input class="form-control" type="text" name="id" id="id" required="required" autofocus="autofocus" placeholder="ID"/>
                            </div>
                        </div>
                        <div class="form-group">
	                        <div class="col-sm-12">
	                            <input class="form-control" placeholder="Password" id="pw" name="pw" type="password">
                            </div>
                        </div>
                        <div class="form-group">
	                        <div class="col-sm-12">
	                         	<button type="button" class="form-control btn Loginbtn" onclick="ajaxLoginCheck();">LOGIN</button>
                         	</div>
                       	</div>
                        <div class="form-group">
	                        <div class="col-sm-12">
	                        	<p class="forgotText"><a href="${context}/user/idFind.jsp">Forgot your id?</a></p>
	                        	<p class="forgotText"><a href="${context}/user/pwFind.jsp">Forgot your password?</a></p>
                        	</div>
                        </div>
                	</fieldset>
                </form>
            </div>
		</div>
	</div>
</div>
<jsp:include page="${context}/common/foot.jsp"></jsp:include>

</body>
</html>
