<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var ="context"><%=request.getContextPath()%></c:set>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>FIND ID</title>
    <script src="${context}/js/jquery-1.9.1.js"></script>
	<script type="text/javascript">
	$(document).ready(function(){
		$("#email").keydown(function (key){
			if(key.keyCode == 13){
				retrieveUserId();
			}

		});
	});

	function retrieveUserId(){
		var param = {};

		var email = $("#email").val();

		param["email"] = email;

		var access = $("#message");
		$.ajax({
			url:"${context}/work/user/retrieveUserId.do",
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
<jsp:include page="${context}/common/top.jsp"></jsp:include>
<div class="container-fluid backgroundImg">
	<div class="row">
    	<div class="col-md-6 col-md-offset-3">
	        <div class="loginbox">
	        	<!-- login tab button start -->
	        	<div class="logintab">
			        <div class="col-xs-6 tabbtn on"><a href="${context}/user/idFind.jsp">Find Id</a></div>
			        <div class="col-xs-6 tabbtn"><a href="${context}/user/pwFind.jsp">Find Password</a></div>
				</div>
	        	<!-- login tab button end -->
	        	<form>
                    <fieldset>
                        <div class="form-group">
                        	<div class="col-sm-12">
	                       		<input class="form-control" type="email" name="email" id="email" required="required" autofocus="autofocus" autocomplete="off" placeholder="Email"/>
                            </div>
						</div>
						<div class="form-group">
							<div class="col-sm-12">
								<input class="Loginbtn form-control" type="button" name="btnSubmit" id="btnSubmit" value="확인" onclick="retrieveUserId()"/>
							</div>
						</div>
						<div class="form-group" id="message"></div>
					</fieldset>
				</form>
			</div>
		</div>
	</div>
</div>
<jsp:include page="${context}/common/foot.jsp"></jsp:include>
</body>
</html>