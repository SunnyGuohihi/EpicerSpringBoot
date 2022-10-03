<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- ////// 聯絡官方/我們(畫面)  /////// -->
    
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
<jsp:param name="title" value="聯絡我們" />
<jsp:param name="pagination" value="聯絡資訊" />
</jsp:include>



<section class="page-wrapper">
	<div class="contact-section">
		<div class="container">
			<div class="row">
				<!-- Contact Form -->
				<div class="contact-form col-md-6 " >
					<form id="contact-form" method="post" action="" role="form">
					
						<div class="form-group">
							<input type="text" placeholder="Your Name" class="form-control" name="name" id="name">
						</div>
						
						<div class="form-group">
							<input type="email" placeholder="Your Email" class="form-control" name="email" id="email">
						</div>
						
						<div class="form-group">
							<input type="text" placeholder="Subject" class="form-control" name="subject" id="subject">
						</div>
						
						<div class="form-group">
							<textarea rows="6" placeholder="Message" class="form-control" name="message" id="message"></textarea>	
						</div>
						
						<div id="mail-success" class="success">
							Thank you. The Mailman is on His Way :)
						</div>
						
						<div id="mail-fail" class="error">
							Sorry, don't know what happened. Try later :(
						</div>
						
						<div id="cf-submit">
							<input type="submit" id="contact-submit" class="btn btn-transparent" value="Submit">
						</div>						
						
					</form>
				</div>
				<!-- ./End Contact Form -->
				
				<!-- Contact Details -->
				<div class="contact-details col-md-6 " >
					<div class="google-map">
						<div id="map"></div>
					</div>
					<ul class="contact-short-info" >
						<li>
							<i class="tf-ion-ios-home"></i>
							<span>Khaja Road, Bayzid, Chittagong, Bangladesh</span>
						</li>
						<li>
							<i class="tf-ion-android-phone-portrait"></i>
							<span>Phone: +880-31-000-000</span>
						</li>
						<li>
							<i class="tf-ion-android-globe"></i>
							<span>Fax: +880-31-000-000</span>
						</li>
						<li>
							<i class="tf-ion-android-mail"></i>
							<span>Email: hello@example.com</span>
						</li>
					</ul>
					<!-- Footer Social Links -->
					<div class="social-icon">
						<ul>
							<li><a class="fb-icon" href="https://www.facebook.com/themefisher"><i class="tf-ion-social-facebook"></i></a></li>
							<li><a href="https://www.twitter.com/themefisher"><i class="tf-ion-social-twitter"></i></a></li>
							<li><a href="https://themefisher.com/"><i class="tf-ion-social-dribbble-outline"></i></a></li>
							<li><a href="https://themefisher.com/"><i class="tf-ion-social-googleplus-outline"></i></a></li>
							<li><a href="https://themefisher.com/"><i class="tf-ion-social-pinterest-outline"></i></a></li>
						</ul>
					</div>
					<!--/. End Footer Social Links -->
				</div>
				<!-- / End Contact Details -->
					
				
			
			</div> <!-- end row -->
		</div> <!-- end container -->
	</div>
</section>
	

  



<!-- /////// 首頁第五段 - 要連動到外網粉絲頁?instagram?(可以拆掉不使用) ///// -->
<%@include file="../frontpartials/footer.jsp" %>
<!-- 主文內容 結束 -->

<!-- //////**極重要!!!!不可少//////<script>//////// -->
<%@include file="../frontpartials/frontscripttobodyend.jsp" %>

</body>
</html>