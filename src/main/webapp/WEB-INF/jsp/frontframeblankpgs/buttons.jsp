<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- ////// 樣板小工具-2: 按鈕 /////// -->

<!-- //////**極重要!!!!不可少//////<html> + <head> + <link>//////// -->
<%@include file="../frontpartials/frontheaderlink.jsp" %>
</head>
<body id="body">


<!-- 主文內容 開始 -->

<!-- /////// 超級重要!!!!Navbar 1+2 要連放一起!! (1)聯絡電話 + 購物車 + 商品搜尋 (2)首頁連動，大家串聯在這，最最後要討論串連的地方///// -->
<%@include file="../frontpartials/frontheadernavigation.jsp" %>
<%@include file="../frontpartials/frontheadernavigationtwo.jsp" %>




<section class="buttons section">
	<div class="container">
		<div class="row">
			<div class="section-title text-center">
				<h2>Button Styles</h2>
			</div>
		</div>
		<div class="row mt-30">
			<div class="col-md-12">
	            <div class="buttonPart">
	              <ul class="list-inline">
	                <li class="li"><a href="#!" class="btn btn-main btn-large">Default Button</a></li>
	                <li class="li"><a href="#!" class="btn btn-main btn-medium">Default Button</a></li>
	                <li class="li"><a href="#!" class="btn btn-main btn-icon"><i class="tf-ion-ios-cart-outline"></i>Default Button</a></li>
	                <li class="li"><a href="#!" class="btn btn-main btn-small">Default Button</a></li>
	              </ul>
	              <ul class="list-inline mt-10">
	                <li class="li"><a href="#!" class="btn btn-main btn-large btn-round">Round Button</a></li>
	                <li class="li"><a href="#!" class="btn btn-main btn-medium btn-round">Round Button</a></li>
	                <li class="li"><a href="#!" class="btn btn-main btn-medium btn-round btn-icon"><i class="tf-ion-ios-cart-outline"></i>Round Button</a></li>
	                <li class="li"><a href="#!" class="btn btn-main btn-small btn-round">Round Button</a></li>
	              </ul>
	              <ul class="list-inline mt-10">
	                <li class="li"><a href="#!" class="btn btn-main btn-large btn-round-full">Full Round Button</a></li>
	                <li class="li"><a href="#!" class="btn btn-main btn-medium btn-round-full  btn-icon"><i class="tf-ion-ios-cart-outline"></i>Full Round Button</a></li>
	                <li class="li"><a href="#!" class="btn btn-main btn-small btn-round-full">Full Round Button</a></li>
	              </ul>
	            </div>
	        </div>		
		</div>
	</div>
</section>





<!-- /////// 首頁第五段 - 要連動到外網粉絲頁?instagram?(可以拆掉不使用) ///// -->
<%@include file="../frontpartials/footer.jsp" %>
<!-- 主文內容 結束 -->

<!-- //////**極重要!!!!不可少//////<script>//////// -->
<%@include file="../frontpartials/frontscripttobodyend.jsp" %>

</body>
</html>