<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var ="context"><%=request.getContextPath()%></c:set>
<!DOCTYPE html>
<html>
<head>
	<meta name="description" content="modifyCommunity.jsp">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>커뮤니티 글 수정하기</title>
	<script src="${context}/js/jquery-1.9.1.js"></script>
		<script type="text/javascript">
		$(document).ready(function(){
			fn_init();
	
			//글수정 기존 내용 셋팅
			fn_setDetailInfo();
		});
	
		function fn_setDetailInfo(){
			$("#comuTitle").val('${dsCommunity.COMU_TITLE}');
			$("#comuNo").val('${dsCommunity.COMU_NO}');
	
			var comuContent = '${dsCommunity.COMU_CONTENT}';
	
			comuContent = comuContent.replace(/<br ?\/?>/gi, "\n");
	
			$("#comuContent").val(comuContent);
		}
	
		function fn_save(){
			if(!fn_validation()){
				return;
			}else{
				var comuContent = String($("#comuContent").val());
	
				comuContent = comuContent.replace(/\n/gi, "<br/>");
	
				$("#comuContent").val(comuContent);
	
		 		$("#communityModify").submit();
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
		<form id="communityModify" method="post" action="${context}/work/board/communityModify.do?comuNo=${dsCommunity.COMU_NO}" role="form">
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