<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- //////  首頁 ////// -->
 
<!-- //////**極重要!!!!不可少//////<html> + <head> + <link>//////// -->
<%@include file="../frontpartials/frontheaderlink.jsp" %>
</head>
<body id="body">


<!-- 主文內容 開始 -->
<!-- /////// 超級重要!!!!Navbar 1+2 要連放一起!! (1)聯絡電話 + 購物車 + 商品搜尋 (2)首頁連動，
大家串聯在這，最最後要討論串連的地方///// -->
<%@include file="../frontpartials/frontheadernavigation.jsp" %>
<%@include file="../frontpartials/frontheadernavigationtwo.jsp" %>

<!-- /////// 首頁的第一段滑動畫面(可做為食譜/商品/課程/論壇 滾動輪播) ///// -->
<%@include file="../frontpartials/heroslider.jsp" %>

<!-- /////// 首頁第二段(商品三分類畫面) ///// -->
<%@include file="../frontpartials/category.jsp" %>


<section class="products section bg-gray">
	<div class="container">
		<div class="row">
			<div class="title text-center">
				<h2>Trendy Products</h2>
			</div>
		</div>
		<div class="row">
		<!-- /////// 商品顯示頁面 (多頁)->可用在首頁(第三段) & 商品頁///// -->
			<%@include file="../frontpartials/product.jsp" %>
		</div>
	</div>
</section>

<!-- /////// 首頁第四段-寄送廣告訊息(email) - 可以食譜使用(or其他人?) ///// -->
<%@include file="../frontpartials/calltoaction.jsp" %>

<!-- /////// 首頁第五段 - 要連動到外網粉絲頁?instagram?(可以拆掉不使用) ///// -->
<%@include file="../frontpartials/instagramfeed.jsp" %>

<!-- /////// 首頁第五段 - 要連動到外網粉絲頁?instagram?(可以拆掉不使用) ///// -->
<%@include file="../frontpartials/footer.jsp" %>

<!-- 主文內容 結束 -->

<!-- //////**極重要!!!!不可少//////<script>//////// -->
<%@include file="../frontpartials/frontscripttobodyend.jsp" %>

</body>
</html>