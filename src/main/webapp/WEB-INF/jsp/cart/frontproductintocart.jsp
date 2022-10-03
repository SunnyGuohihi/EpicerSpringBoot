<%@page import="com.epicer.model.cart.*"%>
<%@page import="java.math.BigDecimal"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
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
<title>Eciper Groceries Shopping Cart</title>
<!-- SweetAlert2 -->
<script src="js/sweetalert2.all.min.js"></script>
<link rel="stylesheet" href="./css/nicepage.css" media="screen">
<link rel="stylesheet" href="./css/nicepagecart.css" media="screen">
<style>
</style>
</head>

<body class="u-body u-xl-mode" data-lang="en">
	<!-- ////////////////// 前台首頁的navbar (開始) //////////////////-->
	<%@include file="../frontincludes/epicerNavbar.jsp" %>
	<!-- ////////////////// 前台首頁的navbar (結束) //////////////////-->


	<section class="u-align-center u-clearfix u-section-1" id="sec-b0e8">
		<div class="u-clearfix u-sheet u-sheet-1">
			<div class="u-cart u-cart-1">


				<div class="u-cart-products-table u-table u-table-responsive">
					<table class="u-table-entity">
						<%
						List<CartOfProduct> listCart = (List<CartOfProduct>) request.getAttribute("queryById");
						session.getAttribute("userId");
						%> 
						
						<colgroup>
							<col width="40%">
							<col width="15%">
							<col width="15%">
							<col width="15%">
							<col width="15%">
						</colgroup>
						<thead class="u-align-left u-table-alt-grey-5 u-table-body">
							<tr><h3>購物明細</h3></tr>
							<tr>
								<th class="u-border-1 u-border-grey-15 u-first-column u-table-cell">商品名稱	</th>
								<th class="u-border-1 u-border-grey-15 u-table-cell">單價</th>
								<th class="u-border-1 u-border-grey-15 u-table-cell">數量</th>
								<th class="u-border-1 u-border-grey-15 u-table-cell">小計</th>
								<!--             <th>修改</th> -->
								<th class="u-border-1 u-border-grey-15 u-table-cell">刪除</th>
							</tr>
						</thead>

						<tbody class="u-align-left u-table-alt-grey-5 u-table-body">
							<form name="Form" action="queryById" method="get">
								<!--          ControllerServlet -->
								<%
						for (CartOfProduct c : listCart) {
								%>
								<tr style="height: 50px;">

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
													style="font-weight: 400; font-size: 1rem;"><%=c.getCartProduct().getProductPrice() %></div>
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
									<!-- **********修改商品********** -->
									<%--             <td><a href="newShoppingCarServlet?action=update&id=<%=item.getProductId() %>" >修改</a></td> --%>
									<!-- **********刪除商品********** -->
									<td class="u-border-1 u-border-grey-15 u-table-cell">
										<div
											class="u-cart-product-subtotal u-product-control u-product-price">
											<div class="u-price-wrapper">
												<div class="u-hide-price u-old-price"></div>
												<div class="u-price" style="font-weight: 400;">
													<span><a class="deleteItem" href="#" title="刪除">
															<i class="fa-solid fa-trash"
															onclick="deleteCartId('<%=c.getCartProductId() %>');"></i>
													</a> </span>
												</div>
											</div>
										</div>
									</td>
								</tr>
							</form>
							<%
							}
							%>
						</tbody>
					</table>
					<!-- **********返回商品頁 & 清空購物車 (還沒設定/先註解)********** -->

					<div class="u-cart-button-container">
						<a
							href="http://localhost:8091/queryallproductmenu"
							data-page-id="711118021"
							class="u-active-none u-btn u-button-style u-cart-continue-shopping u-hover-none u-none u-text-body-color u-btn-1"><span
							class="u-icon"><svg class="u-svg-content"
									viewBox="0 0 443.52 443.52" x="0px" y="0px"
									style="width: 1em; height: 1em;">
                <g>
                    <path
										d="M143.492,221.863L336.226,29.129c6.663-6.664,6.663-17.468,0-24.132c-6.665-6.662-17.468-6.662-24.132,0l-204.8,204.8    c-6.662,6.664-6.662,17.468,0,24.132l204.8,204.8c6.78,6.548,17.584,6.36,24.132-0.42c6.387-6.614,6.387-17.099,0-23.712    L143.492,221.863z" />
                </g>
              </svg><img></span>&nbsp;返回商品頁 </a>
						<!--               <a href="newShoppingCarServlet?action=clear"  -->
						<!--               class="u-btn u-btn-round u-button-style u-cart-update u-grey-5 u-radius-50 u-btn-2" -->
						<!-- 							id="clearCart">清空購物車</a> -->
					</div>

					<!-- **********coupon table 優惠劵功能區(待做) **********-->
					<div class="u-cart-blocks-container">
						<div class="u-cart-block u-indent-30">
							<div class="u-cart-block-container u-clearfix">
								<h5 class="u-cart-block-header u-text">輸入優惠碼</h5>
								<div class="u-cart-block-content u-text">
									<div class="u-cart-form u-form">
										<form action="#" method="POST"
											class="u-clearfix u-form-horizontal u-form-spacing-10 u-inner-form"
											source="custom" name="form">
											<div class="u-form-group">
												<label for="name-5861" class="u-form-control-hidden u-label">Coupon
													code</label> <input type="text" placeholder="Coupon code"
													id="name-5861" name="coupon"
													class="u-border-1 u-border-grey-30 u-input u-input-rectangle u-white"
													required="">
											</div>
											<div class="u-align-left u-form-group u-form-submit">
												<a href="#"
													class="u-btn u-btn-round u-btn-submit u-button-style u-radius-50 u-btn-3">Apply
													Coupon</a> <input type="submit" value="submit"
													class="u-form-control-hidden">
											</div>
											<div class="u-form-send-message u-form-send-success">Thank
												you! Your message has been sent.</div>
											<div class="u-form-send-error u-form-send-message">Unable
												to send your message. Please fix errors then try again.</div>
											<input type="hidden" value="" name="recaptchaResponse">
										</form>
									</div>
								</div>
							</div>
						</div>

						<!-- **********總和table **********-->

						<div class="u-cart-block u-cart-totals-block u-indent-30">
							<div class="u-cart-block-container u-clearfix">
								<h5 class="u-cart-block-header u-text">Cart Totals</h5>
								<div class="u-align-right u-cart-block-content u-text">
									<div class="u-cart-totals-table u-table u-table-responsive">
										<table class="u-table-entity">
											<colgroup>
												<col width="50%">
												<col width="50%">
											</colgroup>
											<tbody
												class="u-align-right u-grey-5 u-table-body u-table-body-2">
												<tr style="height: 46px;">
													<td
														class="u-align-left u-border-1 u-border-grey-15 u-first-column u-table-cell u-table-cell-21">
														商品總數</td>
													<td class="u-border-1 u-border-grey-15 u-table-cell">
														${tQuantity}</td>
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
									<a href="http://localhost:8091/ordercheck"
										data-page-id="93644921"
										class="u-btn u-btn-round u-button-style u-cart-checkout-btn u-radius-50 u-btn-4 checkout">結帳</a>
								</div>
							</div>
						</div>

					</div>
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
		$(function() {
			//刪除鍵綁定單擊事件
			$("a.deleteItem").click(
					function() {
						return confirm("確定要刪除嗎?( ´•̥̥̥ω•̥̥̥` )")
// 										【"	+$(this).parent().parent().parent().parent().find("td:first").text()+ "】
					}
					);
			
			//清空購物車
			$("#clearCart").click(function(){
				return confirm("確定要清空購物車嗎? இдஇ");
			})
			
			//輸入框綁定失去焦點事件
// 			$(".updateCount").change(function() {
// 				var name = $(this).parent().parent().parent().parent().find("td:first").text();
// 				var id = $(this).attr('Id');
// 				var count = this.value;
// 				if(confirm("確定要修改【"+ name +"】的數量為"+ count +"嗎?ヽ(・×・´)ゞ")){
<%-- 					location.href="/ShoppingCart/newShoppingCarServlet?action=update&count="+count+"&id"+<%=cart.getItems().get(id).getId()%>; --%>
// 				}else{
// 					this.value=this.defaultValue;
// 				}
						
// 					});
			
			//確定結帳
			$("a.checkout").click(function(){
				return confirm("｡:.ﾟヽ(*´∀`)ﾉﾟ.:｡謝謝購買，已匯入我的訂單資料庫｡:.ﾟヽ(*´∀`)ﾉﾟ.:｡");
			})
			
		});
		
		//按鈕功能
		//刪除
		function deleteCartId(cartId){
// 			Swal.fire({
// 				  title: '確定要刪除嗎?( ´•̥̥̥ω•̥̥̥` )',
// 				  text: "還來得及反悔喔!",
// 				  icon: 'warning',
// 				  showCancelButton: true,
// 				  confirmButtonColor: '#3085d6',
// 				  cancelButtonColor: '#d33',
// 				  confirmButtonText: '刪除!'
// 				}).then((result) => {
// 				  if (result.isConfirmed) {
// 				    Swal.fire(
// 				      '刪除成功!',
// 				      '可以回商品頁重新加單喔!',
// 				      'success'
// 				    )
// 				    $(window.location.href = "deleteCartItem?cartId=" + cartId).submit();
// 				  }
// 				})
			window.location.href = "deleteCartItem?cartId=" + cartId;
		}
	</script>
</body>
</html>




