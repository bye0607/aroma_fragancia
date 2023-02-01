<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var ="context"><%=request.getContextPath()%></c:set>
<!DOCTYPE html>
<html>
<head>
	<meta name="description" content="productR.jsp">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<link href="${context}/css/bootstrap.min.css" rel="stylesheet">
	<link href="${context}/css/bootstrap-theme.css" rel="stylesheet">
	<link href="${context}/css/plugins/metisMenu/metisMenu.min.css" rel="stylesheet">
	<link href="${context}/css/plugins/social-buttons.css" rel="stylesheet">
	<link href="${context}/font-awesome-4.4.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
	<link href="//code.jquery.com/ui/1.11.3/themes/smoothness/jquery-ui.css" rel="stylesheet" >
	<link href="${context}/css/plugins/dataTables.bootstrap.css" rel="stylesheet">
    <link href="${context}/css/process.css" rel="stylesheet">
    <link href="${context}/css/product.css" rel="stylesheet">

	<script src="${context}/js/jquery-1.9.1.js"></script>
	<script src="${context}/js/jquery.form.js"></script>
    <script src="${context}/js/plugins/metisMenu/metisMenu.min.js"></script>

	<script src="${context}/js/plugins/dataTables/jquery.dataTables.js"></script>
    <script src="${context}/js/plugins/dataTables/dataTables.bootstrap.js"></script>

<script src="//code.jquery.com/ui/1.11.3/jquery-ui.js"></script>
<script type="text/javascript">

	var existFolder = '';
	var imageFolder = '';
	var path = '';
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
        if ( input.attr('max') == undefined || parseInt(input.val()) < parseInt(input.attr('max')) ) {
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
	   });

	/* 댓글 관련 스크립트 */
        (function(e){var t,o={className:"autosizejs",append:"",callback:!1,resizeDelay:10},i='<textarea tabindex="-1" style="position:absolute; top:-999px; left:0; right:auto; bottom:auto; border:0; padding: 0; -moz-box-sizing:content-box; -webkit-box-sizing:content-box; box-sizing:content-box; word-wrap:break-word; height:0 !important; min-height:0 !important; overflow:hidden; transition:none; -webkit-transition:none; -moz-transition:none;"/>',n=["fontFamily","fontSize","fontWeight","fontStyle","letterSpacing","textTransform","wordSpacing","textIndent"],s=e(i).data("autosize",!0)[0];s.style.lineHeight="99px","99px"===e(s).css("lineHeight")&&n.push("lineHeight"),s.style.lineHeight="",e.fn.autosize=function(i){return this.length?(i=e.extend({},o,i||{}),s.parentNode!==document.body&&e(document.body).append(s),this.each(function(){function o(){var t,o;"getComputedStyle"in window?(t=window.getComputedStyle(u,null),o=u.getBoundingClientRect().width,e.each(["paddingLeft","paddingRight","borderLeftWidth","borderRightWidth"],function(e,i){o-=parseInt(t[i],10)}),s.style.width=o+"px"):s.style.width=Math.max(p.width(),0)+"px"}function a(){var a={};if(t=u,s.className=i.className,d=parseInt(p.css("maxHeight"),10),e.each(n,function(e,t){a[t]=p.css(t)}),e(s).css(a),o(),window.chrome){var r=u.style.width;u.style.width="0px",u.offsetWidth,u.style.width=r}}function r(){var e,n;t!==u?a():o(),s.value=u.value+i.append,s.style.overflowY=u.style.overflowY,n=parseInt(u.style.height,10),s.scrollTop=0,s.scrollTop=9e4,e=s.scrollTop,d&&e>d?(u.style.overflowY="scroll",e=d):(u.style.overflowY="hidden",c>e&&(e=c)),e+=w,n!==e&&(u.style.height=e+"px",f&&i.callback.call(u,u))}function l(){clearTimeout(h),h=setTimeout(function(){var e=p.width();e!==g&&(g=e,r())},parseInt(i.resizeDelay,10))}var d,c,h,u=this,p=e(u),w=0,f=e.isFunction(i.callback),z={height:u.style.height,overflow:u.style.overflow,overflowY:u.style.overflowY,wordWrap:u.style.wordWrap,resize:u.style.resize},g=p.width();p.data("autosize")||(p.data("autosize",!0),("border-box"===p.css("box-sizing")||"border-box"===p.css("-moz-box-sizing")||"border-box"===p.css("-webkit-box-sizing"))&&(w=p.outerHeight()-p.height()),c=Math.max(parseInt(p.css("minHeight"),10)-w||0,p.height()),p.css({overflow:"hidden",overflowY:"hidden",wordWrap:"break-word",resize:"none"===p.css("resize")||"vertical"===p.css("resize")?"none":"horizontal"}),"onpropertychange"in u?"oninput"in u?p.on("input.autosize keyup.autosize",r):p.on("propertychange.autosize",function(){"value"===event.propertyName&&r()}):p.on("input.autosize",r),i.resizeDelay!==!1&&e(window).on("resize.autosize",l),p.on("autosize.resize",r),p.on("autosize.resizeIncludeStyle",function(){t=null,r()}),p.on("autosize.destroy",function(){t=null,clearTimeout(h),e(window).off("resize",l),p.off("autosize").off(".autosize").css(z).removeData("autosize")}),r())})):this}})(window.jQuery||window.$);

        var __slice=[].slice;(function(e,t){var n;n=function(){function t(t,n){var r,i,s,o=this;this.options=e.extend({},this.defaults,n);this.$el=t;s=this.defaults;for(r in s){i=s[r];if(this.$el.data(r)!=null){this.options[r]=this.$el.data(r)}}this.createStars();this.syncRating();this.$el.on("mouseover.starrr","span",function(e){return o.syncRating(o.$el.find("span").index(e.currentTarget)+1)});this.$el.on("mouseout.starrr",function(){return o.syncRating()});this.$el.on("click.starrr","span",function(e){return o.setRating(o.$el.find("span").index(e.currentTarget)+1)});this.$el.on("starrr:change",this.options.change)}t.prototype.defaults={rating:void 0,numStars:5,change:function(e,t){}};t.prototype.createStars=function(){var e,t,n;n=[];for(e=1,t=this.options.numStars;1<=t?e<=t:e>=t;1<=t?e++:e--){n.push(this.$el.append("<span class='glyphicon .glyphicon-star-empty'></span>"))}return n};t.prototype.setRating=function(e){if(this.options.rating===e){e=void 0}this.options.rating=e;this.syncRating();return this.$el.trigger("starrr:change",e)};t.prototype.syncRating=function(e){var t,n,r,i;e||(e=this.options.rating);if(e){for(t=n=0,i=e-1;0<=i?n<=i:n>=i;t=0<=i?++n:--n){this.$el.find("span").eq(t).removeClass("glyphicon-star-empty").addClass("glyphicon-star")}}if(e&&e<5){for(t=r=e;e<=4?r<=4:r>=4;t=e<=4?++r:--r){this.$el.find("span").eq(t).removeClass("glyphicon-star").addClass("glyphicon-star-empty")}}if(!e){return this.$el.find("span").removeClass("glyphicon-star").addClass("glyphicon-star-empty")}};return t}();return e.fn.extend({starrr:function(){var t,r;r=arguments[0],t=2<=arguments.length?__slice.call(arguments,1):[];return this.each(function(){var i;i=e(this).data("star-rating");if(!i){e(this).data("star-rating",i=new n(e(this),r))}if(typeof r==="string"){return i[r].apply(i,t)}})}})})(window.jQuery,window);$(function(){return $(".starrr").starrr()})

        $('#new-review').autosize({append: "\n"});

        var reviewBox = $('#post-review-box');
        var newReview = $('#new-review');
        var openReviewBtn = $('#open-review-box');
        var closeReviewBtn = $('#close-review-box');
        var ratingsField = $('#ratings-hidden');

        openReviewBtn.click(function(e)
        {
          reviewBox.slideDown(400, function()
            {
              $('#new-review').trigger('autosize.resize');
              newReview.focus();
            });
          openReviewBtn.fadeOut(100);
          closeReviewBtn.show();
        });

        closeReviewBtn.click(function(e)
        {
          e.preventDefault();
          reviewBox.slideUp(300, function()
            {
              newReview.focus();
              openReviewBtn.fadeIn(200);
            });
          closeReviewBtn.hide();

        });

        $('.starrr').on('starrr:change', function(e, value){
          ratingsField.val(value);
        });

        if('${dsProduct.PRODUCT_COUNT}' == 0){
        	$("#buyBtn").attr("disabled", true);
        	$("#cartBtn").attr("disabled", true);
        }
    });

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
<body>
	<jsp:include page="/common/top.jsp"></jsp:include>
	<div class="wrap">
		<!-- desktop버전  -->
		<div class="desktop">
			<div class="img-responsive center-block"
				style='background-image: url("${context}/backgroundImage/PRODUCT.png");'>
				<div class="boardText1">
					<h3 class="boardTitle1">PRODUCT</h3>
					<!-- <p class="boardSub1">perfume</p> -->
				</div>
			</div>
		</div>
		<!-- mobile버전  -->
		<div class="mobile">
			<div class="mobileImg img-responsive center-block"
				style='background-image: url("${context}/backgroundImage/PRODUCT.png");'>
				<div class="boardText2">
					<h3 class="boardTitle2">PRODUCT</h3>
					<!-- <p class="boardSub2">perfume</p> -->
				</div>
			</div>
		</div>

		<div class="container">
			<div class="row">
				<h3 class="panel-title" style="font-size:24px; float: left; margin-left:173px; margin-bottom:16px; margin-top: 198px; ">
							<%-- &nbsp;${dsProduct.PRODUCT_CATEGORY_CD_NM}&nbsp;${dsProduct.PRODUCT_NAME} --%>
							제품명</h3>
					</div>
					<div class="panel-body">
						<div class="row">
							<div class="col-md-6" align="center">
								<%-- <img id="image" src="${context}/penImg/p1.png" class="img-rounded img-responsive"> --%>
								<div id="image" class="img-responsive" style='background-image: url("${context}/penImg/p1.png");'></div>
									<script type="text/javascript">
									 	var productCategoryCd = '${dsProduct.PRODUCT_CATEGORY_CD}';
				
										if(productCategoryCd == 'O'){
											imageFolder = "officeImg";
										}else if(productCategoryCd == 'P'){
											imageFolder = "penImg";
										}else if(productCategoryCd == 'S'){
											imageFolder = "storageImg";
										}else if(productCategoryCd == 'D'){
											imageFolder = "designImg";
										}else if(productCategoryCd == 'B'){
											imageFolder = "binderImg";
										}
										path = $("#image").attr("src");
				
										existFolder = path.split("/")[2];
										$("#image").attr("src", path.replace(existFolder, imageFolder));
									</script>
							</div>
					
							<div class="col-md-6">
								<table class="table table-user-information">
									<tbody>
										<tr>
											<td>제품명</td>
											<td>${dsProduct.PRODUCT_NAME}</td>
										</tr>
										<tr>
											<td>판매가</td>
											<td id="price">${dsProduct.PRODUCT_UNIT_PRICE}원</td>
										</tr>
										<tr>
											<td>평점</td>
											<td><c:if test="${dsProduct.MARK_RATING == null}">없음</c:if>
												<%-- <c:if test="${dsProduct.MARK_RATING != null}">${dsProduct.MARK_RATING}점&nbsp;&nbsp;<font
														color="lightgray">5점만점</font>
												</c:if></td> --%>
										</tr>
										<tr>
											<td>남은 수량</td>
											<td id="stock">${dsProduct.PRODUCT_COUNT}개</td>
										</tr>
										<tr>
											<td>제품 등록일</td>
											<td>${dsProduct.PRODUCT_REG_DATE}</td>
										</tr>
										<tr>
											<td style="vertical-align: middle;">수량</td>
											<td>
												<div class="input-group number-spinner"
													style="width: 150px;">
													<span class="input-group-btn data-dwn">
														<button class="btn btn-default" data-dir="dwn"
															style="border: none;">
															<span class="glyphicon glyphicon-minus"></span>
														</button>
													</span> <input type="text" class="form-control text-center"
														value="1" min="1" max="100" width="100%"
														disabled="disabled" style="border: none;"> <span
														class="input-group-btn data-up">
														<button class="btn btn-default" data-dir="up"
															style="border: none;">
															<span class="glyphicon glyphicon-plus"></span>
														</button>
													</span>
												</div>
											</td>
										</tr>
									</tbody>
								</table>
								<div>
									<!-- 구매하기 버튼 -->
									<button id="buyBtn" type="button" class="btn" onclick="fn_buy()" 
									style="margin-right: 34px !important;">구매하기</button>
									<!-- 장바구니 버튼 -->
									<button id="cartBtn" type="button" class="btn" onclick="fn_cart()">
									장바구니</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

	<div class="container">
		<div class="text-center" id="product-info" style="margin-top: 137px !important;">
			What is Ipsum?
		</div>
		<div class="text-center" id="about-product">Lorem ipsum dolor
			sit amet consectetur adipisicing elit. Placeat numquam neque
			temporibus veniam distinctio, necessitatibus alias porro tenetur,
			facilis, iure itaque corporis quibusdam reiciendis aliquam rem
			adipisci. Facilis, nihil repudiandae!</div>
	
		<div id="image" class="img-responsive" style='background-image: url("${context}/backgroundImage/shopperbag.png");'></div>
	
		<div class="text-center" id="product-info">
			What is Ipsum?
		</div>
		
		<div class="text-center" id="about-product" >Lorem ipsum dolor
			sit amet consectetur adipisicing elit. Placeat numquam neque
			temporibus veniam distinctio, necessitatibus alias porro tenetur,
			facilis, iure itaque corporis quibusdam reiciendis aliquam rem
			adipisci. Facilis, nihil repudiandae!</div>
	</div>

<div class="container" style="margin-top: 122px;">

	<div class="container"  style="display: flex;">
		<h1 class="review" style="font-family: 'Noto Sans KR'; font-style: normal; font-size: 25px;  margin-left: 136px;">상품평</h1>
	   	<c:if test="${sessionScope.userCode == dsReplyList.USER_CODE}">
	      <span class="pull-right">
	      	<a data-original-title="attr this user" data-toggle="tooltip" type="button" class="btn" 
	        onclick="javascript:fn_attr('${dsReplyList.USER_REPLY_NO}')" id="reviewBtn">상품평 등록하기</a>
	   	  </span>
		</c:if>
	</div>
	<hr style="border: 1px solid #D7D8DA; margin-top:34px;">
	<c:if test="${sessionScope.userCode == dsReplyList.USER_CODE}">	        
	       <span class="pull-right">
	             <a data-original-title="Remove this user" data-toggle="tooltip" type="button" class="btn" 
	             onclick="javascript:fn_remove('${dsReplyList.USER_REPLY_NO}')" id="reviewBtn" 
	             style="margin-bottom: 70px;">상품평 등록하기</a>
	      	</span>
	</c:if>
				
	    <div style="margin-left: 136px; margin-top: 80px;">
			<input type="text" id="userId" name="userId" value="${dsReplyList.USER_ID}" placeholder="유저 아이디"; style="border: none;">
	    </div>
		            
		<div style="margin-left: 136px; margin-top: 42px; margin-bottom: 70px;">
			<input type="text" id="userReply" name="userReply" value="${dsReplyList.USER_REPLY}" placeholder="내용"; style="border: none;">
			<input type="hidden" id="productCode" name="productCode" value="${dsProduct.PRODUCT_CODE}">
			<input type="hidden" id="markYn" name="markYn" value="${dsProduct.MARK_YN}">
			<input type="hidden" id="replyDate" name="replyDate" value="${dsReplyList.REPLY_DATE}">
		</div>
	<hr style="border: 1px solid #D7D8DA; margin-top:34px;">
	
	<c:if test="${sessionScope.userCode == dsReplyList.USER_CODE}">	        
        <span class="pull-right">
              <a data-original-title="Remove this user" data-toggle="tooltip" type="button" class="btn" 
              onclick="javascript:fn_remove('${dsReplyList.USER_REPLY_NO}')" id="reviewBtn" 
              style="display:flex; margin-right: 38px; margin-bottom: 70px;">상품평 삭제하기</a>
       	</span>
	</c:if>
				
    <div style="margin-left: 136px; margin-top: 80px;">
	<%-- ${dsReplyList.USER_ID} --%>
	유저 아이디					
    </div>
        
	<div style="margin-left: 136px; margin-top: 42px; margin-bottom: 70px;">
	<%-- ${dsReplyList.USER_REPLY} --%>내용
		<input type="hidden" id="productCode" name="productCode" value="${dsProduct.PRODUCT_CODE}">
		<input type="hidden" id="markYn" name="markYn" value="${dsProduct.MARK_YN}">
		<input type="hidden" id="replyDate" name="replyDate" value="${dsReplyList.REPLY_DATE}">
		<input type="hidden" id="replyCount" name="replyCount" value="${dsReplyList[0].REPLY_COUNT}">
	</div>
	
<!-- <button class="btn" style="float: right;" onclick="fn_back()">뒤로가기</button> -->

</div>
<jsp:include page="/common/foot.jsp"></jsp:include>
</body>
<style type="text/css">
.wrap {
	background-color: #fff;
}
/*form 제목*/
.form-horizontal .control-label {
	padding-top: 7px;
	margin-bottom: 8px;
	text-align: inherit !important;
}

/*Writer Text*/
.textbox {
	width: 100%;
	height: 50px;
	border-bottom: 1px solid #b9b9b9;
	padding: 0 40px 0 40px;
}

.title {
	float: left;
	font-size: 12px;
}

.people {
	float: right;
	font-size: 18px;
	font-weight: bold;
}

.subtext {
	width: 100%;
	height: 350px;
	margin: 30px 0 0 0;
	padding: 0 40px 0 40px;
	clear: both;
}
</style>

</html>