<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var ="context"><%=request.getContextPath()%></c:set>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>AROMA, FRAGANCIA</title>
<style type="text/css">


body{
	font-family: "Crimson Pro";
	margin: 0;
	display: grid;
	font-size: 14px;
}

footer{
	display: -webkit-flex;
	display: -moz-flex;
	display: -ms-flex;
	display: -o-flex;
	display: flex;
	flex-flow: row wrap;
	padding: 50px;
	color: fff;
	/* background-color: #cccccc; */
	cursor: default;
	
}
.footer > *{
	flex: 1 100%;
}
.footer-left{
margin-right: 1.25em;
margin-bottom: 2em;
}

.footer-right > li > h2{
	font-weight: 600;
	font-size: 17px;
}
.footer ul{
list-style: none;
padding-left: 0;
}

.footer li{
line-height: 2em;
}
.footer a{
text-decoration: none;
}
.footer-right{
	display: -webkit-flex;
	display: -moz-flex;
	display: -ms-flex;
	display: -o-flex;
	display: flex;
	flex-flow: row wrap;
}
.footer-right > *{
	flex: 1 50%;
	margin-right: 1.25em;
}
.info a{
	color: #999;
	
}
.info2 a{
	cursor: default;
}
.footer-bottom{
	text-align: center;
	color: #999;
	padding-top: 50px;
	
}
.footer-left p{
	padding-right: 20%;
	color: #999;
	
}
.footer-left > a{
	color: #999;
	
}
.sns a{
	width: 40px;
	height: 40px;
	display: inline-block;;
	margin-right: 10px;
}
.sns a i{
	color: e7f2f4;
	padding: 10px 12px;
	font-size: 20px;
}

@media screen and (min-width: 600px) {
	.footer-right > *{
		flex: 1;
	}
	.footer-left{
		flex: 1 0px;
	}
	.footer-right{
		flex: 2 0px;
	}
}

@media (max-width:992px){
	.footer{
		padding: 15px;
	}
}

</style>
</head>
<c:set var="homeUrl">${context}/work/product/goMain.do</c:set>
<body>
	<hr>
	<footer class="footer">
		<div class="footer-left">
			<a href="${homeUrl}"><p style="font-size: 30px; margin-top: 20px; color: black; font-family: 'DM Serif Display';">AROMA, FRAGANCIA</p></a>
			<p style="font-size: 20px; margin-bottom: 40px; color: black;">FOLLOW US ON</p>
			<div class="sns">
	      		<a href="#"><img src="../../footerimg/kakao.svg" width="20px" height="20px" alt="kakaolink"></a>
	      		<a href="#"><img src="../../footerimg/insta.svg" width="20px" height="20px" alt="instalink"></a>
	      		<a href="#"><img src="../../footerimg/youtube.svg" width="20px" height="20px" alt="youtubelink"></a>
	      		<a href="#"><img src="../../footerimg/twitter.svg" width="20px" height="20px" alt="twitterlink"></a>
	      		<a href="#"><img src="../../footerimg/facebook.svg" width="20px" height="20px" alt="fackbooklink"></a>
			</div>
		</div>
		<ul class="footer-right">
			<li>
				<h2>SERVICE</h2>
				<ul class="info">
					<li><a href="#">고객센터</a>
					<li><a href="#">1:1문의</a>
					<li><a href="#">자주묻는질문</a>
					<li><a href="#">상담예약문의</a>
				</ul>
			</li>
			<li>
				<h2>CONTACT</h2>
				<ul class="info info2">
					<li><a><b>Email</b></a>
					<li><a>aromafragancia@aroma.co.kr</a>
					<li><a></a>
					<li><a><b>Address</b></a>
					<li><a>06035 Gangnam-gu, Seoul, Korea <br> 15, Garosu-gil</a>
				</ul>
			</li>
			<li>
				<h2>INFO</h2>
				<ul class="info info2">
					<li><a>T.02-1234-5678</a>
					<li><a></a>
					<li><a>Mon-Fri:10am-5pm</a>
					<li><a></a>
					<li><a>Weekend Holiday OFF</a>
				</ul>
			</li>

		</ul>
	</footer>
</body>
</html>