<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var ="context"><%=request.getContextPath()%></c:set>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>공지사항 - 글 목록</title>
	<script src="${context}/js/jquery-1.9.1.js"></script>
	<script type="text/javascript">
		function fn_noticeWrite(){
			location.href = "${context}/work/board/noticeWrite.do";
		}
	</script>
</head>
<body>
<jsp:include page="${context}/common/top.jsp"></jsp:include>
<!-- title, visual start -->
<div class="titarea" style='background-image: url("${context}/img/subbg_service.png");'>
	<div class="boardText">
		<h3 class="boardTitle">NOTICE</h3>
		<p class="boardSub">공지사항</p>
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
					<h2 class="title eng">notice</h2>
					<small>AROMA, FRAGANCIA가 전하는 소식</small>
				</div>
				<c:if test="${sessionScope.grade == 'A'}">
					<div class="col-xs-4 text-right">
						<button type="button" class="btn btn-lg boardbtn notice" onclick="fn_noticeWrite()">새 글 쓰기</button>
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
                    <c:forEach items="${dsNoticeList}" var="dsNoticeList">
                         <tr>
                         	<td>
                         		<div class="col-md-10"><a href ="${context}/work/board/noticeView.do?ntcNo=${dsNoticeList.NTC_NO}">${dsNoticeList.NTC_TITLE}</a></div>
								<div class="col-md-2 text-right">${dsNoticeList.USER_NAME}</div>
                         	</td>
                         </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
			<!-- board list end -->
		</div> <!-- row end -->
	</div> <!-- container end -->

	<jsp:include page="${context}/common/foot.jsp"></jsp:include>
</body>
</html>