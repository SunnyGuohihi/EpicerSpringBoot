<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- //////  計費方案畫面??  //////// -->
    
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
<jsp:param name="title" value="計費畫面(可以當廣告頁?)" />
<jsp:param name="pagination" value="pricing" />
</jsp:include>



	<section class="pricing-table">
		<div class="container">
			<div class="row">
				<!-- single pricing table -->
				<div class="col-md-4 col-sm-6 col-xs-12" >
					<div class="pricing-item">
						
						<!-- plan name & value -->
						<div class="price-title">
							<h3>Basic</h3>
							<strong class="value">$99</strong>
							<p>Perfect for single freelancers who work by themselves</p>
						</div>
						<!-- /plan name & value -->
						
						<!-- plan description -->
						<ul>
							<li><i class="tf-ios-arrow-forward"></i> 1GB Disk Space</li>
							<li><i class="tf-ios-arrow-forward"></i> 10 Email Account</li>
							<li><i class="tf-ios-arrow-forward"></i> Script Installer</li>
							<li><i class="tf-ios-arrow-forward"></i> 1 GB Storage</li>
							<li><i class="tf-ios-arrow-forward"></i> 10 GB Bandwidth</li>
							<li><i class="tf-ios-arrow-forward"></i> 24/7 Tech Support</li>
						</ul>
						<!-- /plan description -->
						
						<!-- signup button -->
						<a class="btn btn-main" href="signin.html">Signup</a>
						<!-- /signup button -->
						
					</div>
				</div>
				<!-- end single pricing table -->
				
				<!-- single pricing table -->
				<div class="col-md-4 col-sm-6 col-xs-12  "  >
					<div class="pricing-item">
					
						<!-- plan name & value -->
						<div class="price-title">
							<h3>Basic</h3>
							<strong class="value">$99</strong>
							<p>Suitable for small businesses with up to 5 employees</p>
						</div>
						<!-- /plan name & value -->
						
						<!-- plan description -->
						<ul>
							<li><i class="tf-ios-arrow-forward"></i> 1GB Disk Space</li>
							<li><i class="tf-ios-arrow-forward"></i> 10 Email Account</li>
							<li><i class="tf-ios-arrow-forward"></i> Script Installer</li>
							<li><i class="tf-ios-arrow-forward"></i> 1 GB Storage</li>
							<li><i class="tf-ios-arrow-forward"></i> 10 GB Bandwidth</li>
							<li><i class="tf-ios-arrow-forward"></i> 24/7 Tech Support</li>
						</ul>
						<!-- /plan description -->
						
						<!-- signup button -->
						<a class="btn btn-main" href="signin.html">Signup</a>
						<!-- /signup button -->
						
					</div>
				</div>
				<!-- end single pricing table -->
				
				<!-- single pricing table -->
				<div class="col-md-4 col-sm-6 col-xs-12 ">
					<div class="pricing-item">
						
						<!-- plan name & value -->
						<div class="price-title">
							<h3>Basic</h3>
							<strong class="value">$99</strong>
							<p>Great for large businesses with more than 5 employees</p>
						</div>
						<!-- /plan name & value -->
						
						<!-- plan description -->
						<ul>
							<li><i class="tf-ios-arrow-forward"></i> 1GB Disk Space</li>
							<li><i class="tf-ios-arrow-forward"></i> 10 Email Account</li>
							<li><i class="tf-ios-arrow-forward"></i> Script Installer</li>
							<li><i class="tf-ios-arrow-forward"></i> 1 GB Storage</li>
							<li><i class="tf-ios-arrow-forward"></i> 10 GB Bandwidth</li>
							<li><i class="tf-ios-arrow-forward"></i> 24/7 Tech Support</li>
						</ul>
						<!-- /plan description -->
						
						<!-- signup button -->
						<a class="btn btn-main" href="signin.html">Signup</a>
						<!-- /signup button -->
						
					</div>
				</div>
				<!-- end single pricing table -->
				
				
			</div>       <!-- End row -->
		</div>   	<!-- End container -->
	</section>   <!-- End section -->
	
<!-- /////// 長得很像是官方收費的頁面@___@ (感覺不實用) **bonus page ///// -->
<%-- <%@include file="../frontpartials/pricing.jsp" %> --%>


<!-- /////// 首頁第五段 - 要連動到外網粉絲頁?instagram?(可以拆掉不使用) ///// -->
<%@include file="../frontpartials/footer.jsp" %>

<!-- 主文內容 結束 -->

<!-- //////**極重要!!!!不可少//////<script>//////// -->
<%@include file="../frontpartials/frontscripttobodyend.jsp" %>

</body>
</html>