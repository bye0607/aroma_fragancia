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
	<title>구매내역</title>

	<link href="${context}/css/bootstrap.min.css" rel="stylesheet">
	<link href="${context}/css/bootstrap-theme.css" rel="stylesheet">
	<link href="${context}/css/plugins/metisMenu/metisMenu.min.css" rel="stylesheet">
	<link href="${context}/css/plugins/dataTables.bootstrap.css" rel="stylesheet">
	<link href="${context}/css/common.css" rel="stylesheet">

    <link href="${context}/css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="${context}/font-awesome-4.4.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
	<script src="${context}/js/jquery-1.9.1.js"></script>
	<script src="${context}/js/bootstrap.min.js"></script>

    <script src="${context}/js/plugins/metisMenu/metisMenu.min.js"></script>

    <script src="${context}/js/plugins/dataTables/jquery.dataTables.js"></script>
    <script src="${context}/js/plugins/dataTables/dataTables.bootstrap.js"></script>

    <script src="${context}/js/sb-admin-2.js"></script>

    <script>
	var existFolder = '';
	var imageFolder = '';
	var path = '';

    $(document).ready(function() {
//         $('#dataTables-example').dataTable();

    });

    function fn_eval(self, resumePassYn, examNo){
   		$.ajax({
   			url:"${context}/work/applicant/updateEvalForResume.do?resumePassYn=" + resumePassYn + "&examNo=" + examNo,
   			success:function(result){
   				result = result.replace(/"/gi, "");
   				self.parent().next().children().html(result);
   			}
   		});
    }

    function fn_selEval(resumePassYn){
		var checked = $("input[name='chkBox']:checked");
		var checkedCnt = $("input[name='chkBox']:checked").length;

		var examNo = "";

		for(var i = 0; i < checkedCnt; i++){
			examNo = checked.eq(i).parent().parent().children("td").eq(3).html();
			$.ajax({
	   			url:"${context}/work/applicant/updateEvalForResume.do?resumePassYn=" + resumePassYn + "&examNo=" + examNo,
	   			async: false,
	   			success:function(result){
	   				result = result.replace(/"/gi, "");
	   				checked.eq(i).parent().parent().children("td").eq(10).html(result);
	   			}
	   		});
		}
    }

    function fn_resumeDetail(self){
    	var examNo = self.parent().parent().children("td").eq(3).html();

    	location.href = "${context}/work/applicant/retrieveResumeDetail.do?examNo=" + examNo;
    }

    function fn_save(){
    	var examNo = '${dsSellList[0].examNo}';

		if(confirm("서류심사를 완료하시겠습니까?")){
			location.href = "${context}/work/incruit/updateIStatusForResume.do?examNo=" + examNo;
		}
    }

    function fn_finalBuy(paramSellCode, paramSellCount, paramProductCode){
		if(confirm("결제하시겠습니까?")){
			location.href = "${context}/work/sell/updateFinalBuy.do?sellCode=" + paramSellCode + "&sellCount=" + paramSellCount + "&productCode=" + paramProductCode;
		}
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
<div class="History_wrap">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
			    <div class="panel ">
			        <!-- /.panel-heading -->
			        <div class="panel-body">
			            <div class="table">
			                <table class="table" id="dataTables-example">
			                    <thead>
			                        <tr>
			                        	<th style="text-align: center; vertical-align: middle; width: 10px;  background: #F5F5F5;">No</th>
			                            <th style="text-align: center; vertical-align: middle; width: 20px;  background: #F5F5F5;">상품이미지</th>
			                            <th style="text-align: center; vertical-align: middle; width: 50px;  background: #F5F5F5;">상품이름</th>
			                            <th style="text-align: center; vertical-align: middle; width: 20px;  background: #F5F5F5;">상품단가</th>
			                            <th style="text-align: center; vertical-align: middle; width: 40px;  background: #F5F5F5;">상품수량</th>
			                            <th style="text-align: center; vertical-align: middle; width: 30px;  background: #F5F5F5;">결제금액</th>
			                            <th style="text-align: center; vertical-align: middle; width: 10px;  background: #F5F5F5;">상품평</th>
			                        </tr>
			                    </thead>
			                    <tbody>
			                    	<c:forEach items="${dsSellList}" var="dsSellList" varStatus="sellIdx">
			                         <tr>
			                         	<td style="text-align: center; vertical-align: middle;">${dsSellList.SELL_CODE}</td>
			                            <td style="text-align: center; vertical-align: middle;">
											<img name="image" width="135px" height="120px" src="${context}/binderImg/${dsSellList.PRODUCT_IMAGE}" class="img-thumbnail">
												<script type="text/javascript">
												 	var productCategoryCd = '${dsSellList.PRODUCT_CATEGORY_CD}';
	
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
													path = $("img[name='image']").eq('${dsProductIdx.index}').attr("src");
	
													existFolder = path.split("/")[2];
													$("img[name='image']").eq('${sellIdx.index}').attr("src", path.replace(existFolder, imageFolder));
												</script>
			                            	</td>
				                            <td style="text-align: center; vertical-align: middle;">${dsSellList.PRODUCT_NAME}</td>
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
			        <!-- /.panel-body -->
			    </div>
			    <!-- /.panel -->
			</div>
			<!-- /.col-lg-12 -->
			<!-- 피그마에는 뒤로가기 버튼이 없어 우선 주석처리 
			<div class="col-md-1 col-md-offset-11">
				<button type="button" class="btn btn-success btn-lg"  style="float:right; background-color: #D9D9D9"; onclick="fn_back()">뒤로가기</button>
				-->
			</div>
		</div>
	</div>
</div>
<jsp:include page="/common/foot.jsp"></jsp:include>
</body>
</html>


