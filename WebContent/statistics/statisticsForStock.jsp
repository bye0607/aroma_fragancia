<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var ="context"><%=request.getContextPath()%></c:set>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="description" content="statisticsForStock.jsp">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>ADMIN - 재고현황/판매현황</title>
    <!-- morris.js 모리스차트 -->
    <link href="${context}/css/morris.css" rel="stylesheet">
	<script src="${context}/js/jquery-1.9.1.js"></script>
    <!-- 툴팁표시 -->
    <script src="${context}/js/raphael.js"></script>
    <!-- morris.js 모리스차트 -->
    <script src="${context}/js/morris.min.js"></script>
    <script>
	var sort;
	var url;

    $(document).ready(function(){
    	var objDonut = JSON.parse('${objDonut}');
    	var objBar = JSON.parse('${objBar}');
    	sort = '${sort}';

    	if('${sort}' != null) $("#sort").val(sort);

    	$("#sort").change(function(){
    		sort = $("#sort").val();

    		if(sort == 'stockP'){
				url = "${context}/work/product/retrieveStatisticsForStock.do?productCategoryCd=P";
    		}else if(sort == 'stockD'){
				url = "${context}/work/product/retrieveStatisticsForStock.do?productCategoryCd=D";
    		}else if(sort == 'sell'){
    			url = "${context}/work/product/retrieveStatisticsForSell.do";
    		}

    		if(sort != 'sell'){
    			location.href = url + "&sort=" + sort;
    		}else if(sort == 'sell'){
    			location.href = url + "?sort=" + sort;
    		}
    	});

    	var color_array = ['#FAB1B2', '#68D4CD', '#94DAFB', '#FD8080', '#26A0FC', '#26E7A6', '#FEBC3B', '#8B75D7', '#CFF67B', '#6D848E'];
        Morris.Donut({
            element: 'donutChart',
            data: objDonut,
            colors: color_array,
            resize: true
        });

        Morris.Bar({
            element: 'barChart',
            data: objBar,
            xkey: 'y',
            ykeys: ['a'],
            labels: ['매출 '],
            barColors: ['#CC947C'],
            hideHover: 'auto',
            resize: true
        });
        if(objDonut.length == 0 || objBar.length == 0){
            //console.log("팬매없음");
            $("#chartarea").html("<h2 class='text-center' style='margin:100px'>판매된 상품이 없습니다.</h2>");
        }
    });

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
				<h2 class="title">재고현황/판매현황</h2>
			</div>
			<div class="col-xs-4 text-right">
			</div>
		</div>
	</div>
	<!-- board title, buttons end -->

	<div class="row">
		<div class="col-md-3">
			<select class="form-control" id="sort" name="sort">
				<option value="stockP">재고현황[PERFUME]</option>
				<option value="stockD">재고현황[DIFFUSER]</option>
				<option value="sell">판매현황</option>
			</select>
		</div>
	</div>
	<div id="chartarea">
	    <div class="row">
			<div class="col-xs-12">
				<div id="donutChart" style="width:100%;height:400px;margin-top:20px"></div>
			</div>
	    </div>
	
		<div class="row">
			<div class="col-xs-12">
				<div id="barChart" style="width:100%;margin-top:30px"></div>
			</div>
	    </div>
    </div>
	<div id="printArea" style="display: none;">
	</div>
</div>
<jsp:include page="${context}/common/foot.jsp"></jsp:include>
</body>
</html>