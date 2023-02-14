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
	<title>구매완료</title>
	<!-- 구매완료창입니다. -->
	<link href="${context}/css/bootstrap.min.css" rel="stylesheet">
	<link href="${context}/css/bootstrap-theme.css" rel="stylesheet">
	<link href="${context}/css/plugins/metisMenu/metisMenu.min.css" rel="stylesheet">
	<link href="${context}/css/plugins/dataTables.bootstrap.css" rel="stylesheet">

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

    function fn_buyList(){
    	location.href = "${context}/work/sell/retrieveBuyList.do";
    }

    function fn_review(paramProductCode){
    	location.href = "${context}/work/product/retrieveProduct.do?productCode=" + paramProductCode;
    }

    </script>
</head>
<body>
<jsp:include page="/common/top.jsp"></jsp:include>
<div class="backgroundImg" style="background-image: url('${context}/img/subbg_sellconfirm.jpg');">

		<div class="sellfirm container" style="margin-bottom: 10%; padding-top: 10%">
			
				<div class="sellsuccess">
					
					<div class="offer-content">
					<br><br><br>
					<img alt="구매완료" class="checkicon" src="${context}/img/icon_check.svg" style="width: 50px; height: 50px;">
						<h1 align="center" style="font-family: Crimson Pro; font-size: 25px">
							<strong>AROMA, FRAGANCIA</strong>를 이용해 주셔서 감사합니다. <br>
							<br>
							주문/결제가 <br>
							정상적으로 완료되었습니다.
						</h1>
						<br><br><br>
						<h2 align="center" style="font-family: Crimson Pro; font-size: 25px">
							기타 궁금하신 사항은 문의주시면 성심껏 답변드리겠습니다.
							<br><br>
						</h2>
					</div>
					<br><br><br><br>
					<div class="col-md-2 col-md-offset-4 sellbttn">
						<button type="button" class="btn btn-lg"  style="float:right;" onclick="fn_buyList()"><span class="glyphicon glyphicon-list-alt"></span>&nbsp;구매내역 확인하기</button>
					</div>
					<div class="col-md-2 sellbttn">
						<button type="button" class="btn btn-lg"  onclick="fn_review('${productCode}')"><span class="glyphicon glyphicon-pencil"></span>&nbsp;상품후기 작성하기</button>
					</div>
					<br><br><br><br><br>
				</div>

			
		

		</div>
	</div>
<jsp:include page="/common/foot.jsp"></jsp:include>
<style type="text/css">
.backgroundImg {
	width: 100%;
	height: 968px;
	
	}
.sellfirm {
	border: none;
	width: 870px;
	height: 560px;
}
.sellsuccess{
	background-color: white;
	font-family: 'Crimson Pro', 'Noto Sans KR', serif, sans-serif;
}
button{
	background-color: #D9D9D9;
}

button:hover{
	background-color: #9CA09F;
}
.checkicon{
 	margin-left: 384px;
 }
@media (max-width: 992px){
	.sellbttn{
		width: 222px;
		margin-bottom: 50px;
		margin-left: 195px;
	}
	
.checkicon{
 	margin-left: 256px;
 }
	.sellsuccess{
		width: 600px;
		height: 630px;
		margin-left: 10%;
}
}
</style>
</body>
</html>