<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var ="context"><%=request.getContextPath()%></c:set>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Password Find</title>
    <script src="${context}/js/jquery-1.9.1.js"></script>
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
<jsp:include page="${context}/common/top.jsp"></jsp:include>
<div class="container-fluid backgroundImg">
	<div class="row">
    	<div class="col-md-6 col-md-offset-3">
	        <div class="loginbox">
	        	<!-- login tab button start -->
	        	<div class="logintab">
			        <div class="col-xs-12 title">Password Find</div>
				</div>
                <form action="${context}/work/user/login.do" method="post" role="form" id="loginFrm">
                    <fieldset>
                        <div class="form-group">
                        	<div class="col-sm-12">
                            	<input class="form-control" type="text" name="id" id="id" required="required" autofocus="autofocus" placeholder="ID"/>
                            </div>
                        </div>
                        <div class="form-group">
                        	<div class="col-sm-12">
                        		<input class="form-control" type="email" name="email" id="email" required="required" placeholder="Email"/>
                            </div>
						</div>
		            	<div class="form-group">
							<div class="col-sm-12">
								<input class="Loginbtn form-control" type="button" name="btnSubmit" id="btnSubmit" value="확인" onclick="retrieveUserPw()"/>
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