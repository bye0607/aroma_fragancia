<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="context"><%=request.getContextPath()%></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="description" content="productListR.jsp">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>HS VOTE</title>

<link href="${context}/css/bootstrap.min.css" rel="stylesheet">
<link href="${context}/css/bootstrap-theme.css" rel="stylesheet">
<link href="${context}/css/plugins/metisMenu/metisMenu.min.css"
	rel="stylesheet">
<link href="${context}/css/plugins/dataTables.bootstrap.css"
	rel="stylesheet">

<link href="${context}/css/sb-admin-2.css" rel="stylesheet">
<link href="${context}/css/product.css" rel="stylesheet">

<!-- Custom Fonts -->
<link href="${context}/font-awesome-4.4.0/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<script src="${context}/js/bootstrap.min.js"></script>
<script src="${context}/js/jquery-1.9.1.js"></script>

<script src="${context}/js/plugins/metisMenu/metisMenu.min.js"></script>

<script src="${context}/js/plugins/dataTables/jquery.dataTables.js"></script>
<script src="${context}/js/plugins/dataTables/dataTables.bootstrap.js"></script>

<script src="${context}/js/sb-admin-2.js"></script>


<script>
	var existFolder = '';
	var imageFolder = '';
	var path = '';

	$(document).ready(function() {
		$('#dataTables-example').dataTable();
		 		fn_setImage();
	});

	 	function fn_setImage(){
	 		alert("fn_setImage()");
	         var productCategoryCd = '${dsProductList[0].PRODUCT_CATEGORY_CD}';

	         alert("productCategoryCd : " + productCategoryCd);

	 		if(productCategoryCd == 'O'){
	 			imageFolder = "officeImg";
	 		}else if(productCategoryCd == 'P'){
	 			imageFolder = "penImg";
	 		}else if(productCategoryCd == 'S'){
	 			imageFolder = "storageImg";
	 		}else if(productCategoryCd == 'D'){
	 			imageFolder = "designImg";
	 		}else if(productCategoryCd == 'B'){
	 			imageFolder = "binderImg";
	 		}
	 	}

	function fn_showResult(paramVoteCode, paramVoteCount) {
		if (paramVoteCount == 0) {
			alert("참여자가 없습니다.");
		} else {
			location.href = "${context}/work/result/retrieveResult.do?voteCode="
					+ paramVoteCode;
		}
	}

	function fn_checkVote(paramVoteCode) {
		var param = {};

		param["voteCode"] = paramVoteCode;

		$.ajax({
			url : "${context}/work/result/retrieveExampleNo.do",
			contentType : "application/json",
			dataType : "json",
			data : param,
			success : function(result) {
				if (result["checkMsg"] == "success") {
					fn_doVote(paramVoteCode);
					return true;
				} else if (result["checkMsg"] == "fail") {
					alert("이미 투표하셨습니다.");
					return false;
				}
			}
		});
	}
</script>
<script type="text/javascript">
	var productCategoryCd = '${dsProductList.PRODUCT_CATEGORY_CD}';

	if (productCategoryCd == 'O') {
		imageFolder = "officeImg";
	} else if (productCategoryCd == 'P') {
		imageFolder = "penImg";
	} else if (productCategoryCd == 'S') {
		imageFolder = "storageImg";
	} else if (productCategoryCd == 'D') {
		imageFolder = "designImg";
	} else if (productCategoryCd == 'B') {
		imageFolder = "binderImg";
	}
	path = $("img[name='image']").eq(
			'${dsProductIdx.index}').attr("src");

	existFolder = path.split("/")[2];
	$("img[name='image']").eq('${dsProductIdx.index}').attr("src",path.replace(existFolder, imageFolder));
</script>
</head>
<body>
	<jsp:include page="/common/top.jsp"></jsp:include>
	<div class="wrap">
		<!-- desktop버전  -->
		<div class="desktop">
			<div class="img-responsive center-block"
				style='background-image: url("${context}/backgroundImage/PRODUCT.png");'>
				<div class="boardText1">
					<h3 class="boardTitle1">PRODUCT</h3>
					<p class="boardSub1">diffuser</p>
				</div>
			</div>
		</div>
		<!-- mobile버전  -->
		<div class="mobile">
			<div class="mobileImg img-responsive center-block"
				style='background-image: url("${context}/backgroundImage/PRODUCT.png");'>
				<div class="boardText2">
					<h3 class="boardTitle2">PRODUCT</h3>
					<p class="boardSub2">diffuser</p>
				</div>
			</div>
		</div>
<!-- 향수 상품 영역 -->		
	<div class="container" style="font-family: 'Noto Sans KR'; font-style: normal;">
			<div class="container page-perfume">
				<h1 id="best-product">베스트 셀러${dsProductList[0].PRODUCT_CATEGORY_CD_NM}</h1>
			</div>
			
<!-- 죄송함다.. -->		
<%-- <div class="container">
	<c:forEach items="${dsProductList}" var="dsProductList" varStatus="dsProductIdx">
		<div class="row">
			<div class="col-md-4">
					<a href="${context}/work/product/retrieveProduct.do?productCode=${dsProductList.PRODUCT_CODE}">
					<img id="image" class="img-responsive" src="${context}/penImg/${dsProductList}" alt="Img" ></a> 
			</div>
			<div class="col-md-4">
				<h4 id="product-perfume">${dsProductList.PRODUCT_NAME}제품명</h4>
			</div>
			<div class="col-md-4">
				<h4>${dsProductList.PRODUCT_UNIT_PRICE}원</h4>
			</div>
			<div class="col-md-4">
				<h4>남은 수량 : ${dsProductList.PRODUCT_COUNT}</h4>
			</div>
			<c:if test="${dsProductIdx.index % 2 == 1}">&nbsp;</c:if>
			</div>
		</c:forEach>
	</div>
</div>
	</div> --%>
	
	<div class="container" style="display: flex-block;">
		<div class="row">
			<div class="col-md-4" >
				<a href="${context}/work/product/retrieveProduct.do?productCode=${dsProductList.PRODUCT_CODE}">
				<div id="image" class="img-responsive" style='background-image: url("${context}/designImg/s1.png");'></a> 
			</div>
			<div class="col-md-4">
				<h4 id="product-perfume" id="product-perfume-name">제품명 ${dsProductList.PRODUCT_NAME}</h4>
			</div>
			<div class="col-md-4">
				<h4 id="product-perfume-price">${dsProductList.PRODUCT_UNIT_PRICE} 원</h4>
			</div>
			<div class="col-md-4">
				<h4 id="product-perfume-leftover">남은 수량 : ${dsProductList.PRODUCT_COUNT} 개</h4>
			</div>
			</div>
			
			<div class="col-md-4" >
				<a href="${context}/work/product/retrieveProduct.do?productCode=${dsProductList.PRODUCT_CODE}">
				<div id="image" class="img-responsive" style='background-image: url("${context}/designImg/s2.png");'></a> 
			</div>
			<div class="col-md-4">
				<h4 id="product-perfume" id="product-perfume-name">제품명 ${dsProductList.PRODUCT_NAME}</h4>
			</div>
			<div class="col-md-4">
				<h4 id="product-perfume-price">${dsProductList.PRODUCT_UNIT_PRICE} 원</h4>
			</div>
			<div class="col-md-4">
				<h4 id="product-perfume-leftover">남은 수량 : ${dsProductList.PRODUCT_COUNT} 개</h4>
			</div>
			</div>
			
						
			<div class="col-md-4" >
				<a href="${context}/work/product/retrieveProduct.do?productCode=${dsProductList.PRODUCT_CODE}">
				<div id="image" class="img-responsive" style='background-image: url("${context}/designImg/s3.png");'></a> 
			</div>
			<div class="col-md-4">
				<h4 id="product-perfume" id="product-perfume-name">제품명 ${dsProductList.PRODUCT_NAME}</h4>
			</div>
			<div class="col-md-4">
				<h4 id="product-perfume-price">${dsProductList.PRODUCT_UNIT_PRICE} 원</h4>
			</div>
			<div class="col-md-4">
				<h4 id="product-perfume-leftover">남은 수량 : ${dsProductList.PRODUCT_COUNT} 개</h4>
			</div>
			</div>
	</div>
	
	<div class="container">
		<hr style="border: 1px solid #D7D8DA; margin-top:34px;">
	</div>
	
	<div class="row">
			<div class="col-md-4" >
				<a href="${context}/work/product/retrieveProduct.do?productCode=${dsProductList.PRODUCT_CODE}">
				<div id="image" class="img-responsive" style='background-image: url("${context}/designImg/s4.png");'></a> 
			</div>
			<div class="col-md-4">
				<h4 id="product-perfume" id="product-perfume-name">제품명 ${dsProductList.PRODUCT_NAME}</h4>
			</div>
			<div class="col-md-4">
				<h4 id="product-perfume-price">${dsProductList.PRODUCT_UNIT_PRICE} 원</h4>
			</div>
			<div class="col-md-4">
				<h4 id="product-perfume-leftover">남은 수량 : ${dsProductList.PRODUCT_COUNT} 개</h4>
			</div>
			</div>
			
			<div class="col-md-4" >
				<a href="${context}/work/product/retrieveProduct.do?productCode=${dsProductList.PRODUCT_CODE}">
				<div id="image" class="img-responsive" style='background-image: url("${context}/designImg/s5.png");'></a> 
			</div>
			<div class="col-md-4">
				<h4 id="product-perfume" id="product-perfume-name">제품명 ${dsProductList.PRODUCT_NAME}</h4>
			</div>
			<div class="col-md-4">
				<h4 id="product-perfume-price">${dsProductList.PRODUCT_UNIT_PRICE} 원</h4>
			</div>
			<div class="col-md-4">
				<h4 id="product-perfume-leftover">남은 수량 : ${dsProductList.PRODUCT_COUNT} 개</h4>
			</div>
			</div>
			
						
			<div class="col-md-4" >
				<a href="${context}/work/product/retrieveProduct.do?productCode=${dsProductList.PRODUCT_CODE}">
				<div id="image" class="img-responsive" style='background-image: url("${context}/designImg/s6.png");'></a> 
			</div>
			<div class="col-md-4">
				<h4 id="product-perfume" id="product-perfume-name">제품명 ${dsProductList.PRODUCT_NAME}</h4>
			</div>
			<div class="col-md-4">
				<h4 id="product-perfume-price">${dsProductList.PRODUCT_UNIT_PRICE} 원</h4>
			</div>
			<div class="col-md-4">
				<h4 id="product-perfume-leftover">남은 수량 : ${dsProductList.PRODUCT_COUNT} 개</h4>
			</div>
			</div>
	</div>
	<div class="row">
			<div class="col-md-4" >
				<a href="${context}/work/product/retrieveProduct.do?productCode=${dsProductList.PRODUCT_CODE}">
				<div id="image" class="img-responsive" style='background-image: url("${context}/designImg/s7.png");'></a> 
			</div>
			<div class="col-md-4">
				<h4 id="product-perfume" id="product-perfume-name">제품명 ${dsProductList.PRODUCT_NAME}</h4>
			</div>
			<div class="col-md-4">
				<h4 id="product-perfume-price">${dsProductList.PRODUCT_UNIT_PRICE} 원</h4>
			</div>
			<div class="col-md-4">
				<h4 id="product-perfume-leftover">남은 수량 : ${dsProductList.PRODUCT_COUNT} 개</h4>
			</div>
			</div>
			
			<div class="col-md-4" >
				<a href="${context}/work/product/retrieveProduct.do?productCode=${dsProductList.PRODUCT_CODE}">
				<div id="image" class="img-responsive" style='background-image: url("${context}/designImg/s8.png");'></a> 
			</div>
			<div class="col-md-4">
				<h4 id="product-perfume" id="product-perfume-name">제품명 ${dsProductList.PRODUCT_NAME}</h4>
			</div>
			<div class="col-md-4">
				<h4 id="product-perfume-price">${dsProductList.PRODUCT_UNIT_PRICE} 원</h4>
			</div>
			<div class="col-md-4">
				<h4 id="product-perfume-leftover">남은 수량 : ${dsProductList.PRODUCT_COUNT} 개</h4>
			</div>
			</div>
			
						
			<div class="col-md-4" >
				<a href="${context}/work/product/retrieveProduct.do?productCode=${dsProductList.PRODUCT_CODE}">
				<div id="image" class="img-responsive" style='background-image: url("${context}/designImg/s9.png");'></a> 
			</div>
			<div class="col-md-4">
				<h4 id="product-perfume" id="product-perfume-name">제품명 ${dsProductList.PRODUCT_NAME}</h4>
			</div>
			<div class="col-md-4">
				<h4 id="product-perfume-price">${dsProductList.PRODUCT_UNIT_PRICE} 원</h4>
			</div>
			<div class="col-md-4">
				<h4 id="product-perfume-leftover">남은 수량 : ${dsProductList.PRODUCT_COUNT} 개</h4>
			</div>
			</div>
	</div>
	<div class="row">
			<div class="col-md-4" >
				<a href="${context}/work/product/retrieveProduct.do?productCode=${dsProductList.PRODUCT_CODE}">
				<div id="image" class="img-responsive" style='background-image: url("${context}/designImg/s10.png");'></a> 
			</div>
			<div class="col-md-4">
				<h4 id="product-perfume" id="product-perfume-name">제품명 ${dsProductList.PRODUCT_NAME}</h4>
			</div>
			<div class="col-md-4">
				<h4 id="product-perfume-price">${dsProductList.PRODUCT_UNIT_PRICE} 원</h4>
			</div>
			<div class="col-md-4">
				<h4 id="product-perfume-leftover">남은 수량 : ${dsProductList.PRODUCT_COUNT} 개</h4>
			</div>
			</div>
			
			<div class="col-md-4" >
				<a href="${context}/work/product/retrieveProduct.do?productCode=${dsProductList.PRODUCT_CODE}">
				<div id="image" class="img-responsive" style='background-image: url("${context}/designImg/s11.png");'></a> 
			</div>
			<div class="col-md-4">
				<h4 id="product-perfume" id="product-perfume-name">제품명 ${dsProductList.PRODUCT_NAME}</h4>
			</div>
			<div class="col-md-4">
				<h4 id="product-perfume-price">${dsProductList.PRODUCT_UNIT_PRICE} 원</h4>
			</div>
			<div class="col-md-4">
				<h4 id="product-perfume-leftover">남은 수량 : ${dsProductList.PRODUCT_COUNT} 개</h4>
			</div>
			</div>
			
						
			<div class="col-md-4" >
				<a href="${context}/work/product/retrieveProduct.do?productCode=${dsProductList.PRODUCT_CODE}">
				<div id="image" class="img-responsive" style='background-image: url("${context}/designImg/s12.png");'></a> 
			</div>
			<div class="col-md-4">
				<h4 id="product-perfume" id="product-perfume-name">제품명 ${dsProductList.PRODUCT_NAME}</h4>
			</div>
			<div class="col-md-4">
				<h4 id="product-perfume-price">${dsProductList.PRODUCT_UNIT_PRICE} 원</h4>
			</div>
			<div class="col-md-4">
				<h4 id="product-perfume-leftover">남은 수량 : ${dsProductList.PRODUCT_COUNT} 개</h4>
			</div>
			</div>
	</div>
		
	</div>
</div> 

<jsp:include page="/common/foot.jsp"></jsp:include>
</body>
<style type="text/css">
.wrap {
	background-color: #fff;
}
/*form 제목*/
.form-horizontal .control-label {
	padding-top: 7px;
	margin-bottom: 8px;
	text-align: inherit !important;
}

/*Writer Text*/
.textbox {
	width: 100%;
	height: 50px;
	border-bottom: 1px solid #b9b9b9;
	padding: 0 40px 0 40px;
}

.title {
	float: left;
	font-size: 12px;
}

.people {
	float: right;
	font-size: 18px;
	font-weight: bold;
}

.subtext {
	width: 100%;
	height: 350px;
	margin: 30px 0 0 0;
	padding: 0 40px 0 40px;
	clear: both;
}
</style>

</html>