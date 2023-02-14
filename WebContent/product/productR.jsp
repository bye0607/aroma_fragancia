<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var ="context"><%=request.getContextPath()%></c:set>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>PRODUCT - ${dsProduct.PRODUCT_NAME}</title>
	<script src="${context}/js/jquery-1.9.1.js"></script>
	<script type="text/javascript">
		var stockTotal;
		var priceTotal;
	
		$(document).ready(function() {
		/* 수량 관련 스크립트 */
			var action;
			var price = '${dsProduct.PRODUCT_UNIT_PRICE}';
			var stock = '${dsProduct.PRODUCT_COUNT}';
		
			stockTotal = 1;
			priceTotal = price;
		
			$(".number-spinner button").mousedown(function () {
			  	btn = $(this);
			  	input = btn.closest('.number-spinner').find('input');
			  	btn.closest('.number-spinner').find('button').prop("disabled", false);
		
			   	if (btn.attr('data-dir') == 'up') {
		          	action = setInterval(function(){
				        if (input.attr('max') == undefined || parseInt(input.val()) < parseInt(input.attr('max')) ) {
					       	if (stock <= parseInt(input.val())){
					      		alert("죄송합니다.\n재고가 " + stock + "개 남았습니다");
					      		clearInterval(action);
						    } else {
					        	input.val(parseInt(input.val())+1);
					            $("#price").text(parseInt(price) * parseInt(input.val()) + "원");
					            priceTotal = parseInt(price) * parseInt(input.val());
					            stockTotal = parseInt(input.val());
					        }
					    } else {
		                	btn.prop("disabled", true);
		                	clearInterval(action);
		              	}
		         	}, 50);
				} else {
					action = setInterval(function(){
						if ( input.attr('min') == undefined || parseInt(input.val()) > parseInt(input.attr('min')) ) {
		                	input.val(parseInt(input.val())-1);
		                	$("#price").text(parseInt(price) * parseInt(input.val()) + "원");
		                	priceTotal = parseInt(price) * parseInt(input.val());
		                	stockTotal = parseInt(input.val());
		           		} else {
		                	btn.prop("disabled", true);
		                	clearInterval(action);
		          		}
					}, 50);
				}
			}).mouseup(function(){
				clearInterval(action);
			}); //number-spinner mousedown
		
			/* 댓글 관련 스크립트 */
		    (function(e){var t,o={className:"autosizejs",append:"",callback:!1,resizeDelay:10},i='<textarea tabindex="-1" style="position:absolute; top:-999px; left:0; right:auto; bottom:auto; border:0; padding: 0; -moz-box-sizing:content-box; -webkit-box-sizing:content-box; box-sizing:content-box; word-wrap:break-word; height:0 !important; min-height:0 !important; overflow:hidden; transition:none; -webkit-transition:none; -moz-transition:none;"/>',n=["fontFamily","fontSize","fontWeight","fontStyle","letterSpacing","textTransform","wordSpacing","textIndent"],s=e(i).data("autosize",!0)[0];s.style.lineHeight="99px","99px"===e(s).css("lineHeight")&&n.push("lineHeight"),s.style.lineHeight="",e.fn.autosize=function(i){return this.length?(i=e.extend({},o,i||{}),s.parentNode!==document.body&&e(document.body).append(s),this.each(function(){function o(){var t,o;"getComputedStyle"in window?(t=window.getComputedStyle(u,null),o=u.getBoundingClientRect().width,e.each(["paddingLeft","paddingRight","borderLeftWidth","borderRightWidth"],function(e,i){o-=parseInt(t[i],10)}),s.style.width=o+"px"):s.style.width=Math.max(p.width(),0)+"px"}function a(){var a={};if(t=u,s.className=i.className,d=parseInt(p.css("maxHeight"),10),e.each(n,function(e,t){a[t]=p.css(t)}),e(s).css(a),o(),window.chrome){var r=u.style.width;u.style.width="0px",u.offsetWidth,u.style.width=r}}function r(){var e,n;t!==u?a():o(),s.value=u.value+i.append,s.style.overflowY=u.style.overflowY,n=parseInt(u.style.height,10),s.scrollTop=0,s.scrollTop=9e4,e=s.scrollTop,d&&e>d?(u.style.overflowY="scroll",e=d):(u.style.overflowY="hidden",c>e&&(e=c)),e+=w,n!==e&&(u.style.height=e+"px",f&&i.callback.call(u,u))}function l(){clearTimeout(h),h=setTimeout(function(){var e=p.width();e!==g&&(g=e,r())},parseInt(i.resizeDelay,10))}var d,c,h,u=this,p=e(u),w=0,f=e.isFunction(i.callback),z={height:u.style.height,overflow:u.style.overflow,overflowY:u.style.overflowY,wordWrap:u.style.wordWrap,resize:u.style.resize},g=p.width();p.data("autosize")||(p.data("autosize",!0),("border-box"===p.css("box-sizing")||"border-box"===p.css("-moz-box-sizing")||"border-box"===p.css("-webkit-box-sizing"))&&(w=p.outerHeight()-p.height()),c=Math.max(parseInt(p.css("minHeight"),10)-w||0,p.height()),p.css({overflow:"hidden",overflowY:"hidden",wordWrap:"break-word",resize:"none"===p.css("resize")||"vertical"===p.css("resize")?"none":"horizontal"}),"onpropertychange"in u?"oninput"in u?p.on("input.autosize keyup.autosize",r):p.on("propertychange.autosize",function(){"value"===event.propertyName&&r()}):p.on("input.autosize",r),i.resizeDelay!==!1&&e(window).on("resize.autosize",l),p.on("autosize.resize",r),p.on("autosize.resizeIncludeStyle",function(){t=null,r()}),p.on("autosize.destroy",function(){t=null,clearTimeout(h),e(window).off("resize",l),p.off("autosize").off(".autosize").css(z).removeData("autosize")}),r())})):this}})(window.jQuery||window.$);
		
			var __slice=[].slice;(function(e,t){var n;n=function(){function t(t,n){var r,i,s,o=this;this.options=e.extend({},this.defaults,n);this.$el=t;s=this.defaults;for(r in s){i=s[r];if(this.$el.data(r)!=null){this.options[r]=this.$el.data(r)}}this.createStars();this.syncRating();this.$el.on("mouseover.starrr","span",function(e){return o.syncRating(o.$el.find("span").index(e.currentTarget)+1)});this.$el.on("mouseout.starrr",function(){return o.syncRating()});this.$el.on("click.starrr","span",function(e){return o.setRating(o.$el.find("span").index(e.currentTarget)+1)});this.$el.on("starrr:change",this.options.change)}t.prototype.defaults={rating:void 0,numStars:5,change:function(e,t){}};t.prototype.createStars=function(){var e,t,n;n=[];for(e=1,t=this.options.numStars;1<=t?e<=t:e>=t;1<=t?e++:e--){n.push(this.$el.append("<span class='glyphicon .glyphicon-star-empty'></span>"))}return n};t.prototype.setRating=function(e){if(this.options.rating===e){e=void 0}this.options.rating=e;this.syncRating();return this.$el.trigger("starrr:change",e)};t.prototype.syncRating=function(e){var t,n,r,i;e||(e=this.options.rating);if(e){for(t=n=0,i=e-1;0<=i?n<=i:n>=i;t=0<=i?++n:--n){this.$el.find("span").eq(t).removeClass("glyphicon-star-empty").addClass("glyphicon-star")}}if(e&&e<5){for(t=r=e;e<=4?r<=4:r>=4;t=e<=4?++r:--r){this.$el.find("span").eq(t).removeClass("glyphicon-star").addClass("glyphicon-star-empty")}}if(!e){return this.$el.find("span").removeClass("glyphicon-star").addClass("glyphicon-star-empty")}};return t}();return e.fn.extend({starrr:function(){var t,r;r=arguments[0],t=2<=arguments.length?__slice.call(arguments,1):[];return this.each(function(){var i;i=e(this).data("star-rating");if(!i){e(this).data("star-rating",i=new n(e(this),r))}if(typeof r==="string"){return i[r].apply(i,t)}})}})})(window.jQuery,window);$(function(){return $(".starrr").starrr()})
		
			$('#new-review').autosize({append: "\n"});
		
	        var newReview = $('#new-review');
	        var ratingsField = $('#ratings-hidden');
	        var reviewBox = $('#post-review-box');
	        var openReviewBtn = $('#open-review-box');
	        var closeReviewBtn = $('#close-review-box');
	        var saveReviewBtn = $('#save-review');
	
	        openReviewBtn.click(function(e) {
		    	reviewBox.slideDown(400, function() {
		        	$('#new-review').trigger('autosize.resize');
		            newReview.focus();
	            });
	          	openReviewBtn.fadeOut(100);
	          	closeReviewBtn.show();
	          	saveReviewBtn.show();
		    });
		
	        closeReviewBtn.click(function(e) {
	        	e.preventDefault();
				reviewBox.slideUp(300, function() {
	            	newReview.focus();
	            	openReviewBtn.fadeIn(200);
	            });
	        	closeReviewBtn.hide();
	        	saveReviewBtn.hide();
			});
	
	        $('.starrr').on('starrr:change', function(e, value){
	        	ratingsField.val(value);
	        });
	
	        if('${dsProduct.PRODUCT_COUNT}' == 0){
	        	$('#buyBtn').attr('disabled', true);
	        	$('#cartBtn').attr('disabled', true);
	        }
		}); //document ready function
	
	    window.onload = function(){
	    	$(".replyStar").off("mouseover");
	    }
	
	    function fn_buy(){
			location.href = "${context}/work/sell/createSell.do?productCode=" + '${dsProduct.PRODUCT_CODE}' + "&sellPrice=" + priceTotal + "&sellCount=" + stockTotal;
	    }
	
		function fn_cart(){
			location.href = "${context}/work/cart/createCart.do?productCode=" + '${dsProduct.PRODUCT_CODE}' + "&cartPrice=" + priceTotal + "&cartCount=" + stockTotal;
	    }
	
		function fn_save(){
			if($("#userReply").val() == ''){
				alert("상품평을 입력하세요.");
				return false;
			}
			$("#createReply").submit();
		}
	
		function fn_remove(paramUserReplyNo){
			var userReplyNo = paramUserReplyNo;
			var productCode = '${dsProduct.PRODUCT_CODE}';
	
			if(confirm("정말 삭제하시겠습니까?")){
				location.href = "${context}/work/reply/deleteReply.do?userReplyNo=" + userReplyNo + "&productCode=" + productCode;
			}
		}
	</script>
</head>
<body class="productview">
<jsp:include page="${context}/common/top.jsp"></jsp:include>
<!-- title, visual start -->
<div class="titarea" style='background-image: url("${context}/img/subbg_product.png");'>
	<div class="boardText">
		<h3 class="boardTitle">PRODUCT</h3>
		<p class="boardSub">${dsProduct.PRODUCT_CATEGORY_CD_NM}</p>
	</div>
</div>
<!-- title, visual end -->
<div class="container">
	<!-- board title, buttons start -->
	<div class="page-header">
		<div class="row">
			<div class="col-xs-8">
				<!-- 한글일 경우 title 클래스만 사용. 영문일 경우 eng 클래스 추가하세요 -->
				<h2 class="title eng">${dsProduct.PRODUCT_NAME}</h2>
			</div>
		</div>
	</div>
	<!-- board title, buttons end -->
	<div class="row">
		<!-- 상품이미지 start -->
		<div class="col-md-6" align="center">
			<img id="image" src="${context}" class="img-responsive detailimg">
              	<script type="text/javascript">
        		var existFolder = '';
        		var imageFolder = '';
        		var path = '';
			 	var productCategoryCd = '${dsProduct.PRODUCT_CATEGORY_CD}';

				if(productCategoryCd == 'P'){
					imageFolder = "/perfumeImg/${dsProduct.PRODUCT_IMAGE}";
				}else if(productCategoryCd == 'D'){
					imageFolder = "/diffuserImg/${dsProduct.PRODUCT_IMAGE}";
				}
				path = $("#image").attr("src");

				existFolder = path.split("/")[0];
				$("#image").attr("src", path.replace(existFolder, imageFolder));
			</script>
		</div>
		<!-- 상품이미지 end -->
		<!-- 상품정보 start -->
		<div class="col-md-6 productInfo">
			<table class="table table-user-information" >
				<tbody>
					<tr>
						<td>제품명</td>
						<td>${dsProduct.PRODUCT_NAME}</td>
					</tr>
					<tr>
						<td>판매가</td>
						<td id="price">${dsProduct.PRODUCT_UNIT_PRICE}원</td>
					</tr>
					<c:choose>
						<c:when test="${dsProduct.PRODUCT_COUNT != 0}">
						<tr>
							<td>남은 수량</td>
							<td id="stock">${dsProduct.PRODUCT_COUNT}개</td>
						</tr>
						<tr>
							<td>수량</td>
							<td>
								<div class="input-group number-spinner" style="width: 150px;">
									<span class="input-group-btn data-dwn">
										<button class="btn" data-dir="dwn">
											<span class="glyphicon glyphicon-minus"></span>
										</button>
									</span> 
									<input type="text" class="form-control text-center" value="1" min="1" max="100" width="100%" disabled="disabled" style="height:32px;box-shadow:none;border:0">
									<span class="input-group-btn data-up">
										<button class="btn" data-dir="up">
											<span class="glyphicon glyphicon-plus"></span>
										</button>
									</span>
								</div>
							</td>
						</tr>
						</c:when>
						<c:otherwise>
						<tr>
							<td>남은 수량</td>
							<td id="stock"><mark class="text-danger">품절</mark></td>
						</tr>
						<tr>
							<td> </td>
						</tr>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
			<div class="row">
				<div class="col-xs-6">
					<!-- 구매하기 버튼 -->
					<button id="buyBtn" type="button" class="btn btn-lg" onclick="fn_buy()">구매하기</button>
				</div>
				<div class="col-xs-6">
					<!-- 장바구니 버튼 -->
					<button id="cartBtn" type="button" class="btn btn-lg" onclick="fn_cart()">장바구니</button>
				</div>
			</div>
		</div>
		<!-- 상품정보 end -->
	</div>
	<!-- 상품디테일 start -->
	<div class="row">
		<div class="text-center product-title scent-wrap">
			<div class="scent-info">
		      <span>Fragrance</span>
		      <span>Number</span>
			</div>
		</div>
		<div class="text-center product-details scent-wrap">
			<div class="scent-info-sub">
		      <span><em>저희 제품은 패키지에 </em> <em>주 원료를 표기하여</em></span>
		      <span><em>직관적으로 향을 이해하고,</em> <em>나에게 맞는 향을 고를 수 있습니다.</em></span>
			</div>
		</div>
		<div class="scent-info-img">
			<img class="img-responsive scent-info-img" src="${context}/img/product_scent.png" alt="맞는향">
			<img class="img-responsive scent-info-video" src="https://media.11corporation.com/cdn/addict/godo/detail/1000000045/20221025/detail_11.jpg?tr=w-1170,h-auto&amp;_=22010251810">
		</div>	
		<div class="scent-info-img">
			<video class="img-responsive scent-info-video" playsinline="" autoplay="" muted="" loop="" type="video/mp4"  src="https://d2awjssdq42p8p.cloudfront.net/addict/video/media-convert/66d58d25/09010017.h264.mp4"></video>
			<img class="img-responsive scent-info-img" src="https://media.11corporation.com/cdn/addict/godo/detail/1000000069/20221115/detail_11.jpg?tr=w-1170,h-auto&amp;_=2211151645" >
			<video class="img-responsive scent-info-video" playsinline="" autoplay="" muted="" loop="" type="video/mp4" src="https://d2awjssdq42p8p.cloudfront.net/addict/video/media-convert/2c1e6af7/b87663e4.h264.mp4"></video>
		</div>	
		<div class="text-center product-title scent-wrap">
			<div class="scent-info">
	      		<span>Membership</span>
	      		<span>Benefits</span>
			</div>
		</div>
		<div class="text-center product-details scent-wrap">
			<div class="scent-info-sub">
				<span class="fragancia"><em>Aroma, Fragancia</em></span> <span><em>회원이 되어</em></span>
		      	<span><em>회원 전용 </em> <em>혜택을 받아보세요.</em></span>
			</div>
		</div>
	</div>
	<!-- 상품디테일 end -->
</div>
<!--  상품평 입력 토글 start -->
<div class="container review-box" >
	<div class="row">
		<div  class="col-xs-6">
	   		<h3>상품평 <span class="badge">${dsReplyList[0].REPLY_COUNT}</span></h3>
		</div>
        <div class="col-xs-6 text-right">
   			<c:if test="${dsProduct.SELL_YN == 'Y'}">
               <a class="btn btn-lg" href="#reviews-anchor" id="open-review-box">상품평 등록하기</a>
			</c:if>
        </div>
	</div>
	<div class="row">
		<div class="col-md-12" id="post-review-box" style="display:none;">
            <form id="createReply" accept-charset="UTF-8" action="${context}/work/reply/createReply.do" method="post">
                <input id="ratings-hidden" name="markRating" type="hidden">
                <textarea class="form-control animated" cols="50" id="userReply" name="userReply" placeholder="상품평을 입력하세요..." rows="5"></textarea>
                <div class="text-right">
					<c:if test="${dsProduct.MARK_YN == 'N'}">
						<div class="stars starrr" data-rating="0"></div>
					</c:if>
					<a href="#" id="close-review-box" class="btn">Cancel</a>
					<button id="save-review" class="btn" onclick="return fn_save()">Save</button>
                </div>
                <input type="hidden" id="productCode" name="productCode" value="${dsProduct.PRODUCT_CODE}">
                <input type="hidden" id="markYn" name="markYn" value="${dsProduct.MARK_YN}">
            </form>
		</div>
	</div>
</div>
<!-- 상품평 입력 토글 end -->
<!-- 상품평 목록 start -->
<div class="container">
	<c:forEach items="${dsReplyList}" var="dsReplyList">
		<div class="row" style="border-top: 1px solid #D7D8DA; padding:34px 0;">
			<div class="col-xs-8 col-md-10 text-left">
				<h4>
					${dsReplyList.USER_ID}&nbsp;&nbsp;<span class="text-muted">${dsReplyList.REPLY_DATE}</span>&nbsp;&nbsp;&nbsp;
					<span class="stars starrr replyStar" data-rating="${dsReplyList.MARK_RATING}"></span>
				</h4>
			</div>
			<div class="col-xs-4 col-md-2 text-right">
				<c:if test="${sessionScope.userCode == dsReplyList.USER_CODE}">
               		<a data-original-title="Remove this user" data-toggle="tooltip" type="button" class="btn" 
               		onclick="javascript:fn_remove('${dsReplyList.USER_REPLY_NO}')">삭제</a>
            	</c:if>
            </div>
			<div class="col-xs-12 text-left">${dsReplyList.USER_REPLY}</div>
		</div>
	</c:forEach>
</div>
<!-- 상품평 목록 end -->
<jsp:include page="/common/foot.jsp"></jsp:include>
</body>
</html>