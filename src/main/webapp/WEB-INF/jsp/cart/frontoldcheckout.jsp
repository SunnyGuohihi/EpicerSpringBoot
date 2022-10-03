<%@page import="com.epicer.model.cart.*, com.epicer.model.users.*"%>
<%@page import="java.math.BigDecimal"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.*,org.hibernate.Session, org.hibernate.SessionFactory"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- <%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%> --%>
<%-- <%@page import="org.hibernate.internal.build.AllowSysOut"%> --%>
<%@page import="com.epicer.model.*"%>
<%@page import="java.util.*"%>

<!DOCTYPE html>
<%
response.setContentType("text/html;charset=UTF-8");
response.setHeader("Cache-Control", "no-cache"); // HTTP 1.1
response.setHeader("Pragma", "no-cache"); // HTTP 1.0
response.setDateHeader("Expires", -1); // Prevents caching at the proxy server
%>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta charset="UTF-8">
<meta name="keywords" content="">
<meta name="description" content="">
<title>My Order</title>
<link rel="stylesheet" href="./css/nicepage.css" media="screen">
<link rel="stylesheet" href="./css/nicepagecart.css" media="screen">
<style>
.thanks {
	width: 400px;
	height: 100%;
}
</style>
</head>

<body class="u-body u-xl-mode" data-lang="en">
	<!-- ////////////////// 此頁為中繼頁面，不能直接開啟，不會有navbar //////////////////-->
	<section class="u-align-center u-clearfix u-section-1" id="sec-b0e8">
		<div class="u-clearfix u-sheet u-sheet-1">
			<div class="u-cart u-cart-1">


				<div class="u-cart-products-table u-table u-table-responsive">
					<table class="u-table-entity">
					<tr><h3>確認訂單明細</h3></tr>
						<%
						List<CartOfProduct> listCart = (List<CartOfProduct>) request.getAttribute("queryById");
						session.getAttribute("userId");
						%>
						
						<colgroup>
							<col width="40%">
							<col width="20%">
							<col width="20%">
							<col width="20%">
						</colgroup>
						<thead class="u-align-left u-table-alt-grey-5 u-table-body">
							<tr>
								<th
									class="u-border-1 u-border-grey-15 u-first-column u-table-cell">商品名稱</th>
								<th class="u-border-1 u-border-grey-15 u-table-cell">單價</th>
								<th class="u-border-1 u-border-grey-15 u-table-cell">數量</th>
								<th class="u-border-1 u-border-grey-15 u-table-cell">小計</th>

							</tr>
						</thead>
						<tbody class="u-align-left u-table-alt-grey-5 u-table-body">
							<form name="Form" action="orderinsert" method="POST">
								<!--          ControllerServlet -->
								<%
								for (CartOfProduct c : listCart) {
								%>
								<tr style="height: 50px;">
									<input type = "hidden" name="productId" value="<%=c.getCartProductId() %>>">
									<!-- **********商品名稱(查id)********** -->
									<td class="u-border-1 u-border-grey-15 u-table-cell">
										<div
											class="u-cart-product-subtotal u-product-control u-product-price">
											<div class="u-price-wrapper">
												<div class="u-hide-price u-old-price"></div>
												<div class="u-price" style="font-weight: 700;"><%=c.getCartProduct().getProductName()%></div>
											</div>
										</div>
									</td>

									<!-- **********單價********** -->
									<td class="u-border-1 u-border-grey-15 u-table-cell">
										<div
											class="u-cart-product-price u-product-control u-product-price">
											<div class="u-price-wrapper">
												<div class="u-hide-price u-old-price"></div>
												<div class="u-price"
													style="font-weight: 400; font-size: 1rem;"><%=c.getCartProduct().getProductPrice()%></div>
											</div>
										</div>
									</td>

									<!-- **********數量********** -->
									<td class="u-border-1 u-border-grey-15 u-table-cell">
										<div
											class="u-cart-product-price u-product-control u-product-price">
											<div class="u-price-wrapper">
												<div class="u-hide-price u-old-price"></div>
												<div class="u-price"
													style="font-weight: 400; font-size: 1rem;"><%=c.getQuantity()%></div>
											</div>
										</div>
									</td>

									<!-- **********小計********** -->
									<td class="u-border-1 u-border-grey-15 u-table-cell">
										<div
											class="u-cart-product-subtotal u-product-control u-product-price">
											<div class="u-price-wrapper">
												<div class="u-hide-price u-old-price"></div>
												<div class="u-price" style="font-weight: 700;"><%=c.getCartProduct().getProductPrice() * c.getQuantity()%></div>
											</div>
										</div>
									</td>

								</tr>
								
							<%
							}
							%>
							<button>結帳</button>
							</form>
						</tbody>
					</table>
					<!-- **********返回購物車 ********** -->

					<div class="u-cart-button-container">
						<a
							href="http://localhost:8091/queryusercart"
							data-page-id="711118021"
							class="u-active-none u-btn u-button-style u-cart-continue-shopping u-hover-none u-none u-text-body-color u-btn-1"><span
							class="u-icon"><svg class="u-svg-content"
									viewBox="0 0 443.52 443.52" x="0px" y="0px"
									style="width: 1em; height: 1em;">
                <g>
                    <path
										d="M143.492,221.863L336.226,29.129c6.663-6.664,6.663-17.468,0-24.132c-6.665-6.662-17.468-6.662-24.132,0l-204.8,204.8    c-6.662,6.664-6.662,17.468,0,24.132l204.8,204.8c6.78,6.548,17.584,6.36,24.132-0.42c6.387-6.614,6.387-17.099,0-23.712    L143.492,221.863z" />
                </g>
              </svg><img></span>&nbsp;返回購物車 </a>
						<!--               <a href="newShoppingCarServlet?action=clear"  -->
						<!--               class="u-btn u-btn-round u-button-style u-cart-update u-grey-5 u-radius-50 u-btn-2" -->
						<!-- 							id="clearCart">清空購物車</a> -->
					</div>



					<!-- **********會員訂購資訊 ********** -->
					<div class="u-cart-blocks-container">
						<div class="u-cart-block u-indent-30">
							<!-- 							<div class="u-cart-block-container u-clearfix"> -->
							<h5 class="u-cart-block-header u-text">訂購資訊</h5>
							<!-- 								<div class="u-cart-block-content u-text"> -->
							<!-- 									<div class="u-cart-form u-form"> -->
							<!-- 									thank u 圖案移除(置換成會員訂購資訊) -->
							<!-- 			   <img src="images/thankyou.jpg" class="thanks"> -->
							<table class="u-table-entity">
								<%
								User u = (User) request.getAttribute("queryuser");
									session.getAttribute("userId");
								%>
								<colgroup>
									<col width="30%">
									<col width="70%">
								</colgroup>
								<tbody
									class="u-align-right u-grey-5 u-table-body u-table-body-2">
									<form name="Form" action="queryuser" method="get">
									
									
									<tr style="height: 46px;">
										<td
											class="u-align-left u-border-1 u-border-grey-15 u-first-column u-table-cell u-table-cell-21">
											姓名</td>
										<td class="u-border-1 u-border-grey-15 u-table-cell">
										<%=u.getName()%>
<%-- 											<%=listCart.get(1).getCartUser.getName()%> --%>
											</td>
									</tr>
									<tr style="height: 46px;">
										<td
											class="u-align-left u-border-1 u-border-grey-15 u-first-column u-table-cell u-table-cell-23">
											電話</td>
										<td
											class="u-border-1 u-border-grey-15 u-table-cell u-table-cell-24">
											<%=u.getPhone()%>
<%-- 											<%=listCart.get(1).getCartUser().getPhone()%> --%>
										</td>
									</tr>
									<tr style="height: 46px;">
										<td
											class="u-align-left u-border-1 u-border-grey-15 u-first-column u-table-cell u-table-cell-23">
											地址</td>
										<td
											class="u-border-1 u-border-grey-15 u-table-cell u-table-cell-24">
									        <%=u.getCity() + u.getTownship() + u.getAddress()%> 
<%-- 											<%=listCart.get(1).getCartUser().getPhone()%> --%>
										</td>
									</tr>
									<tr style="height: 46px;">
										<td
											class="u-align-left u-border-1 u-border-grey-15 u-first-column u-table-cell u-table-cell-23">
											E-mail</td>
										<td
											class="u-border-1 u-border-grey-15 u-table-cell u-table-cell-24">
											<%=u.getAccount()%>
<%-- 											<%=listCart.get(1).getCartUser().getAccount()%> --%>
										</td>
									</tr>
									
									</form>
								</tbody>
							</table>



							<!-- 									</div> -->
							<!-- 								</div> -->
							<!-- 							</div> -->
						</div>

						<!-- 總和table -->

						<div class="u-cart-block u-cart-totals-block u-indent-30">
							<div class="u-cart-block-container u-clearfix">
								<h5 class="u-cart-block-header u-text">訂單金額</h5>
								<div class="u-align-right u-cart-block-content u-text">
									<div class="u-cart-totals-table u-table u-table-responsive">
										<table class="u-table-entity">
											<colgroup>
												<col width="40%">
												<col width="60%">
											</colgroup>
											<tbody
												class="u-align-right u-grey-5 u-table-body u-table-body-2">
												<tr style="height: 46px;">
													<td
														class="u-align-left u-border-1 u-border-grey-15 u-first-column u-table-cell u-table-cell-21">
														商品總數</td>
													<td class="u-border-1 u-border-grey-15 u-table-cell">${tQuantity}</td>
												</tr>
												<tr style="height: 46px;">
													<td
														class="u-align-left u-border-1 u-border-grey-15 u-first-column u-table-cell u-table-cell-23">
														商品總金額</td>
													<td
														class="u-border-1 u-border-grey-15 u-table-cell u-table-cell-24">$
														${tPrice}</td>
												</tr>

											</tbody>
										</table>

									</div>
									<i onclick="orderedSuccess">
									<a href="http://localhost:8091/orderinsert"
										data-page-id="93644921"
										class="u-btn u-btn-round u-button-style u-cart-checkout-btn u-radius-50 u-btn-4 checkout" >確認結帳</a></i>
									
								</div>
							</div>
						</div>

						<!-- 返回商品頁-->

						<!-- 						<div class="u-cart-button-container"> -->
						<!-- 							<a href="ProductPage.jsp" data-page-id="711118021" -->
						<!-- 								class="u-active-none u-btn u-button-style u-cart-continue-shopping u-hover-none u-none u-text-body-color u-btn-1"> -->
						<!-- 								<span class="u-icon"><svg class="u-svg-content" -->
						<!-- 										viewBox="0 0 443.52 443.52" x="0px" y="0px" -->
						<!-- 										style="width: 1em; height: 1em;"> -->
						<!--                     <path d="M143.492,221.863L336.226,29.129c6.663-6.664,6.663-17.468,0-24.132c-6.665-6.662-17.468-6.662-24.132,0l-204.8,204.8    c-6.662,6.664-6.662,17.468,0,24.132l204.8,204.8c6.78,6.548,17.584,6.36,24.132-0.42c6.387-6.614,6.387-17.099,0-23.712    L143.492,221.863z"> -->
						<!--                     </path></svg><img></span>&nbsp;返回商品頁 -->
						<!-- 							</a> -->
						<!-- 						</div> -->
					</div>
	</section>
	<!--   SweetAlert(https://sweetalert2.github.io/#examples)   -->
    <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	<script>
		(function(document) {
			'use strict';

			// 建立 LightTableFilter
			var LightTableFilter = (function(Arr) {

				var _input;

				// 資料輸入事件處理函數
				function _onInputEvent(e) {
					_input = e.target;
					var tables = document.getElementsByClassName(_input
							.getAttribute('data-table'));
					Arr.forEach.call(tables, function(table) {
						Arr.forEach.call(table.tBodies, function(tbody) {
							Arr.forEach.call(tbody.rows, _filter);
						});
					});
				}

				// 資料篩選函數，顯示包含關鍵字的列，其餘隱藏
				function _filter(row) {
					var text = row.textContent.toLowerCase(), val = _input.value
							.toLowerCase();
					row.style.display = text.indexOf(val) === -1 ? 'none'
							: 'table-row';
				}

				return {
					// 初始化函數
					init : function() {
						var inputs = document
								.getElementsByClassName('light-table-filter');
						Arr.forEach.call(inputs, function(input) {
							input.oninput = _onInputEvent;
						});
					}
				};
			})(Array.prototype);

			// 網頁載入完成後，啟動 LightTableFilter
			document.addEventListener('readystatechange', function() {
				if (document.readyState === 'complete') {
					LightTableFilter.init();
				}
			});

		})(document);
	</script>
	<script src="https://kit.fontawesome.com/c01f9b1966.js"
		crossorigin="anonymous"></script>
	<script type="text/javascript">
	//按鈕功能
	//確認結帳
// 	$(function() {
		$("a.checkout").click(function(){
		Swal.fire({
			  position: 'top-end',
			  icon: '訂單已成立!',
			  title: '謝謝購買',
			  showConfirmButton: false,
			  timer: 2000
			})
		})
// 	})

		
	</script>
</body>
</html>
