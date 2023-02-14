<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var ="context"><%=request.getContextPath()%></c:set>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>구매내역</title>
	<link href="${context}/css/plugins/metisMenu/metisMenu.min.css" rel="stylesheet">
	<!-- 테이블에 dataTables-example 사용시 검색, 페이징처리 됨 -->
	<link href="${context}/css/plugins/dataTables.bootstrap.css" rel="stylesheet">
    <link href="${context}/css/sb-admin-2.css" rel="stylesheet">
	<!-- 테이블 헤더에 sort 표시됨, fontawsome까지 사용 -->
    <link href="${context}/font-awesome-4.4.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="${context}/css/common.css" rel="stylesheet" type="text/css">
	
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
	
	    function fn_review(paramProductCode){
	    	location.href = "${context}/work/product/retrieveProduct.do?productCode=" + paramProductCode;
	    }
    </script>
</head>
<body>
<jsp:include page="${context}/common/top.jsp"></jsp:include>
<!-- title, visual start -->
<div class="titarea" style='background-image: url("${context}/img/subbg_cart.jpg");'>
	<div class="boardText">
		<h3 class="boardTitle">Purchase<br>History</h3>
		<p class="boardSub"></p>
	</div>
</div>
<!-- title, visual end -->
<div class="container">
	<!-- board title, buttons start -->
	<div class="page-header">
		<div class="row">
			<div class="col-xs-8">
				<!-- 한글일 경우 title 클래스만 사용. 영문일 경우 eng 클래스 추가하세요 -->
				<h2 class="title">구매내역</h2>
			</div>
		</div>
	</div>
	<!-- board title, buttons end -->
    <div class="table-responsive">
        <table class="table" id="dataTables-example">
            <thead>
                <tr>
                	<th style="width: 60px;">No</th>
                    <th style="width: 150px;">상품이미지</th>
                    <th style="">상품명</th>
                    <th style="width: 100px;">판매가</th>
                    <th style="width: 100px;">수량</th>
                    <th style="width: 100px;">결제금액</th>
                    <th style="width: 150px;">상품평</th>
                </tr>
            </thead>
            <tbody>
	           	<c:forEach items="${dsBuyList}" var="dsBuyList" varStatus="buyIdx">
	                <tr>
	                	<td style="text-align: center; vertical-align: middle;">${buyIdx.count}</td>
	                	<td style="text-align: center; vertical-align: middle;">
							<img name="image" width="135px" height="120px" src="${context}" class="img-thumbnail">
							<script type="text/javascript">
								var existFolder = '';
								var imageFolder = '';
								var path = '';
								var productCategoryCd = '${dsBuyList.PRODUCT_CATEGORY_CD}';
							
								if(productCategoryCd == 'P'){
								imageFolder = "/perfumeImg/${dsBuyList.PRODUCT_IMAGE}";
								}else if(productCategoryCd == 'D'){
									imageFolder = "/diffuserImg/${dsBuyList.PRODUCT_IMAGE}";
								}
								path = $("img[name='image']").eq('${buyIdx.index}').attr("src");
							
							existFolder = path.split("/")[0];
							$("img[name='image']").eq('${buyIdx.index}').attr("src", path.replace(existFolder, imageFolder));
							</script>
	                    </td>
	                    <td style="vertical-align: middle;">${dsBuyList.PRODUCT_NAME}</td>
	                 	<td style="text-align: center; vertical-align: middle;">${dsBuyList.PRODUCT_UNIT_PRICE}원</td>
	                	<td style="text-align: center; vertical-align: middle;">${dsBuyList.SELL_COUNT}</td>
	                	<td style="text-align: center; vertical-align: middle;">${dsBuyList.SELL_PRICE}원</td>
	                 	<td style="text-align: center; vertical-align: middle;">
	                   		<button type="button" class="btn" onclick="fn_review('${dsBuyList.PRODUCT_CODE}')">상품평쓰기</button>
	                	</td>
	                </tr>
					</c:forEach>
				</tbody>
	       </table>
	   </div>
	   <!-- /.table-responsive -->
</div>
<jsp:include page="${context}/common/foot.jsp"></jsp:include>
</body>
</html>
