<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- //////  商品網 (無推播)  //////// -->  

<!-- //////**極重要!!!!不可少//////<html> + <head> + <link>//////// -->
<%@include file="../frontpartials/frontheaderlink.jsp" %>
</head>
<body id="body">

<!-- 主文內容 開始 -->
<!-- /////// 超級重要!!!!Navbar 1+2 要連放一起!! (1)聯絡電話 + 購物車 + 商品搜尋 (2)首頁連動，
大家串聯在這，最最後要討論串連的地方///// -->
<%@include file="../frontpartials/frontheadernavigation.jsp" %>
<%@include file="../frontpartials/frontheadernavigationtwo.jsp" %>

<!-- /////// 可抽換連結分頁回首頁(客製化/個人化)(類似分頁標籤) /////// -->
<jsp:include page="../frontpartials/pageheader.jsp" flush="true">
<jsp:param name="title" value="商品" />
<jsp:param name="pagination" value="食材分類(?)" />
</jsp:include>



<section class="products section">
	<div class="container">
		<div class="row">
			<!-- ///////////////   商品顯示頁面 (多頁) --可用在首頁(第三段) & 商品頁 ///////////// -->
			<!-- @@include('blocks/product.htm') -->
			<%@include file="../frontpartials/product.jsp" %>
			<!-- ////// 商品熱門熱銷榜(新增補充) ////// -->
			<%@include file="../frontpartials/featureditems.jsp" %>
			<!-- ////// 商品推薦區(也算是熱銷榜)(新增補充) ////// -->
			<%@include file="../frontpartials/recentitems.jsp" %>

			
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