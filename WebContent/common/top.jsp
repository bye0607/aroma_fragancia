<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var ="context"><%=request.getContextPath()%></c:set>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>AROMA, FRAGANCIA</title>
<link href="${context}/css/bootstrap.min.css" rel="stylesheet">
<link href="${context}/css/bootstrap-theme.css" rel="stylesheet">
<link href="${context}/css/common.css" rel="stylesheet">
<script src="${context}/js/bootstrap.min.js"></script>
<script src="${context}/js/common.js"></script>
<style type="text/css">
li{
	cursor: pointer;
}
a{
	text-decoration:none !important;
}

.navbar{
	background-color: #E1E1E3 !important;
}
.navbar-default{
	background-color: #E1E1E3 !important;
}
</style>
</head>

<!-- URL 추가 -->
<c:set var="homeUrl">${context}/work/product/goMain.do</c:set>
<c:set var="loginUrl">${context}/user/login.jsp</c:set>

<c:set var="noitceUrl">${context}/work/board/notice.do</c:set>
<c:set var="cmmuUrl">${context}/work/board/community.do</c:set>
<c:set var="boardUrl">${context}/work/board/board.do</c:set>

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
          <a class="navbar-brand" href="${homeUrl}" style="font-size: 30px; margin-bottom: 8px; margin-top: 8px"><font color="#555555"><strong>AROMA FRAGANCIA</strong></font></a>
        </div>
      	 
        <div id="navbar" class="collapse navbar-collapse" style= "margin-top: 8px";>
          <ul class="nav navbar-nav navbar-right">
			<li>
				<c:if test="${sessionScope.id == null}">
					<a href="${context}/work/user/createUser.do"><font color="black"><strong>SIGN UP</strong></font></a>
				</c:if>
				<c:if test="${sessionScope.id != null && sessionScope.grade != 'A'}">
					<a href="${context}/work/cart/retrieveCartList.do"><font color="black"><strong>CART</strong></font></a>
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
	        <!--  링크 수정  -->
	        <li class="dropdown">
	          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">PRODUCT <span class="caret"></span></a>
	          <ul class="dropdown-menu">
				<li><a onclick="javascript:fn_isLogin('${sessionScope.userCode}','${loginUrl}','${perfumeUrl}')" style="color: black; font-size: 15px;">PERFUMS</a></li>
			    <li><a onclick="javascript:fn_isLogin('${sessionScope.userCode}','${loginUrl}','${diffuserUrl}')" style="color: black; font-size: 15px;">DIFFUSER</a></li>

	          </ul>
	        </li>
	        
	        <!-- 비회원 가능 -->
	        <li><a class="ddt" href="#">RESERVATION</a></li>
	        
	        <!-- 회원, 관리자만 가능 -->
	        <li class="dropdown">
	          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">SERVICE <span class="caret"></span></a>
	          <ul class="dropdown-menu">
				<li><a onclick="javascript:fn_isLogin('${sessionScope.userCode}','${loginUrl}','${noitceUrl}')" style="color: black; font-size: 15px;">NOTICE</a></li>
			    <li><a onclick="javascript:fn_isLogin('${sessionScope.userCode}','${loginUrl}','${cmmuUrl}')" style="color: black; font-size: 15px;">COMMUNITY</a></li>
			    <li><a onclick="javascript:fn_isLogin('${sessionScope.userCode}','${loginUrl}','${boardUrl}')" style="color: black; font-size: 15px;">BOARD</a></li>
			    <li><a href="${FAQUrl}" style="color: black; font-size: 15px;">FAQ</a></li>
	          </ul>
	        </li>
	        <li class="dropdown">
				<c:if test="${sessionScope.id != null && sessionScope.grade != 'A'}">
		          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">MY PAGE <span class="caret"></span></a>
		          <ul class="dropdown-menu">
				    <li><a href="${context}/work/sell/retrieveBuyList.do" style="color: black; font-size: 15px;">PURCHASE HISTORY</a></li>
					
				    <li><a href="${context}/work/user/updateUser.do" style="color: black; font-size: 15px;">EDIT PROFILE</a></li>
		          </ul>
				</c:if>
	        </li>
      			<li class="dropdown">
					<c:if test="${sessionScope.id != null && sessionScope.grade == 'A'}">
			          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">관리자 메뉴<span class="caret"></span></a>
			          <ul class="dropdown-menu">
						<li><a href="${context}/work/product/retrieveProductListForManage.do"><font color="black"><strong>재고관리</strong></font></a></li>
						<li><a href="${context}/work/sell/retrieveStatisticsForProduct.do"><font color="black"><strong>매출통계</strong></font></a></li>
						<li><a href="${context}/work/product/retrieveStatisticsForStock.do?productCategoryCd=P"><font color="black"><strong>재고현황</strong></font></a></li>
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