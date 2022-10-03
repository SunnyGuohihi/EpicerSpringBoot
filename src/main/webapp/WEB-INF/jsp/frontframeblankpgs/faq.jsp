<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- //////  常見問題FAQ /////// -->

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
<jsp:param name="title" value="常見問題" />
<jsp:param name="pagination" value="FAQ" />
</jsp:include>

<section class="page-wrapper">
	<div class="container">
		<div class="row">
			<div class="col-md-4">
				<h2>Frequently Asked Questions</h2>
				<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sequi, repudiandae.</p>
				<p>admin@mail.com</p>
			</div>
			<div class="col-md-8">
				<h4>Order Status</h4>
				<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptas iusto, alias, tempora fuga quam eveniet neque excepturi aliquid. Eligendi, mollitia.</p>
				<h4>Shipping & Delivery</h4>
				<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ipsam voluptatibus, incidunt similique nobis sint quisquam nam ab error consequuntur sit ullam ex eum exercitationem, excepturi explicabo beatae eos aspernatur odit ad perspiciatis, neque saepe magni enim. Maiores quia, quae sequi.</p>
				<h4>Payments</h4>
				<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Repellendus repellat id, laboriosam ipsa repudiandae quisquam, suscipit officiis, praesentium itaque facilis distinctio dolorum. Velit reiciendis libero laudantium corporis, delectus impedit sunt.</p>
				<h4>Returns & Exchanges</h4>
				<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Veniam eaque nam, ab voluptas et debitis sint hic vel ratione dignissimos.</p>
				<h4>Privacy Policy</h4>
				<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Beatae blanditiis quod saepe, inventore ipsum sint cum iste quae ratione nobis laborum minima autem totam similique, quia neque deleniti! Provident, suscipit.</p>
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