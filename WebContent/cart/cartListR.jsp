<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var ="context"><%=request.getContextPath()%></c:set>
<meta charset="UTF-8">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>장바구니</title>
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
	<!-- 아임포트 결제 CDN 연동 -->
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
    <script>
	    $(document).ready(function() {
	        $('#dataTables-example').dataTable();
	    });
	
	    function fn_buy(paramCartCode, paramProductCode, paramSellPrice, paramSellCount){
	    	/* if(confirm("구매하시겠습니까?")){
	    		location.href = "${context}/work/sell/createSell.do?productCode=" + paramProductCode + "&sellPrice=" + paramSellPrice + "&sellCount=" + paramSellCount + "&cartCode=" + paramCartCode + "&fromCart=true";
	    	} */
	    	if(confirm("결제하시겠습니까?")){
	    		var IMP = window.IMP;  
			    IMP.init("imp02022011");  // IMP.init( ) 메서드 가맹점코드 수정 바랍니다.
			    IMP.request_pay({
			        pg : 'html5_inicis', // version 1.1.0부터 지원.
			        pay_method : 'card',
			        merchant_uid : 'order_' + new Date().getTime(),
			        name : '${dsCartList[0].PRODUCT_NAME}',
			        amount : '${dsCartList[0].CART_PRICE}',
			        //amount : 10,
			        //buyer_email : '${dsCartList[0].EMAIL}',
			        //////////////////////////////////////////// 결제테스트시 메일주소 변경요망 //////////////////////////////////////////////////////
			        buyer_email : 'bye0607@gmail.com',
			        buyer_name : '${dsCartList[0].NAME}(${dsCartList[0].ID})',
			        buyer_tel : '${dsCartList[0].PHONE_CD}' + '-' + '${dsCartList[0].PHONE_NUM}',
			        buyer_addr : '${dsCartList[0].ADDRESS}',
			        buyer_postcode : '${dsCartList[0].POST_NUM}',
			        m_redirect_url : "${context}/work/sell/createSell.do?productCode=" + paramProductCode + "&sellPrice=" + paramSellPrice + "&sellCount=" + paramSellCount + "&cartCode=" + paramCartCode + "&fromCart=true"
			    }, function(rsp) {
			        if ( rsp.success ) {
			            var msg = '결제가 완료되었습니다.';
			            msg += '\n고유ID : ' + rsp.imp_uid;
			            msg += '\n상점 거래ID : ' + rsp.merchant_uid;
			            msg += '\n결제 금액 : ' + rsp.paid_amount;
			            msg += '\n카드 승인번호 : ' + rsp.apply_num;
				        alert(msg);
			    		location.href = "${context}/work/sell/createSell.do?productCode=" + paramProductCode + "&sellPrice=" + paramSellPrice + "&sellCount=" + paramSellCount + "&cartCode=" + paramCartCode + "&fromCart=true";
			        } else {
			            var msg = '결제에 실패하였습니다.';
			            msg += '\n에러내용 : ' + rsp.error_msg;
				        alert(msg);
			        }
			    });	
	    	}
	    }
	
	    function fn_delete(paramCartCode, paramProductCode, paramSellCount){
	    	if(confirm("정말로 삭제하시겠습니까?")){
		    	location.href = "${context}/work/cart/deleteCart.do?cartCode=" + paramCartCode + "&productCode=" + paramProductCode + "&productCount=" + paramSellCount;
	    	}
	    }
    </script>
</head>
<body>
<jsp:include page="${context}/common/top.jsp"></jsp:include>
<!-- title, visual start -->
<div class="titarea" style='background-image: url("${context}/img/subbg_cart.jpg");'>
	<div class="boardText">
		<h3 class="boardTitle">CART</h3>
		<p class="boardSub">장바구니</p>
	</div>
</div>
<!-- title, visual end -->
<div class="container">
	<!-- board title, buttons start -->
	<div class="page-header">
		<div class="row">
			<div class="col-xs-8">
				<!-- 한글일 경우 title 클래스만 사용. 영문일 경우 eng 클래스 추가하세요 -->
				<h2 class="title">장바구니</h2>
			</div>
		</div>
	</div>
	<!-- board title, buttons end -->
	<div class="table-responsive">
		<table class="table" id="dataTables-example" >
			<thead>
             	<tr>
                	<th style="width: 60px;">No</th>
                    <th style="width: 150px;">상품이미지</th>
                    <th style="">상품명</th>
                    <th style="width: 100px;">판매가</th>
                    <th style="width: 100px;">수량</th>
                    <th style="width: 100px;">결제금액</th>
				    <th style="width: 150px;">구매 / 삭제</th>
				</tr>
			</thead>
	        	<tbody>
	        		<c:forEach items="${dsCartList}" var="dsCartList" varStatus="cartIdx">
	             	<tr>
	             		<td style="text-align: center; vertical-align: middle;">${cartIdx.count}</td>
	                	<td style="text-align: center; vertical-align: middle;">
							<a href="${context}/work/product/retrieveProduct.do?productCode=${dsCartList.PRODUCT_CODE}">
							<img name="image" width="135px" height="120px" src="${context}" class="img-thumbnail">
							</a>
							<script type="text/javascript">
								var existFolder = '';
								var imageFolder = '';
								var path = '';
							 	var productCategoryCd = '${dsCartList.PRODUCT_CATEGORY_CD}';
							
							 	if(productCategoryCd == 'P'){
									imageFolder = "/perfumeImg/${dsCartList.PRODUCT_IMAGE}";
									}else if(productCategoryCd == 'D'){
										imageFolder = "/diffuserImg/${dsCartList.PRODUCT_IMAGE}";
									}
								path = $("img[name='image']").eq('${cartIdx.index}').attr("src");
							
								existFolder = path.split("/")[0];
								$("img[name='image']").eq('${cartIdx.index}').attr("src", path.replace(existFolder, imageFolder));
							</script>
	                   	</td>
	                   	<td style="vertical-align: middle;">${dsCartList.PRODUCT_NAME}</td>
	                	<td style="text-align: center; vertical-align: middle;">${dsCartList.PRODUCT_UNIT_PRICE}원</td>
	                	<td style="text-align: center; vertical-align: middle;">${dsCartList.CART_COUNT}</td>
	                	<td style="text-align: center; vertical-align: middle;">${dsCartList.CART_PRICE}원</td>
	               		<td style="text-align: center; vertical-align: middle;">
	                		<button type="button" class="btn" onclick="fn_buy('${dsCartList.CART_CODE}', '${dsCartList.PRODUCT_CODE}', '${dsCartList.CART_PRICE}', '${dsCartList.CART_COUNT}')"style="margin-bottom: 1%">구매하기</button>
	                		<button type="button" class="btn" onclick="fn_delete('${dsCartList.CART_CODE}', '${dsCartList.PRODUCT_CODE}', '${dsCartList.CART_COUNT}')" style="margin-bottom: 1%">삭제</button>
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