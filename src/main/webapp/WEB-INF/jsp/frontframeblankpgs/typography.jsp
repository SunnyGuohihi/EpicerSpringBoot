<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- ////// 樣板小工具-3: 文字模板 /////// -->

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
<jsp:param name="title" value="字型模板" />
<jsp:param name="pagination" value="字型模板" />
</jsp:include>

<section class="typography page-wrapper">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<h1 class="text-center">Typography (Heading) </h1>
				<hr>
				<h1>H1 Heading</h1>
				<h2>H2 Heading</h2>
				<h3>H3 Heading</h3>
				<h4>H4 Heading</h4>
				<h5>h5 Heading</h5>
				<h6>h6 Heading</h6>
				<h1 class="text-center mt-20">Paragraph</h1>
				<hr>
				<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Labore fugiat voluptas accusamus! Perspiciatis quam quisquam iste id officiis quia commodi quibusdam sapiente molestiae! Aliquam tempore ad quis, culpa sit ullam quam inventore voluptatum necessitatibus numquam! Tempora nobis iure cupiditate excepturi aliquid earum ratione dignissimos, a consequatur odio quo aut rem voluptatem quam repellat sint, eligendi facilis maiores unde, soluta quos, veritatis sit. Dolore deleniti dolorum repellendus dolorem cum, unde architecto consectetur odit rem eveniet, accusantium omnis suscipit totam quibusdam officiis blanditiis molestiae! Totam ipsam temporibus aspernatur praesentium quam, laboriosam ipsa rem. Maxime repudiandae molestias in consequuntur sint, dicta? Temporibus, fugiat!</p>
				<h1 class="text-center mt-20">Blockquote</h1>
				<hr>
				<BLOCKQUOTE>
					Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quae rem ut veritatis quisquam doloribus nam excepturi, deserunt odit, aut. Possimus blanditiis culpa natus eius non molestias nihil praesentium, vel ullam dolorum qui, quibusdam minima placeat officiis quod dolorem perferendis dicta harum ab obcaecati nemo! Quisquam, porro qui tempora, ducimus aspernatur vitae odit aliquid soluta eius tenetur, atque minima error est officiis itaque nobis voluptate? Modi aliquid reiciendis perspiciatis totam asperiores consequuntur sint molestias. Error quas quod voluptatem eligendi modi asperiores ipsam nemo, obcaecati provident omnis nisi dolorem aliquam sapiente, quidem, porro quo id fuga! Recusandae blanditiis aliquid repudiandae animi officia.
				</BLOCKQUOTE>
				
			</div>
		</div>
	</div>
</section>
			---------------------------其他補充功能------------------------------------------------------------<hr>
			---------------------------about.jsp：公司介紹-----------------------------------------------------
			<%@include file="../frontpartials/about.jsp" %><hr>
			
			---------------------------featureditems.jsp：這是商品頁分類區(熱銷榜)------------------------------
			<%@include file="../frontpartials/featureditems.jsp" %><hr>
			---------------------------blog.jsp：部落格文章推薦專區--------------------------------------------
			<%@include file="../frontpartials/blog.jsp" %><hr>
			<br>
<!-- 			---------------------------pricing.jsp：長得很像是官方收費的頁面@___@ (感覺不實用)------------------- -->
<%-- 			<%@include file="../frontpartials/pricing.jsp" %><br><br> --%>

			---------------------------productsidebar.jsp:  Collapse 的功能------------------------------------
			<%@include file="../frontpartials/productsidebar.jsp" %><hr>
			
			---------------------------recentitems.jsp：商品推薦區(也算是熱銷榜)--------------------------------
			<%@include file="../frontpartials/recentitems.jsp" %><hr>
			
			---------------------------rightbar.jsp: 公司資訊------------------------------------------------------------
			<%@include file="../frontpartials/rightbar.jsp" %><hr>

<!-- 			---------------------------slider.jsp 滾動畫面 1 --不好用------------------------------------------- -->
<%-- 			<%@include file="../frontpartials/slider.jsp" %> --%>
			
			---------------------------slidertwo.jsp- 滾動畫面 2-----------------------------------------------
			
			<%@include file="../frontpartials/slidertwo.jsp" %><hr>



<!-- /////// 首頁第五段 - 要連動到外網粉絲頁?instagram?(可以拆掉不使用) ///// -->
<%@include file="../frontpartials/footer.jsp" %>

<!-- 主文內容 結束 -->

<!-- //////**極重要!!!!不可少//////<script>//////// -->
<%@include file="../frontpartials/frontscripttobodyend.jsp" %>

</body>
</html>