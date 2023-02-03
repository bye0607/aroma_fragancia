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
	<title>PRODUCT - ${dsProductList[0].PRODUCT_CATEGORY_CD_NM}</title>
	<link href="${context}/css/bootstrap.min.css" rel="stylesheet">
	<link href="${context}/css/bootstrap-theme.css" rel="stylesheet">
	<link href="${context}/css/common.css" rel="stylesheet">
	<script src="${context}/js/jquery-1.9.1.js"></script>
	<script src="${context}/js/bootstrap.min.js"></script>
	<script src="${context}/js/common.js"></script>
	<script type="text/javascript">
		var existFolder = '';
		var imageFolder = '';
		var path = '';
	</script>
</head>
<body>
<jsp:include page="${context}/common/top.jsp"></jsp:include>
<!-- desktop버전  -->
<div class="desktop">
	<div class="img-responsive center-block" style='background-image: url("${context}/backgroundImage/PRODUCT.png");'>
		<div class="boardText1">
			<h3 class="boardTitle1">PRODUCT</h3>
			<p class="boardSub1">${dsProductList[0].PRODUCT_CATEGORY_CD_NM}</p>
		</div>
	</div>
</div>
<!-- mobile버전  -->
<div class="mobile">
	<div class="mobileImg img-responsive center-block" style='background-image: url("${context}/backgroundImage/PRODUCT.png");'>
		<div class="boardText2">
			<h3 class="boardTitle2">PRODUCT</h3>
			<p class="boardSub2">${dsProductList[0].PRODUCT_CATEGORY_CD_NM}</p>
		</div>
	</div>
</div>
<!-- 상품 영역 -->		
	<div class="container productlist">
		<!-- 베스트 셀러 -->
		<!-- board title, buttons start -->
		<div class="page-header">
			<div class="row">
				<div class="col-xs-8">
					<!-- 한글일 경우 title 클래스만 사용. 영문일 경우 eng 클래스 추가하세요 -->
					<h2 class="title eng">베스트 셀러</h2>
				</div>
			</div>
		</div>
		<!-- board title, buttons end -->
			<div class="row">
			<c:forEach items="${dsProductList}" var="dsProductList" varStatus="dsProductIdx">
				<div class="col-sm-12 col-md-6 col-lg-4 productitem">
					<a href="${context}/work/product/retrieveProduct.do?productCode=${dsProductList.PRODUCT_CODE}">
						<img name="image" src="${context}" class="img-responsive">
					</a>
					<h3 class="itemtitle">${dsProductList.PRODUCT_NAME}</h3>
					<h4>${dsProductList.PRODUCT_UNIT_PRICE} 원</h4>
					<h4>남은 수량 : ${dsProductList.PRODUCT_COUNT} 개</h4>
				</div>
				<c:if test="${dsProductIdx.index % 3 == 1}"></c:if>
				<script type="text/javascript">
					var existFolder = '';
					var imageFolder = '';
					var path = '';
				 	var productCategoryCd = '${dsProductList.PRODUCT_CATEGORY_CD}';
				
					if(productCategoryCd == 'P'){
						imageFolder = "/perfumeImg/${dsProductList.PRODUCT_IMAGE}";
					} else if(productCategoryCd == 'D'){
						imageFolder = "/diffuserImg/${dsProductList.PRODUCT_IMAGE}";
					}
					path = $("img[name='image']").eq('${dsProductIdx.index}').attr("src");
				
					// "/"를 기준으로 index가 1인 위치, 즉 2번째 자리에
					existFolder = path.split("/")[0];
					$("img[name='image']").eq('${dsProductIdx.index}').attr("src", path.replace(existFolder, imageFolder));
				</script>
			</c:forEach>
			</div>
	</div>

<jsp:include page="${context}/common/foot.jsp"></jsp:include>
</body>
</html>