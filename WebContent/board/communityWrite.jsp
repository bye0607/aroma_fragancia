<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var ="context"><%=request.getContextPath()%></c:set>
<!DOCTYPE html>
<html>
<head>
	<meta name="description" content="communityWrite.jsp">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>커뮤니티 글 쓰기</title>
	<script type="text/javascript">
		$(document).ready(function(){
			fn_init();
		});
	
		function fn_save(){
			if(!fn_validation()){
				return;
			}else{
				var comuCONTENT = String($("#comuCONTENT").val());
	
				comuCONTENT = comuCONTENT.replace(/\n/gi, "<br/>");
	
				$("#comuCONTENT").val(comuCONTENT);
	
		 		$("#communityWrite").submit();
			}
		}
	</script>
</head>
<body>
<jsp:include page="${context}/common/top.jsp"></jsp:include>
<!-- desktop버전  -->
<div class="desktop">
	<div class="img-responsive center-block" style='background-image: url("${context}/backgroundImage/subbg_service.png");'>
		<div class="boardText1" >
			<h3 class="boardTitle1">Community</h3>
			<p class="boardSub1">커뮤니티</p>
		</div>
	</div>
</div>
<!-- mobile버전  -->
<div class="mobile">
	<div class="mobileImg img-responsive center-block" style='background-image: url("${context}/backgroundImage/subbg_service.png");'>
		<div class="boardText2" >
			<h3 class="boardTitle2">Community</h3>
			<p class="boardSub2">커뮤니티</p>
		</div>
	</div>
</div>

<!-- Detail -->
	<div class="container">
		<!-- board title, buttons start -->
		<div class="page-header">
			<div class="row">
				<div class="col-xs-8">
					<!-- 한글일 경우 title 클래스만 사용. 영문일 경우 eng 클래스 추가하세요 -->
					<h2 class="title ">커뮤니티 게시판</h2>
				</div>
			</div>
		</div>
		<!-- board title, buttons end -->
		<form id="boardWrite" method="post" action="${context}/work/board/communityWrite.do" role="form">
			<div class="form-horizontal boardwrite">
				<div class="form-group">
					<label for="name" class="control-label">이름</label>
					<input class="form-control" type="text" name="boardTitle" id="boardTitle" required="required" maxlength="50" autofocus="autofocus" placeholder="이름을 입력해주세요"/>
				</div>
				<div class="form-group">
					<label for="boardTitle" class="control-label">제목</label>
					<textarea class="form-control" name="boardTitle" id="boardTitle" cols="10" rows="15" required="required" placeholder="제목을 입력해주세요"></textarea>
				</div>
				<div class="form-group">
					<label for="boardContent" class="control-label">내용</label>
					<textarea class="form-control" name="boardContent" id="boardContent" cols="10" rows="15" required="required" placeholder="내용을 입력해주세요"></textarea>
				</div>
				<!-- board button area start -->
				<div class="row btnarea">
					<button class="btn btn-lg boardbtn" type="button" onclick="fn_save()">글 등록하기</button>
					<button type="button" class="btn btn-lg boardbtn" onclick="fn_back()">취소</button>
				</div>
				<!-- board button area end -->
			</div>
		</form>
	</div>

	<jsp:include page="${context}/common/foot.jsp"></jsp:include>
</body>
</html>