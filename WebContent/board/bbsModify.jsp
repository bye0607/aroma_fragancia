<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var ="context"><%=request.getContextPath()%></c:set>
<!DOCTYPE html>
<html>
<head>
	<meta name="description" content="modifyBoard.jsp">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>글 수정하기</title>
	<script type="text/javascript">
		$(document).ready(function(){
			fn_init();
	
			//글수정 기존 내용 셋팅
			fn_setDetailInfo();
		});
	
		function fn_setDetailInfo(){
			$("#boardTitle").val('${dsBoard.BOARD_TITLE}');
			$("#boardNo").val('${dsBoard.BOARD_NO}');
	
			var boardContent = '${boardContent.BOARD_CONTENT}';
	
			boardContent = boardContent.replace(/<br ?\/?>/gi, "\n");
	
			$("#boardContent").val(boardContent);
		}
	
		function fn_save(){
			if(!fn_validation()){
				return;
			}else{
				var boardContent = String($("#boardContent").val());
	
				boardContent = boardContent.replace(/\n/gi, "<br/>");
	
				$("#boardContent").val(boardContent);
	
		 		$("#modifyBoard").submit();
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
			<h3 class="boardTitle1">Board</h3>
			<p class="boardSub1">자유 게시판</p>
		</div>
	</div>
</div>
<!-- mobile버전  -->
<div class="mobile">
	<div class="mobileImg img-responsive center-block" style='background-image: url("${context}/backgroundImage/subbg_service.png");'>
		<div class="boardText2" >
			<h3 class="boardTitle2">Board</h3>
			<p class="boardSub2">자유 게시판</p>
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
					<h2 class="title eng">자유 게시판</h2>
				</div>
			</div>
		</div>
		<!-- board title, buttons end -->
		<form id="modifyBoard" method="post" action="${context}/work/board/modifyBoard.do?boardNo=${dsBoard.BOARD_NO}" role="form">
			<div class="form-horizontal boardwrite">
				<div class="form-group">
					<label for="boardTitle" class="control-label">제목</label>
					<input class="form-control" type="text" name="boardTitle" id="boardTitle" required="required" maxlength="50" autofocus="autofocus">
				</div>
	
				<div class="form-group">
					<label for="boardContent" class="control-label">내용</label>
					<textarea class="form-control" name="boardContent" id="boardContent" cols="10" rows="15" required="required"></textarea>
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