<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var ="context"><%=request.getContextPath()%></c:set>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>글 수정하기</title>
	<script src="${context}/js/jquery-1.9.1.js"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			fn_init();
	
			//글수정 기존 내용 셋팅
			fn_setDetailInfo();
		});
	
		function fn_setDetailInfo(){
			$("#boTitle").val('${dsBoard.BO_TITLE}');
			$("#boNo").val('${dsBoard.BO_NO}');
	
			var boContent = '${dsBoard.BO_CONTENT}';
	
			boContent = boContent.replace(/<br ?\/?>/gi, "\n");
	
			$("#boContent").val(boContent);
		}
	
		function fn_save(){
			if(!fn_validation()){
				return;
			}else{
				var boContent = String($("#boContent").val());
	
				boContent = boContent.replace(/\n/gi, "<br/>");
	
				$("#boContent").val(boContent);
	
		 		$("#modifyBoard").submit();
			}
		}
	
	</script>
</head>
<body>
<jsp:include page="${context}/common/top.jsp"></jsp:include>
<!-- title, visual start -->
<div class="titarea" style='background-image: url("${context}/img/subbg_service.png");'>
	<div class="boardText">
		<h3 class="boardTitle">BOARD</h3>
		<p class="boardSub">자유 게시판</p>
	</div>
</div>
<!-- title, visual end -->
<!-- Detail -->
	<div class="container">
		<!-- board title, buttons start -->
		<div class="page-header">
			<div class="row">
				<div class="col-xs-8">
					<!-- 한글일 경우 title 클래스만 사용. 영문일 경우 eng 클래스 추가하세요 -->
					<h2 class="title eng">자유 게시판</h2>
				</div>
			</div>
		</div>
		<!-- board title, buttons end -->
		<form id="modifyBoard" method="post" action="${context}/work/board/boardModify.do?boNo=${dsBoard.BO_NO}" role="form">
			<div class="form-horizontal boardwrite">
				<div class="form-group">
					<label for="boTitle" class="control-label">제목</label>
					<input class="form-control" type="text" name="boTitle" id="boTitle" required="required" maxlength="50" autofocus="autofocus">
				</div>
	
				<div class="form-group">
					<label for="boContent" class="control-label">내용</label>
					<textarea class="form-control" name="boContent" id="boContent" cols="10" rows="15" required="required"></textarea>
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