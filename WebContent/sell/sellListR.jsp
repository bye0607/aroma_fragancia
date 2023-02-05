<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var ="context"><%=request.getContextPath()%></c:set>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="description" content="sellListR.jsp">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>주문/결제</title>
	<link href="${context}/css/bootstrap.min.css" rel="stylesheet">
	<link href="${context}/css/common.css" rel="stylesheet">
	<script src="${context}/js/jquery-1.9.1.js"></script>
	<script src="${context}/js/common.js"></script>
	<!-- 아임포트 결제 CDN 연동 -->
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
    <script>
	var existFolder = '';
	var imageFolder = '';
	var path = '';

    function fn_finalBuy(paramSellCode, paramSellCount, paramProductCode){
		if(confirm("결제하시겠습니까?")){
			location.href = "${context}/work/sell/updateFinalBuy.do?sellCode=" + paramSellCode + "&sellCount=" + paramSellCount + "&productCode=" + paramProductCode;
		}
    }
    </script>
</head>
<body>
<jsp:include page="${context}/common/top.jsp"></jsp:include>
<!-- desktop버전  -->
<div class="desktop">
	<div class="img-responsive center-block" style='background-image: url("${context}/backgroundImage/CART_BACKIMG.jpg");'>
		<div class="boardText1" >
			<h3 class="boardTitle1">Order and Pay</h3>
			<h3 class="boardSub1">주문/결제</h3>
		</div>
	</div>
</div>
<!-- mobile버전  -->
<div class="mobile">
	<div class="mobileImg img-responsive center-block" style='background-image: url("${context}/backgroundImage/CART_BACKIMG.jpg");'>
		<div class="boardText2" >
			<h3 class="boardTitle2">Order and Pay</h3>
			<h3 class="boardSub2">주문/결제</h3>
		</div>
	</div>
</div>
	<div class="container">
        <div class="table-responsive">
            <table class="table" id="dataTables-example">
                <thead>
                    <tr>
                        <th colspan="2" style="text-align: center; vertical-align: middle; background: #F5F5F5;">상품정보</th>
                        <th style="width:150px;text-align: center; vertical-align: middle; background: #F5F5F5;">판매가</th>
                        <th style="width:100px;text-align: center; vertical-align: middle; background: #F5F5F5;">수량</th>
                        <th style="width:150px;text-align: center; vertical-align: middle; background: #F5F5F5;">결제금액</th>
                        <th style="width:150px;text-align: center; vertical-align: middle; background: #F5F5F5;">구매하기</th>
                    </tr>
                </thead>
                <tbody>
                	<c:forEach items="${dsSellList}" var="dsSellList" varStatus="sellIdx">
                     <tr>
                        <td style="width:150px;text-align: center;">
							<img name="image" width="135px" height="120px" src="${context}" class="img-thumbnail">
							<script type="text/javascript">
								var existFolder = '';
								var imageFolder = '';
								var path = '';
							 	var productCategoryCd = '${dsSellList.PRODUCT_CATEGORY_CD}';
		
							 	if(productCategoryCd == 'P'){
									imageFolder = "/perfumeImg/${dsSellList.PRODUCT_IMAGE}";
								}else if(productCategoryCd == 'D'){
									imageFolder = "/diffuserImg/${dsSellList.PRODUCT_IMAGE}";
								}
								path = $("img[name='image']").eq('${dsProductIdx.index}').attr("src");
		
								existFolder = path.split("/")[0];
								$("img[name='image']").eq('${sellIdx.index}').attr("src", path.replace(existFolder, imageFolder));
							</script>
                       	</td>
                         <td style="vertical-align: middle;">${dsSellList.PRODUCT_NAME}</td>
                         <td style="text-align: center; vertical-align: middle;">${dsSellList.PRODUCT_UNIT_PRICE}원</td>
                         <td style="text-align: center; vertical-align: middle;">${dsSellList.SELL_COUNT}</td>
                         <td style="text-align: center; vertical-align: middle;">${dsSellList.SELL_PRICE}원</td>
                         <td style="text-align: center; vertical-align: middle;">
                       		<button type="button" class="btn" id="cartbtn1" onclick="fn_finalBuy('${dsSellList.SELL_CODE}', '${dsSellList.SELL_COUNT}', '${dsSellList.PRODUCT_CODE}')"">구매하기</button>
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


