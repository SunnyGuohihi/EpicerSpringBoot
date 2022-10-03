<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- //////   文章(食譜/論壇) 左右編排    ////////// -->    
    
<!-- //////**極重要!!!!不可少//////<html> + <head> + <link>//////// -->
<%@include file="../frontpartials/frontheaderlink.jsp" %>
</head>
<body id="body">>


<!-- 主文內容 開始 -->
<!-- /////// 超級重要!!!!Navbar 1+2 要連放一起!! (1)聯絡電話 + 購物車 + 商品搜尋 (2)首頁連動，大家串聯在這，最最後要討論串連的地方///// -->
<%@include file="../frontpartials/frontheadernavigation.jsp" %>
<%@include file="../frontpartials/frontheadernavigationtwo.jsp" %>

<!-- /////// 可抽換連結分頁回首頁(客製化/個人化)(類似分頁標籤) /////// -->
<jsp:include page="../frontpartials/pageheader.jsp" flush="true">
<jsp:param name="title" value="論壇/食譜" />
<jsp:param name="pagination" value="論壇/食譜" />
</jsp:include>


<div class="page-wrapper">
	<div class="container">
		<div class="row">
      		<div class="col-md-6">
		        <div class="post">
		          <div class="post-thumb">
		            <a href="blog-single.html">
		              <img class="img-responsive" src="./source/images/blog/blog-post-1.jpg" alt="">
		            </a>
		          </div>
		          <h2 class="post-title"><a href="blog-single.html">How To Wear Bright Shoes</a></h2>
		          <div class="post-meta">
		            <ul>
		              <li>
		                <i class="tf-ion-ios-calendar"></i> 20, MAR 2017
		              </li>
		              <li>
		                <i class="tf-ion-android-person"></i> POSTED BY ADMIN
		              </li>
		              <li>
		                <a href="blog-grid.html"><i class="tf-ion-ios-pricetags"></i> LIFESTYLE</a>,<a href="blog-grid.html"> TRAVEL</a>, <a
		                href="blog-grid.html">FASHION</a>
		              </li>
		              <li>
		                <a href="#!"><i class="tf-ion-chatbubbles"></i> 4 COMMENTS</a>
		              </li>
		            </ul>
		          </div>
		          <div class="post-content">
		            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Velit vitae placeat ad architecto nostrum
		              asperiores vel aperiam, veniam eum nulla. Maxime cum magnam, adipisci architecto quibusdam cumque veniam
		              fugiat quae. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Odio vitae ab doloremque accusamus
		              sit, eos dolorum officiis a perspiciatis aliquid. Lorem ipsum dolor sit amet, consectetur adipisicing
		              elit. Quod, facere. </p>
		            <a href="blog-single.html" class="btn btn-main">Continue Reading</a>
		          </div>
				</div>
        	</div>
			<div class="col-md-6">
		        <div class="post">
	          <div class="post-thumb">
	            <a href="blog-single.html">
	              <img class="img-responsive" src="./source/images/blog/blog-post-2.jpg" alt="">
	            </a>
	          </div>
	          <h2 class="post-title"><a href="blog-single.html">Two Ways To Wear Straight Shoes</a></h2>
	          <div class="post-meta">
	            <ul>
	              <li>
	                <i class="tf-ion-ios-calendar"></i> 20, MAR 2017
	              </li>
	              <li>
	                <i class="tf-ion-android-person"></i> POSTED BY ADMIN
	              </li>
	              <li>
	                <a href="blog-left-sidebar.html"><i class="tf-ion-ios-pricetags"></i> LIFESTYLE</a>,<a href="blog-left-sidebar.html"> TRAVEL</a>, <a
	                href="blog-left-sidebar.html">FASHION</a>
	              </li>
	              <li>
	                <a href="#!"><i class="tf-ion-chatbubbles"></i> 4 COMMENTS</a>
	              </li>
	            </ul>
	          </div>
	          <div class="post-content">
	            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Velit vitae placeat ad architecto nostrum
	              asperiores vel aperiam, veniam eum nulla. Maxime cum magnam, adipisci architecto quibusdam cumque veniam
	              fugiat quae. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Odio vitae ab doloremque accusamus
	              sit, eos dolorum officiis a perspiciatis aliquid. Lorem ipsum dolor sit amet, consectetur adipisicing
	              elit. Quod, facere</p>
	            <a href="blog-single.html" class="btn btn-main">Continue Reading</a>
		          </div>
		        </div>
	      	</div>
      		<div class="col-md-6">
				<div class="post">
					<div class="post-thumb">
						<a href="blog-single.html">
							<img class="img-responsive" src="./source/images/blog/blog-post-3.jpg" alt="">
						</a>
					</div>
					<h2 class="post-title"><a href="blog-single.html">Making A Denim Statement</a></h2>
					<div class="post-meta">
						<ul>
							<li>
								<i class="tf-ion-ios-calendar"></i> 20, MAR 2017
							</li>
							<li>
								<i class="tf-ion-android-person"></i> POSTED BY ADMIN
							</li>
							<li>
								<a href="blog-right-sidebar.html"><i class="tf-ion-ios-pricetags"></i> LIFESTYLE</a>,<a href="blog-right-sidebar.html"> TRAVEL</a>, <a href="blog-right-sidebar.html">FASHION</a>
							</li>
							<li>
								<a href="#!"><i class="tf-ion-chatbubbles"></i> 4 COMMENTS</a>
							</li>
						</ul>
					</div>
					<div class="post-content">
						<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Velit vitae placeat ad architecto nostrum asperiores vel aperiam, veniam eum nulla. Maxime cum magnam, adipisci architecto quibusdam cumque veniam fugiat quae. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Odio vitae ab doloremque accusamus sit, eos dolorum officiis a perspiciatis aliquid. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quod, facere</p>
						<a href="blog-single.html" class="btn btn-main">Continue Reading</a>
					</div>
				</div>
			</div>
			<div class="col-md-6">
				<div class="post">
					<div class="post-thumb">
						<a href="blog-single.html">
							<img class="img-responsive" src="./source/images/blog/blog-post-4.jpg" alt="">
						</a>
					</div>
					<h2 class="post-title"><a href="blog-single.html">Standard Text Post</a></h2>
					<div class="post-meta">
						<ul>
							<li>
								<i class="tf-ion-ios-calendar"></i> 20, MAR 2017
							</li>
							<li>
								<i class="tf-ion-android-person"></i> POSTED BY ADMIN
							</li>
							<li>
								<a href="blog-full-width.html"><i class="tf-ion-ios-pricetags"></i> LIFESTYLE</a>,<a href="blog-full-width.html"> TRAVEL</a>, <a href="blog-full-width.html">FASHION</a>
							</li>
							<li>
								<a href="#!"><i class="tf-ion-chatbubbles"></i> 4 COMMENTS</a>
							</li>
						</ul>
					</div>
					<div class="post-content">
						<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Velit vitae placeat ad architecto nostrum asperiores vel aperiam, veniam eum nulla. Maxime cum magnam, adipisci architecto quibusdam cumque veniam fugiat quae. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Odio vitae ab doloremque accusamus sit, eos dolorum officiis a perspiciatis aliquid. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quod, facere</p>
						<a href="blog-single.html" class="btn btn-main">Continue Reading</a>
					</div>
				</div>
			</div>
			<div class="col-md-6">
				<div class="post">
					<div class="post-media post-media-audio">
						<iframe height="390" src="https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/115637399&amp;color=ff5500&amp;auto_play=false&amp;show_artwork=true" class="DRAGDIS_iframe"></iframe>
					</div>
					<h2 class="post-title"><a href="blog-single.html">Standard Audio Post</a></h2>
					<div class="post-meta">
						<ul>
							<li>
								<i class="tf-ion-ios-calendar"></i> 20, MAR 2017
							</li>
							<li>
								<i class="tf-ion-android-person"></i> POSTED BY ADMIN
							</li>
							<li>
								<a href="blog-full-width.html"><i class="tf-ion-ios-pricetags"></i> LIFESTYLE</a>,<a href="blog-full-width.html"> TRAVEL</a>, <a href="blog-full-width.html">FASHION</a>
							</li>
							<li>
								<a href="#!"><i class="tf-ion-chatbubbles"></i> 4 COMMENTS</a>
							</li>
						</ul>
					</div>
					<div class="post-content">
						<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Velit vitae placeat ad architecto nostrum asperiores vel aperiam, veniam eum nulla. Maxime cum magnam, adipisci architecto quibusdam cumque veniam fugiat quae. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Odio vitae ab doloremque accusamus sit, eos dolorum officiis a perspiciatis aliquid. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quod, facere</p>
						<a href="blog-single.html" class="btn btn-main">Continue Reading</a>
					</div>
				</div>
			</div>
			<div class="col-md-6">
				<div class="post">
					<div class="post-media post-media-audio">
						<iframe width="100%" height="400" src="https://www.youtube.com/embed/Ljik3zsGNF4" frameborder="0" allowfullscreen></iframe>
					</div>
					<h2 class="post-title"><a href="blog-single.html">Standard Video Post</a></h2>
					<div class="post-meta">
						<ul>
							<li>
								<i class="tf-ion-ios-calendar"></i> 20, MAR 2017
							</li>
							<li>
								<i class="tf-ion-android-person"></i> POSTED BY ADMIN
							</li>
							<li>
								<a href="blog-full-width.html"><i class="tf-ion-ios-pricetags"></i> LIFESTYLE</a>,<a href="blog-full-width.html"> TRAVEL</a>, <a href="blog-full-width.html">FASHION</a>
							</li>
							<li>
								<a href="#!"><i class="tf-ion-chatbubbles"></i> 4 COMMENTS</a>
							</li>
						</ul>
					</div>
					<div class="post-content">
						<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Velit vitae placeat ad architecto nostrum asperiores vel aperiam, veniam eum nulla. Maxime cum magnam, adipisci architecto quibusdam cumque veniam fugiat quae. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Odio vitae ab doloremque accusamus sit, eos dolorum officiis a perspiciatis aliquid. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quod, facere</p>
						<a href="blog-single.html" class="btn btn-main">Continue Reading</a>
					</div>
				</div>
		</div>
	</div>
		<div class="text-center">
			<ul class="pagination post-pagination">
				<li><a href="blog-left-sidebar.html">Prev</a>
				</li>
				<li class="active"><a href="blog-left-sidebar.html">1</a>
				</li>
				<li><a href="blog-left-sidebar.html">2</a>
				</li>
				<li><a href="blog-left-sidebar.html">3</a>
				</li>
				<li><a href="blog-left-sidebar.html">4</a>
				</li>
				<li><a href="blog-left-sidebar.html">5</a>
				</li>
				<li><a href="blog-left-sidebar.html">Next</a>
				</li>
			</ul>
		</div>
  </div>
</div>



<!-- /////// 部落格文章推薦專區(Bonus用) ///// -->
<%@include file="../frontpartials/blog.jsp" %>

<!-- /////// 首頁第五段 - 要連動到外網粉絲頁?instagram?(可以拆掉不使用) ///// -->
<%@include file="../frontpartials/footer.jsp" %>
<!-- 主文內容 結束 -->

<!-- //////**極重要!!!!不可少//////<script>//////// -->
<%@include file="../frontpartials/frontscripttobodyend.jsp" %>

</body>
</html>