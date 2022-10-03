<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- ////// 樣板小工具-1: 示警 /////// -->

<!-- //////**極重要!!!!不可少//////<html> + <head> + <link>//////// -->
<%@include file="../frontpartials/frontheaderlink.jsp" %>
</head>
<body id="body">

<!-- 主文內容 開始 -->
<!-- /////// 超級重要!!!!Navbar 1+2 要連放一起!! (1)聯絡電話 + 購物車 + 商品搜尋 (2)首頁連動，大家串聯在這，最最後要討論串連的地方///// -->
<%@include file="../frontpartials/frontheadernavigation.jsp" %>
<%@include file="../frontpartials/frontheadernavigationtwo.jsp" %>




<section class="alerts section">
	<div class="container">
		<div class="row">
			<div class="section-title text-center">
				<h2>Alert Styles</h2>
			</div>
		</div>
		<div class="row mt-30">
			<div class="col-xs-12">
	            <div class="alertPart">
		            <div class="alert alert-success alert-common" role="alert"><i class="tf-ion-thumbsup"></i><span>Well done!</span> You succesfully read this message</div>
		            <div class="alert alert-info alert-common" role="alert"><i class="tf-ion-android-checkbox-outline"></i><span>Warning!</span> Better check yourself.You are not looking too good</div>
		            <div class="alert alert-warning alert-common" role="alert"><i class="tf-ion-alert-circled"></i><span>Warning!</span> Better check yourself.You are not looking too good</div>
		            <div class="alert alert-danger alert-common" role="alert"><i class="tf-ion-close-circled"></i><span>Warning!</span> Better check yourself.You are not looking too good</div>
	            </div>
	            <div class="alertPart mt-50">
		            <div class="alert alert-success alert-common alert-solid" role="alert"><i class="tf-ion-thumbsup"></i><span>Well done!</span> You succesfully read this message</div>
		            <div class="alert alert-info alert-common alert-solid" role="alert"><i class="tf-ion-android-checkbox-outline"></i><span>Warning!</span> Better check yourself.You are not looking too good</div>
		            <div class="alert alert-warning alert-common alert-solid" role="alert"><i class="tf-ion-alert-circled"></i><span>Warning!</span> Better check yourself.You are not looking too good</div>
		            <div class="alert alert-danger alert-common alert-solid" role="alert"><i class="tf-ion-close-circled"></i><span>Warning!</span> Better check yourself.You are not looking too good</div>
	            </div>
	            <div class="alertPart mt-50">
		            <div class="alert alert-success alert-common alert-dismissible " role="alert">
		            	<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		            	<i class="tf-ion-thumbsup"></i><span>Well done!</span> You succesfully read this message
		            </div>
		            <div class="alert alert-info alert-common alert-dismissible" role="alert">
		            	<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		            	<i class="tf-ion-android-checkbox-outline"></i><span>Warning!</span> Better check yourself.You are not looking too good
		            </div>
		            <div class="alert alert-warning alert-common alert-dismissible" role="alert">
		            	<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		            	<i class="tf-ion-alert-circled"></i><span>Warning!</span> Better check yourself.You are not looking too good
		            </div>
		            <div class="alert alert-danger alert-common alert-dismissible" role="alert">
		            	<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		            	<i class="tf-ion-close-circled"></i><span>Warning!</span> Better check yourself.You are not looking too good
		            </div>
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