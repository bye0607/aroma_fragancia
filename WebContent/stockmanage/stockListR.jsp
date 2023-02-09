<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var ="context"><%=request.getContextPath()%></c:set>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="description" content="stockListR.jsp">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>ADMIN - 재고관리</title>
	<link href="${context}/css/plugins/metisMenu/metisMenu.min.css" rel="stylesheet">
	<!-- 테이블에 dataTables-example 사용시 검색, 페이징처리 됨 -->
	<link href="${context}/css/plugins/dataTables.bootstrap.css" rel="stylesheet">
    <link href="${context}/css/sb-admin-2.css" rel="stylesheet">
	<!-- 테이블 헤더에 sort 표시됨, fontawsome까지 사용 -->
    <link href="${context}/font-awesome-4.4.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
	
	<script src="${context}/js/jquery-1.9.1.js"></script>

	<!-- 테이블 헤더에 sort 표시됨 -->
    <script src="${context}/js/plugins/metisMenu/metisMenu.min.js"></script>
    <script src="${context}/js/sb-admin-2.js"></script>
    
	<!-- 테이블에 dataTables-example 사용시 검색, 페이징처리 됨 -->
    <script src="${context}/js/plugins/dataTables/jquery.dataTables.js"></script>
    <script src="${context}/js/plugins/dataTables/dataTables.bootstrap.js"></script>
    <script>
	    $(document).ready(function() {
	        $('#dataTables-example').DataTable();
	    });
	
	    function fn_modifyProduct(paramProductCode){
			location.href = "${context}/work/product/updateProduct.do?productCode=" + paramProductCode;
	    }
	
	    function fn_createProduct(){
			location.href = "${context}/work/product/createProduct.do";
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
				<h2 class="title">재고관리</h2>
			</div>
			<div class="col-xs-4 text-right">
				<button type="button" class="btn btn-lg boardbtn" onclick="fn_createProduct()">상품등록</button>
			</div>
		</div>
	</div>
	<!-- board title, buttons end -->
    <div class="table-responsive">
        <table class="table" id="dataTables-example">
            <thead>
                <tr>
                	<th style="width:150px;">상품번호</th>
                       <th style="width: 150px;">상품이미지</th>
                   	<th style="">상품명</th>
                    <th style="width:150px;">판매가</th>
                    <th style="width:100px;">재고</th>
                    <th style="width:100px;">수정</th>
                </tr>
            </thead>
            <tbody>
            	<c:forEach items="${dsProductList}" var="dsProductList" varStatus="productIdx">
                 <tr>
                 	<td style="text-align: center; vertical-align: middle;">${dsProductList.PRODUCT_CODE}</td>
                    <td style="width:150px;text-align: center;">
						<img name="image" width="135px" height="120px" src="${context}" class="img-thumbnail">
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
						 	
							path = $("img[name='image']").eq('${productIdx.index}').attr("src");
						
							existFolder = path.split("/")[0];
							$("img[name='image']").eq('${productIdx.index}').attr("src", path.replace(existFolder, imageFolder));
						</script>
                    </td>
                    <td style="vertical-align: middle;">[${dsProductList.PRODUCT_CATEGORY_CD_NM}]<br>${dsProductList.PRODUCT_NAME}</td>
                    <td style="text-align: center; vertical-align: middle;">${dsProductList.PRODUCT_UNIT_PRICE}원</td>
                    <td style="text-align: center; vertical-align: middle;">${dsProductList.PRODUCT_COUNT}</td>
                    <td style="text-align: center; vertical-align: middle;">
                    	<button type="button" class="btn" onclick="fn_modifyProduct('${dsProductList.PRODUCT_CODE}')">수정</button>
                    </td>
                 </tr>
                </c:forEach>
            </tbody>
        </table>
	</div>
</div>
<jsp:include page="${context}/common/foot.jsp"></jsp:include>
</body>
</html>