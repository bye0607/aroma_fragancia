<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var ="context"><%=request.getContextPath()%></c:set>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="description" content="stockRegisterC.jsp">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>ADMIN - 신규상품등록</title>
	<script src="${context}/js/jquery-1.9.1.js"></script>
	<!-- 필수입력 미입력시 빨간색배경 fadeout 효과 -->
    <script src="//code.jquery.com/ui/1.11.3/jquery-ui.js"></script>
    <script>
    var productCategoryCd;
    var imageFolder;

    $(document).ready(function() {
        fn_init();
    });

	function fn_save(){
		if(confirm("등록하시겠습니까?")){
			if(!fn_validation()) return;

			alert("상품이 등록되었습니다.");

			$("#createProduct").submit();
		}
	}

	function fn_setProductCategoryCd(){
		productCategoryCd = $("#productCategoryCd").val();

		if(productCategoryCd == 'P'){
			imageFolder = "perfumeImg";
		} else if(productCategoryCd == 'D'){
			imageFolder = "diffuserImg";
		}

		$("#imageFolder").val(imageFolder);
	}

	function fn_upload(){
		$("#ajaxform").ajaxSubmit({
	        type: "POST",
	        dataType: 'text',
	        url: $("#ajaxform").attr("action"),
	        data: $("#ajaxform").serialize(),
	        success: function (data) {
	        	data2 = data.replace(/"/gi, "");
	        	var imageUrl = "${context}/" + imageFolder + "/" + data2;
	        	$("#pic").attr("src", imageUrl);
	        	$("#productImage").val(data2);
	        },
	        error: function (xhr, status, error) {
	            alert(error);
	        }
	    });
	}

	function fn_checkCategory(){
		if(productCategoryCd == undefined){
			alert("분류를 먼저 선택해주세요.");
			return false;
		}
	}
    </script>
</head>
<body>
<jsp:include page="${context}/common/top.jsp"></jsp:include>
<div class="container">
	<!-- board title, buttons start -->
	<div class="page-header">
		<div class="row">
			<div class="col-xs-8">
				<!-- 한글일 경우 title 클래스만 사용. 영문일 경우 eng 클래스 추가하세요 -->
				<h2 class="title">신규상품등록</h2>
			</div>
		</div>
	</div>
	<!-- board title, buttons end -->
	<form id="createProduct" method="post" action="${context}/work/product/createProduct.do" role="form">
		<div class="form-horizontal">
			<div class="form-group" style="margin-top: 5%;">
				<label for="productName" class="control-label col-md-2"><b>상품명</b></label>
				<div class="col-md-4">
					<input class="form-control" type="text" name="productName" id="productName" required="required" autofocus="autofocus"/>
				</div>
			</div>

			<div class="form-group">
				<label for="productCategoryCd" class="control-label col-md-2"><b>카테고리</b></label>
				<div class="col-md-2">
		        	<select class="form-control" id="productCategoryCd" name="productCategoryCd" required="required" onchange="fn_setProductCategoryCd()">
						<c:forEach items="${dsCode1}" var="code1">
							<option value="${code1.commCd}">${code1.commCdNm}</option>
						</c:forEach>
		     		</select>
	     		</div>
			</div>

			<div class="form-group">
				<label for="productUnitPrice" class="control-label col-md-2"><b>단가</b></label>
				<div class="col-md-3">
					<input class="form-control" type="text" id="productUnitPrice" name="productUnitPrice" required="required" onkeydown="return fn_showKeyCode(event)"/>
				</div>
			</div>

			<div class="form-group">
				<label for="productCount" class="control-label col-md-2"><b>수량</b></label>
				<div class="col-md-3">
					<input class="form-control" type="text" id="productCount" name="productCount" required="required" onkeydown="return fn_showKeyCode(event)"/>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-md-2"><b>상품이미지</b></label>
				<img id="pic" style="margin-left: 15px;" height="180px" width="150px" src="${context}/admin/product_default.png"><br/>
				<div class="col-md-6">
					<input type="hidden" id="productImage" name="productImage" required="required">
				</div>
			</div>
		</div>
	</form>

	<form id="ajaxform" action="${context}/work/product/saveFile.do" method="post" enctype="multipart/form-data" role="form">
		<div class="form-group">
		<label class="control-label col-md-2"></label>
			<div class="col-md-6">
				<input class="form-control" type="file" id="imageFile" name="imageFile" onchange="fn_upload()" onclick="return fn_checkCategory()"/>
				<input type="hidden" id="imageFolder" name="imageFolder">
			</div>
		</div>
	</form>
	<div class="form-group">
		<!-- board button area start -->
		<div class="row btnarea">
			<button class="btn btn-lg boardbtn" type="button" onclick="fn_save()">등록하기</button>
			<button type="button" class="btn btn-lg boardbtn" onclick="fn_back()">취소</button>
		</div>
		<!-- board button area end -->
	</div>
</div>

<jsp:include page="${context}/common/foot.jsp"></jsp:include>
</body>
</html>