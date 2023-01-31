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
</head>


<script type="text/javascript"></script>
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

	<!-- CART_Table start -->
	<div class="History_wrap">
<div class="container">
	<div class="row">
		<div class="col-md-12">
			<div class="panel " >
			    <!-- /.panel-heading -->
			    <div class="panel-body ">
			        <div class="table-responsive ">
			            <table class="table  table-bordered" id="dataTables-example" >
			                <thead>
			                    <tr >
			                        <th style="text-align: center; vertical-align: middle; width: 10px; background: lightgray;">No</th>
			                        <th style="text-align: center; vertical-align: middle; width: 20px; background: lightgray;">상품이미지</th>
			                        <th style="text-align: center; vertical-align: middle; width: 50px; background: lightgray;">상품명</th>
			                        <th style="text-align: center; vertical-align: middle; width: 20px; background: lightgray;">가격</th>
			                    	<th style="text-align: center; vertical-align: middle; width: 30px; background: lightgray;">구매일</th>
			                	</tr>
			                	 <tr>
			                        <th style="text-align: center; vertical-align: middle; width: 10px; background: lightgray;"></th>
			                        <th style="text-align: center; vertical-align: middle; width: 20px; background: lightgray;"><img src="${context}/backgroundImage/delete.png"></th>
			                        <th style="text-align: center; vertical-align: middle; width: 50px; background: lightgray;">상품명</th>
			                        <th style="text-align: center; vertical-align: middle; width: 20px; background: lightgray;">가격</th>
			                        <th style="text-align: center; vertical-align: middle; width: 30px; background: lightgray;">구매일</th>
			                	</tr>
			                	 <tr>
			                        <th style="text-align: center; vertical-align: middle; width: 10px; background: lightgray;"></th>
			                       <th style="text-align: center; vertical-align: middle; width: 20px; background: lightgray;"><img src="${context}/backgroundImage/delete.png"></th>
			                        <th style="text-align: center; vertical-align: middle; width: 50px; background: lightgray;">상품명</th>
			                        <th style="text-align: center; vertical-align: middle; width: 20px; background: lightgray;">가격</th>
			                        <th style="text-align: center; vertical-align: middle; width: 30px; background: lightgray;">구매일</th>
			                	</tr>
			                	 <tr>
			                        <th style="text-align: center; vertical-align: middle; width: 10px; background: lightgray;"></th>
			                        <th style="text-align: center; vertical-align: middle; width: 20px; background: lightgray;"><img src="${context}/backgroundImage/delete.png"></th>
			                        <th style="text-align: center; vertical-align: middle; width: 50px; background: lightgray;">상품명</th>
			                        <th style="text-align: center; vertical-align: middle; width: 20px; background: lightgray;">가격</th>
			                        <th style="text-align: center; vertical-align: middle; width: 30px; background: lightgray;">구매일</th>
			                	</tr>
			            	</thead>
			        	</table>
			    	</div>
				</div>
			</div>
		</div>
	</div>
	</div>
</div>

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
