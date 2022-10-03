<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<!-- //////  商品網+側邊推播  //////// -->  
 
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
			<div class="col-md-3">
				<div class="widget">
					<h4 class="widget-title">Short By</h4>
					<form method="post" action="#">
                        <select class="form-control">
                            <option>Man</option>
                            <option>Women</option>
                            <option>Accessories</option>
                            <option>Shoes</option>
                        </select>
                    </form>
	            </div>
				<div class="widget product-category">
					<h4 class="widget-title">Categories</h4>
					<div class="panel-group commonAccordion" id="accordion" role="tablist" aria-multiselectable="true">
					  	<div class="panel panel-default">
						    <div class="panel-heading" role="tab" id="headingOne">
						      	<h4 class="panel-title">
						        	<a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
						          	Shoes
						        	</a>
						      	</h4>
						    </div>
					    <div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
							<div class="panel-body">
								<ul>
									<li><a href="#!">Brand & Twist</a></li>
									<li><a href="#!">Shoe Color</a></li>
									<li><a href="#!">Shoe Color</a></li>
								</ul>
							</div>
					    </div>
					  </div>
					  <div class="panel panel-default">
					    <div class="panel-heading" role="tab" id="headingTwo">
					      <h4 class="panel-title">
					        <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
					         	Duty Wear
					        </a>
					      </h4>
					    </div>
					    <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
					    	<div class="panel-body">
					     		<ul>
									<li><a href="#!">Brand & Twist</a></li>
									<li><a href="#!">Shoe Color</a></li>
									<li><a href="#!">Shoe Color</a></li>
								</ul>
					    	</div>
					    </div>
					  </div>
					  <div class="panel panel-default">
					    <div class="panel-heading" role="tab" id="headingThree">
					      <h4 class="panel-title">
					        <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
					          	WorkOut Shoes
					        </a>
					      </h4>
					    </div>
					    <div id="collapseThree" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree">
					    	<div class="panel-body">
					      		<ul>
									<li><a href="#!">Brand & Twist</a></li>
									<li><a href="#!">Shoe Color</a></li>
									<li><a href="#!">Gladian Shoes</a></li>
									<li><a href="#!">Swis Shoes</a></li>
								</ul>
					    	</div>
					    </div>
					  </div>
					</div>
					
				</div>
			</div>
			<div class="col-md-9">
				<div class="row">
					<!-- ///////////////   商品顯示頁面 (多頁) --可用在首頁(第三段) & 商品頁 ///////////// -->
					<!-- @@include('blocks/product.htm') -->
					<%@include file="../frontpartials/product.jsp" %>
				</div>				
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