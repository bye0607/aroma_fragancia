<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var ="context"><%=request.getContextPath()%></c:set>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no" />
	<title>AROMA, FRAGANCIA</title>
	<link href="${context}/css/bootstrap.min.css" rel="stylesheet">
	<link href="${context}/css/bootstrap-theme.css" rel="stylesheet">
	<link href="${context}/css/common.css" rel="stylesheet">
	<script src="${context}/js/bootstrap.min.js"></script>
	<script src="${context}/js/common.js"></script>
</head>

<!-- URL 추가 -->
<c:set var="homeUrl">${context}/work/product/goMain.do</c:set>
<c:set var="loginUrl">${context}/user/login.jsp</c:set>

<c:set var="visitUrl">${context}/work/board/reservation.do</c:set>
<c:set var="noitceUrl">${context}/work/board/notice.do</c:set>
<c:set var="cmmuUrl">${context}/work/board/community.do</c:set>
<c:set var="boardUrl">${context}/work/board/board.do</c:set>
<c:set var="FAQUrl">${context}/FAQ/FAQ.jsp</c:set>

<c:set var="perfumeUrl">${context}/work/product/retrieveProductList.do?category=P</c:set>
<c:set var="diffuserUrl">${context}/work/product/retrieveProductList.do?category=D</c:set>

<body>
    <nav class="navbar navbar-default navbar-fixed-top" >
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="${homeUrl}">AROMA FRAGANCIA</a>
        </div>
      	 
        <div id="navbar" class="collapse navbar-collapse">
          <ul class="nav navbar-nav navbar-right member">
			<li>
				<c:if test="${sessionScope.id == null}">
					<a href="${context}/work/user/createUser.do">SIGN UP</a>
				</c:if>
				<c:if test="${sessionScope.id != null && sessionScope.grade != 'A'}">
					<a href="${context}/work/cart/retrieveCartList.do">CART</a>
				</c:if>
			</li>
			<li>
				<c:if test="${sessionScope.id == null}">
					<a href="${context}/user/login.jsp">LOGIN</a>
				</c:if>
				<c:if test="${sessionScope.id != null}">
					<a href="${context}/work/user/logout.do">LOGOUT</a>
				</c:if>
			</li>
          </ul>
			<ul class="nav navbar-nav navbar-right">
	        <!--  링크 수정  -->
	        <li class="dropdown">
	          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">PRODUCT <span class="caret"></span></a>
	          <ul class="dropdown-menu">
				<li><a onclick="javascript:fn_isLogin('${sessionScope.userCode}','${loginUrl}','${perfumeUrl}')">PERFUMS</a></li>
			    <li><a onclick="javascript:fn_isLogin('${sessionScope.userCode}','${loginUrl}','${diffuserUrl}')">DIFFUSER</a></li>

	          </ul>
	        </li>
	        
	        <!-- 회원, 관리자만 가능 -->
	        <li><a href="#" onclick="javascript:fn_isLogin('${sessionScope.userCode}','${loginUrl}','${visitUrl}')">RESERVATION</a></li>
	        
	        <li class="dropdown">
	          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">SERVICE <span class="caret"></span></a>
	          <ul class="dropdown-menu">
				<li><a onclick="javascript:fn_isLogin('${sessionScope.userCode}','${loginUrl}','${noitceUrl}')">NOTICE</a></li>
			    <li><a onclick="javascript:fn_isLogin('${sessionScope.userCode}','${loginUrl}','${cmmuUrl}')">COMMUNITY</a></li>
			    <li><a onclick="javascript:fn_isLogin('${sessionScope.userCode}','${loginUrl}','${boardUrl}')">BOARD</a></li>
			    <li><a href="${FAQUrl}">FAQ</a></li>
	          </ul>
	        </li>
	        <li class="dropdown">
				<c:if test="${sessionScope.id != null && sessionScope.grade != 'A'}">
		          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">MY PAGE <span class="caret"></span></a>
		          <ul class="dropdown-menu">
				    <li><a href="${context}/work/sell/retrieveBuyList.do">PURCHASE HISTORY</a></li>
					
				    <li><a href="${context}/work/user/updateUser.do">EDIT PROFILE</a></li>
		          </ul>
				</c:if>
	        </li>
      			<li class="dropdown">
					<c:if test="${sessionScope.id != null && sessionScope.grade == 'A'}">
			          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">관리자 메뉴<span class="caret"></span></a>
			          <ul class="dropdown-menu">
			          	<li><a href="${context}/work/user/updateUser.do">EDIT PROFILE</a></li>
						<li><a href="${context}/work/product/retrieveProductListForManage.do">재고관리</a></li>
						<li><a href="${context}/work/sell/retrieveStatisticsForProduct.do">매출통계</a></li>
						<li><a href="${context}/work/product/retrieveStatisticsForStock.do?productCategoryCd=P">재고현황</a></li>
			          </ul>
					</c:if>
				</li>
			</ul>
        </div><!--/.nav-collapse -->
      </div>
    </nav>

	<div class= "container" style="margin-top:65px;">
	  	<c:if test="${sessionScope.id != null && sessionScope.grade == 'A'}">
	  		<h1 class="admintitle"><mark>관리자 모드</mark></h1>
	  	</c:if>
	</div>
</body>
</html>