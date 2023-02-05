<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var ="context"><%=request.getContextPath()%></c:set>
<!DOCTYPE html>
<html>
<head>
	<meta name="description" content="boardView.jsp">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>글 내용보기</title>
	<script type="text/javascript">
		function fn_boardList(){
			location.href = "${context}/work/board/Board.do";
		}
		//글 삭제
		function fn_delete(){
			var boardNo = '${dsBoard.BOARD_NO}';
	
			if(confirm("정말 글을 삭제하시겠습니까?")){
				location.href = "${context}/work/board/deleteBoard.do?boardNo=" + boardNo;
			}
		}
		
		//글 수정
		function fn_update(){
			var boardNo = '${dsBoard.BOARD_NO}';
	
			location.href = "${context}/work/board/modifyBoard.do?boardNo=" + boardNo;
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
			<p class="boardSub2">공지사항</p>
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
		<div class="boardview">
			<!-- board view start -->
			<div class="row title">
				<div class="col-sm-12 col-md-10">
					${dsBoard.BOARD_TITLE}
				</div>
				<div class="col-sm-12 col-md-2 user">
					${dsBoard.USER_CODE}
				</div>
			</div>
			<div class="row content">
				${dsBoard.BOARD_CONTENT}
			</div>
		</div>
		<!-- board view end -->
		<!-- board button area start -->
		<c:if test="${sessionScope.grade == 'A' || sessionScope.userCode == dsBoard.USER_CODE}">
			<div class="row btnarea">
				<button class="btn btn-lg boardbtn" type="button" onclick="fn_update()">글 수정하기</button>
				<button class="btn btn-lg boardbtn" type="button" onclick="fn_delete()">글 삭제하기</button>
			</div>
		</c:if>
		<!-- board button area end -->
	
	</div> <!-- container end -->
	<jsp:include page="${context}/common/foot.jsp"></jsp:include>
</body>
</html>