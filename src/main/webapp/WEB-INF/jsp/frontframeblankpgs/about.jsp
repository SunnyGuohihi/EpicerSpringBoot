<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- /////// (關於我們)--有時間再修改XD ///////-->

<!-- //////**極重要!!!!不可少//////<html> + <head> + <link>//////// -->
<%@include file="../frontpartials/frontheaderlink.jsp" %>
</head>
<body id="body">

<!-- 主文內容 開始 -->

<!-- /////// 超級重要!!!!Navbar 1+2 要連放一起!! (1)聯絡電話 + 購物車 + 商品搜尋 (2)首頁連動，大家串聯在這，最最後要討論串連的地方///// -->
<%@include file="../frontpartials/frontheadernavigation.jsp" %>
<%@include file="../frontpartials/frontheadernavigationtwo.jsp" %>

<!-- /////// 可抽換連結分頁回首頁(客製化/個人化)(類似分頁標籤) ///////  -->
<jsp:include page="../frontpartials/pageheader.jsp" flush="true">
<jsp:param name="title" value="關於我們" />
<jsp:param name="pagination" value="Epic-ER緣起" />
</jsp:include>


<section class="about section">
	<div class="container">
		<div class="row">
			<div class="col-md-6">
				<img class="img-responsive" src="./source/images/about/about.jpg">
			</div>
			<div class="col-md-6">
				<h2 class="mt-40">About Our Shop 關於我們的Epic-ER </h2>
				<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Eius enim, accusantium repellat ex autem numquam iure officiis facere vitae itaque.</p>
				<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nam qui vel cupiditate exercitationem, ea fuga est velit nulla culpa modi quis iste tempora non, suscipit repellendus labore voluptatem dicta amet?</p>
				<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nam qui vel cupiditate exercitationem, ea fuga est velit nulla culpa modi quis iste tempora non, suscipit repellendus labore voluptatem dicta amet?</p>
				<a href="contact.html" class="btn btn-main mt-20">Download Company Profile</a>
			</div>
		</div>
		<div class="row mt-40">
			<div class="col-md-3 text-center">
				<img src="./source/images/about/awards-logo.png">
			</div>
			<div class="col-md-3 text-center">
				<img src="./source/images/about/awards-logo.png">
			</div>
			<div class="col-md-3 text-center">
				<img src="./source/images/about/awards-logo.png">
			</div>
			<div class="col-md-3 text-center">
				<img src="./source/images/about/awards-logo.png">
			</div>
		</div>
	</div>
</section>
<section class="team-members ">
	<div class="container">
		<div class="row">
			<div class="title"><h2>Team Members</h2></div>
		</div>
		<div class="row">
			<div class="col-md-3">
				<div class="team-member text-center">
					<img class="img-circle" src="./source/images/team/team-1.jpg">
					<h4>Jonathon Andrew</h4>
					<p>Founder</p>
				</div>
			</div>
			<div class="col-md-3">
				<div class="team-member text-center">
					<img class="img-circle" src="./source/images/team/team-2.jpg">
					<h4>Adipisci Velit</h4>
					<p>Developer</p>
				</div>
			</div>
			<div class="col-md-3">
				<div class="team-member text-center">
					<img class="img-circle" src="./source/images/team/team-3.jpg">
					<h4>John Fexit</h4>
					<p>Shop Manager</p>
				</div>
			</div>
			<div class="col-md-3">
				<div class="team-member text-center">
					<img class="img-circle" src="./source/images/team/team-1.jpg">
					<h4>John Fexit</h4>
					<p>Shop Manager</p>
				</div>
			</div>
		</div>
	</div>
</section>


<div class="section video-testimonial bg-1 overly-white text-center mt-50">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<h2>Video presentation</h2>
				<a class="play-icon" href="https://www.youtube.com/watch?v=oyEuk8j8imI&amp;rel=0" data-toggle="lightbox">
					<i class="tf-ion-ios-play"></i>
				</a>
			</div>
		</div>
	</div>
</div>



<!-- /////// 首頁第五段 - 要連動到外網粉絲頁?instagram?(可以拆掉不使用) ///// -->
<%@include file="../frontpartials/footer.jsp" %>

<!-- 主文內容 結束 -->

<!-- //////**極重要!!!!不可少//////<script>//////// -->
<%@include file="../frontpartials/frontscripttobodyend.jsp" %>

</body>
</html>