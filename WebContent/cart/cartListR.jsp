<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var ="context"><%=request.getContextPath()%></c:set>
<meta charset="UTF-8">

<title>구매내역 페이지</title>
<link href="${context}/css/bootstrap.min.css" rel="stylesheet">
<link href="${context}/css/bootstrap-theme.css" rel="stylesheet">
<link href="${context}/css/common.css" rel="stylesheet">
<script src="${context}/js/jquery-1.9.1.js"></script>
<script src="${context}/js/bootstrap.min.js"></script>
<script src="${context}/js/plugins/dataTables/jquery.dataTables.js"></script>
<script src="${context}/js/plugins/metisMenu/metisMenu.min.js"></script>
<script src="${context}/js/sb-admin-2.js"></script>
<script src="${context}/js/plugins/dataTables/jquery.dataTables.js"></script>
<script src="${context}/js/plugins/dataTables/dataTables.bootstrap.js"></script>
</head>


<script type="text/javascript"></script>



    <script>
	var existFolder = '';
	var imageFolder = '';
	var path = '';

    $(document).ready(function() {
        $('#dataTables-example').dataTable();

    });

    function fn_buy(paramCartCode, paramProductCode, paramSellPrice, paramSellCount){
    	if(confirm("구매하시겠습니까?")){
    		location.href = "${context}/work/sell/createSell.do?productCode=" + paramProductCode + "&sellPrice=" + paramSellPrice + "&sellCount=" + paramSellCount + "&cartCode=" + paramCartCode + "&fromCart=true";
    	}
    }

    function fn_delete(paramCartCode, paramProductCode, paramSellCount){
    	if(confirm("정말로 삭제하시겠습니까?")){
	    	location.href = "${context}/work/cart/deleteCart.do?cartCode=" + paramCartCode + "&productCode=" + paramProductCode + "&productCount=" + paramSellCount;
    	}
    }

    </script>

<body>
<jsp:include page="/common/top.jsp"></jsp:include>
<!-- desktop버전  -->
<div class="desktop">
	<div class="img-responsive center-block" style='background-image: url("${context}/backgroundImage/CART_BACKIMG.jpg");'>
		<div class="boardText1" >
			<h3 class="boardTitle1">CART</h3>
			<p class="boardSub1">장바구니</p>
		</div>
	</div>
</div>
<!-- mobile버전  -->
<div class="mobile">
	<div class="mobileImg img-responsive center-block" style='background-image: url("${context}/backgroundImage/CART_BACKIMG.jpg");'>
		<div class="boardText2" >
			<h3 class="boardTitle2">CART</h3>
			<p class="boardSub2">장바구니</p>
		</div>
	</div>
</div>

	<!-- CART_Table start -->
<div class="cart_wrap">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="panel" >
				    <!-- /.panel-heading -->
				    <div class="panel-body">
				        <div class="table">
				            <table class="table" id="dataTables-example" >
							  <thead>
			                	<tr>
				                  <th style="text-align: center; vertical-align: middle; width: 10px;background: #F5F5F5;">No</th>
				                   <th style="text-align: center; vertical-align: middle; width: 20px;background: #F5F5F5;">상품이미지</th>
				                   <th style="text-align: center; vertical-align: middle; width: 50px;background: #F5F5F5;">상품이름</th>
				                   <th style="text-align: center; vertical-align: middle; width: 20px;background: #F5F5F5;">상품단가</th>
				                   <th style="text-align: center; vertical-align: middle; width: 40px;background: #F5F5F5;">상품수량</th>
				                   <th style="text-align: center; vertical-align: middle; width: 30px;background: #F5F5F5;">결제금액</th>
				                   <th style="text-align: center; vertical-align: middle; width: 30px;background: #F5F5F5;">구매 / 삭제</th>
			                 	</tr>
			                    	</thead>
			                    	<tbody>
			                    		<c:forEach items="${dsCartList}" var="dsCartList" varStatus="cartIdx">
			                         	<tr>
			                         		<td style="text-align: center; vertical-align: middle;">${cartIdx.count}</td>
			                            	<td style="text-align: center; vertical-align: middle;">
												<a href="${context}/work/product/retrieveProduct.do?productCode=${dsCartList.PRODUCT_CODE}">
													<img name="image" width="110px" height="110px" src="${context}/binderImg/${dsCartList.PRODUCT_IMAGE}" class="img-thumbnail">
												</a>
												<script type="text/javascript">
												 	var productCategoryCd = '${dsCartList.PRODUCT_CATEGORY_CD}';
	
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
													path = $("img[name='image']").eq('${cartIdx.index}').attr("src");
	
													existFolder = path.split("/")[2];
													$("img[name='image']").eq('${cartIdx.index}').attr("src", path.replace(existFolder, imageFolder));
												</script>
			                            	</td>
			                            	<td style="text-align: center; vertical-align: middle;">${dsCartList.PRODUCT_NAME}</td>
			                            	<td style="text-align: center; vertical-align: middle;">${dsCartList.PRODUCT_UNIT_PRICE}원</td>
			                            	<td style="text-align: center; vertical-align: middle;">${dsCartList.CART_COUNT}</td>
			                            	<td style="text-align: center; vertical-align: middle;">${dsCartList.CART_PRICE}원</td>
			                           		<td style="text-align: center; vertical-align: middle;">
			                            		<button type="button" class="btn" onclick="fn_buy('${dsCartList.CART_CODE}', '${dsCartList.PRODUCT_CODE}', '${dsCartList.CART_PRICE}', '${dsCartList.CART_COUNT}')">구매</button>
			                            		<button type="button" class="btn" onclick="fn_delete('${dsCartList.CART_CODE}', '${dsCartList.PRODUCT_CODE}', '${dsCartList.CART_COUNT}')">삭제</button>
			                        	    </td>
			                    	     </tr>
			                        </c:forEach>
			            		</tbody>
			                </table>
			    		</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
	
	<!-- CART_Table end -->
</body>


<jsp:include page="/common/foot.jsp"></jsp:include>