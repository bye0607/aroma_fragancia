<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var ="context"><%=request.getContextPath()%></c:set>
<meta charset="UTF-8">

<title>구매내역 페이지</title>
<link href="${context}/css/bootstrap.min.css" rel="stylesheet">
<link href="${context}/css/bootstrap-theme.css" rel="stylesheet">
<link href="${context}/css/common.css" rel="stylesheet">
<script src="${context}/js/bootstrap.min.js"></script>
<script src="${context}/js/jquery-1.9.1.js"></script>
</head>


<script type="text/javascript"></script>
<body>
<jsp:include page="${context}/common/top.jsp"></jsp:include>
<!-- title, visual start -->
<div class="titarea" style='background-image: url("${context}/img/subbg_service.png");'>
	<div class="boardText">
		<h3 class="boardTitle">FAQ</h3>
		<p class="boardSub">자주 묻는 질문</p>
	</div>
</div>
<!-- title, visual end -->
	<!-- FAQ start -->
	<div class=FAQ_wrap>
	<h1 class="FAQ_Text"><strong>FAQ</strong></h1>
<div class="FAQ">
	<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
  <div class="panel">
    <div class="panel-heading" role="tab" id="headingOne">
      <h4 class="panel-title">
        <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
            <div><p>Q 주문한 상품은 언제 배송되나요?</p><p class=place1>&nbsp;<strong class="right_Text">AROMA</strong></p></div>
        </a>
      </h4>
    </div>
    <div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
      <div class="panel-body">
       AROMA,FRAGNCIA 사이트내 모든 상품[품절상품제외] 주문 및 결제완료 후 익일 출고[주말제외] 됩니다.<br>
				AROMA,FRAGNCIA 디퓨저 상품은 국내본사공장에서 직접 생산하여 출고가 되므로<br>
				주문량이 많은 시즌(설날/어버이날/추석/크리스마스)에는 배송일이 지연될 수 있는 점 양해부탁드립니다<br>
				<strong>*대량 주문의 경우 생산준비 및 배송방법에 따라 일반 상품의 배송기간과 다르니 참고해주세요</strong>
      </div>
    </div>
  </div>
  <div class="panel">
    <div class="panel-heading" role="tab" id="headingTwo">
      <h4 class="panel-title">
        <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
            <div><p>Q 디퓨저 어떻게 사용하나요?</p><p class=place1>&nbsp;<strong class="right_Text">AROMA</strong></p></div>
        </a>
      </h4>
    </div>
    <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
      <div class="panel-body">
            	<strong>1.본품 뚜껑을 돌려서 열어줍니다.<br></strong>
			  	<strong>2.유리병용기을 손으로 잡고 가위등을 이용하여 속마개를 잡고 비틀어 분리합니다.<br></strong>
				(﻿용액이 새는 것을 방지하기 위해 고무마개가 꽉 끼워져있으므로 속마개의 틈사이를 이용해 조심히 분리하시길 권합니다)<br>
				<strong>3.속마개 분리 후 뚜껑을 다시 닫아줍니다.<br></strong>
				<strong>4.섬유스틱을 취향에 맞게 꽂아줍니다.<br></strong>
				(취향에 맞게 스틱의 갯수로 발향을 조절해주세요. 처음에는 2~3개로 시작하는것이 좋습니다.) 
      </div>
    </div>
  </div>
   <div class="panel">
    <div class="panel-heading" role="tab" id="headingThree">
      <h4 class="panel-title">
        <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
            <div><p>Q 교환및 반품 절차에 대해</p><p class=place1>&nbsp;<strong class="right_Text">AROMA</strong></p></div>
        </a>
      </h4>
    </div>
    <div id="collapseThree" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree">
      <div class="panel-body">
        	<h4><strong><p class="text-danger">고객님께서 제품 개봉 후 사용중에(고객과실) 발생한 하자 상품에 한해서는 교환 및 반품이 불가합니다.</p></strong></h4><br>
			교환 및 반품 접수시 게시판에 글을 올려주시거나 고객센터(02-4234-5234)로 문의해주세요.<br>
			<br>
			상품 수령직 후 상품 불량 및 파손,훼손으로 인한 사유는 교환 및 반품이 가능합니다.<br>
			(상품을 받은 후 즉시 확인 하신 후 연락바랍니다.)<br>
			<br>
			업체오배송및 제품하자 교환 : 배송비 업체부담<br>
			배송 받으신 상품의 내용이 다르거나 상품의 하자가 있는 경우에는 배송된 날로부터 7일 이내에 반품이 가능합니다.<br>
			<br>
			고객 단순변심 반품 : 배송비 고객부담 (5,000원) <br>
			단순 고객변심으로 인한 반품은 상품을 받은 후 미사용한 경우에만 해당되며, 왕복택배비는 고객님께서 부담해주셔야 합니다.<br>
			<br>
			*택배비 지불방법<br>
			-보내주시는 택배 안에 택배비가 빠지지 않게 잘 동봉하여 넣어주세요.<br>
	      </div>
      </div>
    </div>


  <div class="panel">
    <div class="panel-heading" role="tab" id="headingFour">
      <h4 class="panel-title">
        <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseFour" aria-expanded="false" aria-controls="collapseFour">
			 <div><p>Q 디퓨저를 꽂았는데 발향이 잘 되지 않아요</p><p class=place1>&nbsp;<strong class="right_Text">AROMA</strong></p></div>
        </a>
      </h4>
    </div>
    <div id="collapseFour" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingFour">
      <div class="panel-body">
        <strong>1. 향이 약한 것 같아요.<br></strong>
				발향은 개인취향 및 사용법,주변환경에 따라 달라질수있습니다.<br>
				향이 약하다 느껴지신다면 주기적으로 꽂아주신 스틱을 거꾸로 꽂아 주시게되면 좀더 풍부한향을 느끼실수 있습니다. 스틱이 오래되어 이미 용액을 다 흡수한 경우 새로운 스틱을 구매하여 꽂아주세요.<br>
				<br>
				<strong>2.처음 열었을 때 향이 이상해요.<br></strong>
				제품 수령하시고 1~2일정도는 배송되는 과정에 제품이 흔들려서 첫 개봉시에 향으로인한 불편함을 겪으실수 있으나 하루정도 지나면 본향을 느끼실수가 있으며 제품의 향강도는 스틱의수를 통해 조절하실수가 있습니다.<br>
				스틱은 주기적으로 한번씩 뒤집어 주시면 좀더 풍부한 향을 느끼실수가 있습니다.<br>
				<br>
				<strong>3.전에 샀던 디퓨저와 향이 다른것 같아요.<br></strong>
				향은 주변환경,사용법,개인차에 따라 많이 달라지는 제품입니다.<br>
				디퓨저 제품은 본사 공장내 자체생산하고 있으며 베이스 및 오일원액의 원료,배합률은 변경된 사항이 없습니다. 향 업그레이드 이유로 배합이 변경되는 경우 향변경에 대한 안내문을 공지합니다.
      </div>
    </div>
  </div>
  <div class="panel">
    <div class="panel-heading" role="tab" id="headingFive">
      <h4 class="panel-title">
        <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseFive" aria-expanded="false" aria-controls="collapseFive">
           <div><p> Q 배송전 주문취소는 어떻게 하나요?</p><p class=place1>&nbsp;<strong class="right_Text">AROMA</strong></p></div>
        </a>
      </h4>
    </div>
    <div id="collapseFive" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingFive">
      <div class="panel-body">
            	      	<strong>사이트 자체 내에서는 입금 전 주문취소만 가능합니다.</strong><br>
			입금 후에는 게시판이나 고객센터로 문의주시면 신속한 처리 해드리도록 노력하겠습니다.<br>
			
			주문취소방법<br>
			로그인 -> 상단의 주문조회 -> 주문내역에서 해당상품의 주문상세 조회 클릭(상품명 오른쪽에 위치)<br>
			->주문내역 맨 아랫부분의 주문취소를 클릭하시면 정상적으로 주문취소가 접수 됩니다.<br>
      </div>
    </div>
  </div>
  <div class="panel">
    <div class="panel-heading" role="tab" id="headingSix">
      <h4 class="panel-title">
        <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseSix" aria-expanded="false" aria-controls="collapseSix">
            <div><p>Q 제조날짜가 어떻게 되나요?</p><p class=place1>&nbsp;<strong class="right_Text">AROMA</strong></p></div>
        </a>
      </h4>
    </div>
    <div id="collapseSix" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingSix">
      <div class="panel-body">
            	      	<strong>생산시 제조날짜가 매일 자동화 기계로 기재되어 생산됩니다.</strong><br>
			<br>
			1.기본박스 뒷면 표기사항에는 별도표기로 되어있으나 기계로 따로 찍혀있습니다.(년/월/일)<br>
			2.시즌상품인 경우 뒷면 표기사항에 (년/월)이 인쇄되어 생산됩니다.<br>
      </div>
    </div>
  </div>
</div>
</div>
  </div>
 


	<!-- FAQ end -->
</body>
<style type="text/css">

/*faq css*/
.FAQ{
margin-left: 20%;
margin-right: 20%;
}


/* 배경색 fff 적용 */
.FAQ_wrap{
padding:10%;
background-color: #fff;
}

/* FAQ 글자 위치 지정 */
.FAQ_Text{
margin-left: 20% 
}

.place1{
text-align: right;
}



</style>

<jsp:include page="${context}/common/foot.jsp"></jsp:include>