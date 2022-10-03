<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- ////// 完成訂購畫面  /////// -->

<!-- //////**極重要!!!!不可少//////<html> + <head> + <link>//////// -->
<%@include file="../frontpartials/frontheaderlink.jsp" %>
</head>
<body id="body">

<!-- 主文內容 開始 -->

<!-- /////// 超級重要!!!!Navbar 1+2 要連放一起!! (1)聯絡電話 + 購物車 + 商品搜尋 (2)首頁連動，
大家串聯在這，最最後要討論串連的地方///// -->
<%@include file="../frontpartials/frontheadernavigation.jsp" %>
<%@include file="../frontpartials/frontheadernavigationtwo.jsp" %>

<!-- Page Wrapper -->
<section class="page-wrapper success-msg">
  <div class="container">
    <div class="row">
      <div class="col-md-6 col-md-offset-3">
        <div class="block text-center">
        	<i class="tf-ion-android-checkmark-circle"></i>
          <h2 class="text-center">Thank you! For your payment</h2>
          <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Inventore, sed.</p>
          <a href="shop.html" class="btn btn-main mt-20">Continue Shopping</a>
        </div>
      </div>
    </div>
  </div>
</section><!-- /.page-warpper -->

<!-- /////// 首頁第五段 - 要連動到外網粉絲頁?instagram?(可以拆掉不使用) ///// -->
<%@include file="../frontpartials/footer.jsp" %>
<!-- 主文內容 結束 -->

<!-- //////**極重要!!!!不可少//////<script>//////// -->
<%@include file="../frontpartials/frontscripttobodyend.jsp" %>

</body>
</html>