<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var ="context"><%=request.getContextPath()%></c:set>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>AROMA, FRAGANCIA</title>
<script>
  (function(){var w=window;if(w.ChannelIO){return w.console.error("ChannelIO script included twice.")}var ch=function(){ch.c(arguments)};ch.q=[];ch.c=function(args){ch.q.push(args)};w.ChannelIO=ch;function l(){if(w.ChannelIOInitialized){return}w.ChannelIOInitialized=true;var s=document.createElement("script");s.type="text/javascript";s.async=true;s.src="https://cdn.channel.io/plugin/ch-plugin-web.js";var x=document.getElementsByTagName("script")[0];if(x.parentNode){x.parentNode.insertBefore(s,x)}}if(document.readyState==="complete"){l()}else{w.addEventListener("DOMContentLoaded",l);w.addEventListener("load",l)}})();

  ChannelIO('boot', {
    "pluginKey": "84091ac2-0c80-450c-a7c1-2b8955b6f6af"
  });
</script>
<style type="text/css">


/* body{font-family: "Crimson Pro"; margin: 0;	display: grid; font-size: 14px;}
footer{ display: -webkit-flex; display: -ms-flex; display: -o-flex;	display: flex; flex-flow: row wrap;	padding: 50px; color: fff;
	cursor: default; font-family: "Crimson Pro";}
.footer > *{ flex: 1 100%;}
.footer-left{ margin-right: 1.25em; margin-bottom: 2em;}
.footer-right > li > h2{ font-weight: 600; font-size: 17px; }
.footer ul{ list-style: none; padding-left: 0;}
.footer li{line-height: 2em;}
.footer a{text-decoration: none;}
.footer-right{	display: -webkit-flex; display: -ms-flex; display: -o-flex;	display: flex; flex-flow: row wrap;}
.footer-right > *{ flex: 1 50%; margin-right: 1.25em; }
.info a{ color: #999;}
.info2 a{ cursor: default;}
.footer-bottom{ text-align: center;	color: #999; padding-top: 50px;}
.footer-left p{	padding-right: 20%;	color: #999; }
.footer-left > a{ color: #999;}
.sns a{	width: 40px; height: 40px; display: inline-block; margin-right: 10px;}

@media screen and (min-width: 760px) {
	.footer-right > *{flex: 1;}
	.footer-left{ flex: 1 0px;}
	.footer-right{ flex: 2 0px;}
}
@media (max-width:992px){
	.footer{ padding: 15px;	}
} */

</style>
</head>
<c:set var="homeUrl">${context}/work/product/goMain.do</c:set>
<body>
<footer class="footer">
	<div class="container">
		<div class="row">
		<div class="col-sm-12 col-md-4">
			<a href="${homeUrl}" class="ftlogo">AROMA, FRAGANCIA</a>
			<div class="sns">
				<p>FOLLOW US ON</p>
	      		<a href="#"><img src="${context}/img/common/sns_kakao.svg"  alt="kakaolink"></a>
	      		<a href="#"><img src="${context}/img/common/sns_insta.svg" alt="instalink"></a>
	      		<a href="#"><img src="${context}/img/common/sns_youtube.svg" alt="youtubelink"></a>
	      		<a href="#"><img src="${context}/img/common/sns_twitter.svg" alt="twitterlink"></a>
	      		<a href="#"><img src="${context}/img/common/sns_facebook.svg" alt="fackbooklink"></a>
			</div>
		</div>
		<div class="col-sm-4 col-md-2 footer-right">
			<h2>SERVICE</h2>
			<ul class="info">
				<li><a href="${context}/board/notice.do">공지사항</a>
				<li><a href="${context}/board/community.do">커뮤니티</a>
				<li><a href="${context}/work/FAQ/FAQ.jsp">자주묻는질문</a>
				<li><a href="#">상담예약문의</a>
			</ul>
		</div>
		<div class="col-sm-4 col-md-3 footer-right">
			<h2>CONTACT</h2>
			<ul class="info info2">
				<li><b>Email</b></li>
				<li>aromafragancia@aroma.co.kr</li>
				<li><b>Address</b></li>
				<li>06035 Gangnam-gu, Seoul, Korea<br>15, Garosu-gil</li>
			</ul>
		</div>
		<div class="col-sm-4 col-md-3 footer-right">
			<h2>INFO</h2>
			<ul class="info info2">
				<li><a>T.02-1234-5678</a>
				<li><a></a>
				<li><a>Mon-Fri:10am-5pm</a>
				<li><a></a>
				<li><a>Weekend Holiday OFF</a>
			</ul>
		</div>
		</div>
	</div>
</footer>
</body>
</html>