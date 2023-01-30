<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var ="context"><%=request.getContextPath()%></c:set>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ESHOP 쇼핑몰 프로그램</title>
<link href="${context}/css/bootstrap.min.css" rel="stylesheet">
<link href="${context}/css/bootstrap-theme.css" rel="stylesheet">
<link href="${context}/css/common.css" rel="stylesheet">
<script src="${context}/js/jquery-1.9.1.js"></script>
<script src="${context}/js/bootstrap.min.js"></script>
<script src="${context}/js/common.js"></script>
<style type="text/css">
li{
	cursor: pointer;
}
a{
	text-decoration:none !important;
}
</style>
</head>


<c:set var="homeUrl">${context}/work/product/goMain.do</c:set>
<c:set var="loginUrl">${context}/user/login.jsp</c:set>

<c:set var="officeUrl">${context}/work/product/retrieveProductList.do?category=O</c:set>
<c:set var="penUrl">${context}/work/product/retrieveProductList.do?category=P</c:set>
<c:set var="binderUrl">${context}/work/product/retrieveProductList.do?category=B</c:set>
<c:set var="designUrl">${context}/work/product/retrieveProductList.do?category=D</c:set>
<c:set var="storageUrl">${context}/work/product/retrieveProductList.do?category=S</c:set>
<body>
	<nav class="navbar-expand-lg" role="navigation" style="background-color: rgb(225, 225, 227);">
		<div class="container">
			<br>
			<ul class="nav navbar-nav" >
				<li class="n1"><a href="${homeUrl}"><font color="black" ><strong>AROMA FRAGANCIA</strong></font></a></li>
			</ul>
		<br>
		<ul class="nav navbar-nav navbar-right">
		<li>
					<c:if test="${sessionScope.id == null}">
						<a href="${context}/work/user/createUser.do"><font color="black"><strong>회원가입</strong></font></a>
					</c:if>
					<c:if test="${sessionScope.id != null && sessionScope.grade != 'A'}">
						<a href="${context}/work/user/updateUser.do"><font color="black"><strong>정보수정</strong></font></a>
					</c:if>
					<c:if test="${sessionScope.id != null && sessionScope.grade == 'A'}">
						<a href="${context}/work/product/retrieveStatisticsForStock.do?productCategoryCd=P"><font color="black"><strong>재고현황</strong></font></a>
					</c:if>
				</li>
				<li>
					<c:if test="${sessionScope.id == null}">
						<a href="${context}/user/login.jsp"><font color="black"><strong>LOGIN</strong></font></a>
					</c:if>
					<c:if test="${sessionScope.id != null}">
						<a href="${context}/work/user/logout.do"><font color="black"><strong>LOGOUT</strong></font></a>
					</c:if>
				</li>
				</ul>
		<ul class="nav navbar-nav navbar-right">
	        <li class="dropdown">
	        <!-- 비회원 가능 -->
	          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">PRODUCT <span class="caret"></span></a>
	          <ul class="dropdown-menu">
				<li><a onclick="javascript:fn_isLogin('${penUrl}')" style="color: black; font-size: 15px;">PERFUMS</a></li>
			    <li><a onclick="javascript:fn_isLogin('${officeUrl}')" style="color: black; font-size: 15px;">DIFFUSER</a></li>

	          </ul>
	        </li>
	        <!-- 비회원 가능 -->
	        <li><a class="ddt" href="#">RESERVATION</a></li>
	        
	        <li class="dropdown">
	        <!-- 회원, 관리자만 가능 -->
	          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">SERVICE <span class="caret"></span></a>
	          <ul class="dropdown-menu">
				<li><a onclick="javascript:fn_isLogin('${sessionScope.userCode}','${loginUrl}','${penUrl}')" style="color: black; font-size: 15px;">NOTICE</a></li>
			    <li><a onclick="javascript:fn_isLogin('${sessionScope.userCode}','${loginUrl}','${officeUrl}')" style="color: black; font-size: 15px;">COMMUNITY</a></li>
			    <li><a onclick="javascript:fn_isLogin('${sessionScope.userCode}','${loginUrl}','${storageUrl}')" style="color: black; font-size: 15px;">BOARD</a></li>
			    <li><a onclick="javascript:fn_isLogin('${sessionScope.userCode}','${loginUrl}','${binderUrl}')" style="color: black; font-size: 15px;">FAQ</a></li>
	          </ul>
	        </li>
	        <li class="dropdown">
				<c:if test="${sessionScope.id != null && sessionScope.grade != 'A'}">
		          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">MY PAGE <span class="caret"></span></a>
		          <ul class="dropdown-menu">
				    <li><a onclick="javascript:fn_isLogin('${sessionScope.userCode}','${loginUrl}','${officeUrl}')" style="color: black; font-size: 15px;">PURCHASE HISTORY</a></li>
				    <li><a onclick="javascript:fn_isLogin('${sessionScope.userCode}','${loginUrl}','${storageUrl}')" style="color: black; font-size: 15px;">EDIT PROFILE</a></li>
		          </ul>
				</c:if>
	        </li>
      			<li>
					<c:if test="${sessionScope.id != null && sessionScope.grade != 'A'}">
						<a href="${context}/work/cart/retrieveCartList.do"><font color="black"><strong>장바구니</strong></font></a>
					</c:if>
					<c:if test="${sessionScope.id != null && sessionScope.grade == 'A'}">
						<a href="${context}/work/product/retrieveProductListForManage.do"><font color="black"><strong>재고관리</strong></font></a>
					</c:if>
				</li>
				<li>
					<c:if test="${sessionScope.id != null && sessionScope.grade != 'A'}">
						<a href="${context}/work/sell/retrieveBuyList.do"><font color="black"><strong>구매내역</strong></font></a>
					</c:if>
					<c:if test="${sessionScope.id != null && sessionScope.grade == 'A'}">
						<a href="${context}/work/sell/retrieveStatisticsForProduct.do"><font color="black"><strong>매출통계</strong></font></a>
					</c:if>
				</li>
				
			</ul>
		</div>
			</nav>
	
	

		<div class= "container" style="background-color: white;">
	  	<c:if test="${sessionScope.id != null && sessionScope.grade == 'A'}">
	  		<p style="font-size: 70px;"><a href="${context}/work/product/goMain.do" style="color: black;"><b>HS STATIONERY</b></a></p>
	  		<h1>관리자 모드입니다.</h1>
	  	</c:if>
	</div>
</body>
</html>