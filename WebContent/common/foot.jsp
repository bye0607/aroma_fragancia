<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var ="context"><%=request.getContextPath()%></c:set>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>AROMA, FRAGANCIA</title>
<!-- 채널톡 챗봇 연동 -->
	<c:if test="${sessionScope.id == null}">
		<script>
		  (function(){var w=window;if(w.ChannelIO){return w.console.error("ChannelIO script included twice.")}var ch=function(){ch.c(arguments)};ch.q=[];ch.c=function(args){ch.q.push(args)};w.ChannelIO=ch;function l(){if(w.ChannelIOInitialized){return}w.ChannelIOInitialized=true;var s=document.createElement("script");s.type="text/javascript";s.async=true;s.src="https://cdn.channel.io/plugin/ch-plugin-web.js";var x=document.getElementsByTagName("script")[0];if(x.parentNode){x.parentNode.insertBefore(s,x)}}if(document.readyState==="complete"){l()}else{w.addEventListener("DOMContentLoaded",l);w.addEventListener("load",l)}})();
		
		  ChannelIO('boot', {
		    "pluginKey": "84091ac2-0c80-450c-a7c1-2b8955b6f6af"
		  });
		</script>
	</c:if>
	
	<c:if test="${sessionScope.id != null && sessionScope.grade != 'A'}">
		<script>
		  (function(){var w=window;if(w.ChannelIO){return w.console.error("ChannelIO script included twice.")}var ch=function(){ch.c(arguments)};ch.q=[];ch.c=function(args){ch.q.push(args)};w.ChannelIO=ch;function l(){if(w.ChannelIOInitialized){return}w.ChannelIOInitialized=true;var s=document.createElement("script");s.type="text/javascript";s.async=true;s.src="https://cdn.channel.io/plugin/ch-plugin-web.js";var x=document.getElementsByTagName("script")[0];if(x.parentNode){x.parentNode.insertBefore(s,x)}}if(document.readyState==="complete"){l()}else{w.addEventListener("DOMContentLoaded",l);w.addEventListener("load",l)}})();
		
		  ChannelIO('boot', {
		    "pluginKey": "84091ac2-0c80-450c-a7c1-2b8955b6f6af"
		  });
		</script>
	</c:if>
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
				<li><a href="${context}/FAQ/FAQ.jsp">자주묻는질문</a>
				<li><a href="${context}/work/board/reservation.do">상담예약문의</a>
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