<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var ="context"><%=request.getContextPath()%></c:set>
<!DOCTYPE html>
<html>
<head>
	<meta name="description" content="boardWrite.jsp">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>글 목록</title>
	<script type="text/javascript">
		function fn_boardWrite(){
			location.href = "${context}/work/board/boardWrite.do";
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
					<h2 class="title eng">board</h2>
				</div>
				<c:if test="${sessionScope.grade == 'A'}">
				<div class="col-xs-4 text-right">
					<button type="button" class="btn btn-lg boardbtn" onclick="location.href='boardWrite.jsp'">새 글 쓰기</button>
				</div>
				</c:if>
			</div>
		</div>
		<!-- board title, buttons end -->
		<div class="row">
			<!-- board list start -->
            <div class="table-responsive">
                <table class="table table-hover boardlist">
                    <tbody>
                        <c:forEach items="${dsBoardList}" var="dsBoardList">
                         <tr>
                         	<td>
                         		<div class="col-md-10"><a href ="${context}/work/board/BoardView.do?boardNo=${dsBoardList.BOARD_NO}">${dsBoardList.BOARD_TITLE}</a></div>
								<div class="col-md-2">${dsBoardList.USER_CODE}</div>
                         	</td>
                         </tr>
                    </c:forEach>
                         <tr>
                         	<td>
                         		<div class="col-md-10"><a href ="boardView.jsp">${dsBoardList.USER_CODE}</a></div>
								<div class="col-md-2">${dsBoardList.USER_CODE}</div>
                         	</td>
                         </tr>
                         <tr>
                         	<td>
                         		<div class="col-md-10"><a href ="boardView.jsp">${dsBoardList.USER_CODE}</a></div>
								<div class="col-md-2">${dsBoardList.USER_CODE}</div>
                         	</td>
                         </tr>
                         <tr>
                         	<td>
                         		<div class="col-md-10"><a href ="boardView.jsp">what is lorem ipsum?</a></div>
								<div class="col-md-2">${dsBoardList.USER_CODE}</div>
                         	</td>
                         </tr>
                         <tr>
                         	<td>
                         		<div class="col-md-10"><a href ="boardView.jsp">what is lorem ipsum?</a></div>
								<div class="col-md-2">${dsBoardList.USER_CODE}</div>
                         	</td>
                         </tr>
                    </tbody>
                </table>
            </div>
			<!-- board list end -->
		</div> <!-- row end -->
	</div> <!-- container end -->

	<jsp:include page="${context}/common/foot.jsp"></jsp:include>
</body>
</html>