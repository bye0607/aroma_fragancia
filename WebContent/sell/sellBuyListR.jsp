<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var ="context"><%=request.getContextPath()%></c:set>
<meta charset="UTF-8">

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="description" content="sellBuyListR.jsp">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>구매내역 페이지</title>

<link href="${context}/css/bootstrap.min.css" rel="stylesheet">
<link href="${context}/css/bootstrap-theme.css" rel="stylesheet">
<link href="${context}/css/common.css" rel="stylesheet">
<script src="${context}/js/jquery-1.9.1.js"></script>
<script src="${context}/js/bootstrap.min.js"></script>
</head>

    <!-- Custom Fonts -->
    <link href="${context}/font-awesome-4.4.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
	<script src="${context}/js/jquery-1.9.1.js"></script>
	<script src="${context}/js/bootstrap.min.js"></script>
    <script src="${context}/js/plugins/metisMenu/metisMenu.min.js"></script>
    <script src="${context}/js/plugins/dataTables/jquery.dataTables.js"></script>
    <script src="${context}/js/sb-admin-2.js"></script>

    <script>
	var existFolder = '';
	var imageFolder = '';
	var path = '';

    $(document).ready(function() {
        $('#dataTables-example').dataTable();

    });

    function fn_review(paramProductCode){
    	location.href = "${context}/work/product/retrieveProduct.do?productCode=" + paramProductCode;
    }

    </script>
</head>
<body>
<jsp:include page="/common/top.jsp"></jsp:include>
<!-- desktop버전  -->
<div class="desktop">
	<div class="img-responsive center-block" style='background-image: url("${context}/backgroundImage/CART_BACKIMG.jpg");'>
		<div class="boardText1" >
			<h3 class="boardTitle1">Purchase<br>History</h3>
			<h3 class="boardSub1"></h3>
		</div>
	</div>
</div>
<!-- mobile버전  -->
<div class="mobile">
	<div class="mobileImg img-responsive center-block" style='background-image: url("${context}/backgroundImage/CART_BACKIMG.jpg");'>
		<div class="boardText2" >
			<h3 class="boardTitle2">Purchase<br>History</h3>
			<h3class="boardSub2">History</h3>
		</div>
	</div>
</div>

		<div class="row">
			<div class="col-md-12">
			    <div class="panel panel-default">
			        <!-- /.panel-heading -->
			        <div class="panel-body">
			            <div class="table-responsive">
			                <table class="table  table-bordered" id="dataTables-example">
			                    <thead>
			                        <tr>
			                        	<th style="text-align: center; vertical-align: middle; width: 10px;  background: lightgray;">No</th>
			                            <th style="text-align: center; vertical-align: middle; width: 20px;  background: lightgray;">상품이미지</th>
			                            <th style="text-align: center; vertical-align: middle; width: 50px;  background: lightgray;">상품이름</th>
			                            <th style="text-align: center; vertical-align: middle; width: 20px;  background: lightgray;">상품단가</th>
			                            <th style="text-align: center; vertical-align: middle; width: 40px;  background: lightgray;">상품수량</th>
			                            <th style="text-align: center; vertical-align: middle; width: 30px;  background: lightgray;">결제금액</th>
			                            <th style="text-align: center; vertical-align: middle; width: 10px;  background: lightgray;">상품평</th>
			                        </tr>
			                    </thead>
			                    <tbody>
			                    	<c:forEach items="${dsBuyList}" var="dsBuyList" varStatus="buyIdx">
			                         <tr>
			                         	<td style="text-align: center; vertical-align: middle;">${buyIdx.count}</td>
			                            <td style="text-align: center; vertical-align: middle;">
										<img name="image" width="110px" height="110px" src="${context}/binderImg/${dsBuyList.PRODUCT_IMAGE}" class="img-thumbnail">
											<script type="text/javascript">
											 	var productCategoryCd = '${dsBuyList.PRODUCT_CATEGORY_CD}';

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
												path = $("img[name='image']").eq('${buyIdx.index}').attr("src");

												existFolder = path.split("/")[2];
												$("img[name='image']").eq('${buyIdx.index}').attr("src", path.replace(existFolder, imageFolder));
											</script>
			                            </td>
			                            <td style="text-align: center; vertical-align: middle;">${dsBuyList.PRODUCT_NAME}</td>
			                            <td style="text-align: center; vertical-align: middle;">${dsBuyList.PRODUCT_UNIT_PRICE}원</td>
			                            <td style="text-align: center; vertical-align: middle;">${dsBuyList.SELL_COUNT}</td>
			                            <td style="text-align: center; vertical-align: middle;">${dsBuyList.SELL_PRICE}원</td>
			                            <td style="text-align: center; vertical-align: middle;">
			                            	<button type="button" class="btn btn-warning" onclick="fn_review('${dsBuyList.PRODUCT_CODE}')">상품평 쓰러가기</button>
			                            </td>
			                         </tr>
			                        </c:forEach>
			                    </tbody>
			                </table>
			            </div>
			            <!-- /.table-responsive -->
			        </div>
			        <!-- /.panel-body -->
			    </div>
			    <!-- /.panel -->
			</div>
			<!-- /.col-lg-12 -->
			<div class="col-md-1 col-md-offset-11">
				<button type="button" class="btn btn-success btn-lg"  style="float:right;" onclick="fn_back()">뒤로가기</button>
			</div>
		</div>
	</div>
</html>
<jsp:include page="/common/foot.jsp"></jsp:include>
	
	<!-- CART_Table end -->
</body>
<style type="text/css">

/*board table css*/
#dataTables-example{
margin-bottom: 10%;
margin-top: 10%;
}	
/*배경색 적용 */
.History_wrap{
background-color: #fff;}



</style>