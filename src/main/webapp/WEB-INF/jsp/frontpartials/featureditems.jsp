<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- ///// 這是商品頁分類區(熱銷榜)     -->

<section class="featured-items section @@class-name">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="section-title">
					<p>CHECK OUR BEST</p>
					<h2>Featured Items</h2>
				</div>
			</div>
		</div>
		
		<!-- ///////////////   商品顯示頁面 (多頁) --可用在首頁(第三段) & 商品頁 ///////////// -->
		<!-- @@include('blocks/shop/products.htm') -->
		<%@include file="../frontpartials/product.jsp" %>
	</div>
</section>