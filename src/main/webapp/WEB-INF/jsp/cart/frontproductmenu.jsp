<%@page import="com.epicer.model.product.Product"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.epicer.model.*"%>
<%@page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<%
response.setContentType("text/html;charset=UTF-8");
response.setHeader("Cache-Control", "no-cache"); // HTTP 1.1
response.setHeader("Pragma", "no-cache"); // HTTP 1.0
response.setDateHeader("Expires", -1); // Prevents caching at the proxy server
%>
<link data-turbolinks-track="true"
	href="http://static.oswd.org/assets/application-6d2a4562b1f5d344541d91ef6d0c8e9a.css"
	media="all" rel="stylesheet">
<title>商場搜全部</title>
<style>
table {
	border: 2px solid black;
	width: 1200px;
	margin: 5px auto
}

th td {
	width: 300px;
	height: 20px;
	margin: 0 auto;
}
</style>
</head>

<body>
	<!-- ////////////////// 前台首頁的navbar (開始) //////////////////-->
	<%@include file="../frontincludes/epicerNavbar.jsp" %>
	<!-- ////////////////// 前台首頁的navbar (結束) //////////////////-->
	<br>
	<br>
	<br>
	<h1 ALIGN=CENTER>搜全部</H1>
	<div ALIGN=CENTER>
		<label for="name">搜尋:</label> <input type="search"
			class="light-table-filter" data-table="order-table"
			placeholder="請輸入關鍵字">
	</div>
	<br>

	<table class="order-table" cellspacing="2" cellpadding="1" border="4"
		width="100%">
		<colgroup>
			<col width="7%">
			<col width="30%">
			<col width="8%">
			<col width="10%">
			<col width="5%">
			<col width="5%">
			<col width="5%">
			<col width="10%">
		</colgroup>
		<thead>
			<tr>
				<th>名稱</th>
				<th>商品說明</th>
				<th>類別</th>
				<th>單位</th>
				<th>價格</th>
				<th>產地</th>
				<th>數量</th>
				<th>&nbsp;</th>
			</tr>
		</thead>

		<%
		request.setAttribute("userId", 1002);
		List<Product> product = (List<Product>) request.getAttribute("queryall");
		for (Product pb : product) {
		%>
		<tbody>
			<tr>
				<form action="queryall" method="get">
					<input type="hidden" name="id"
						value=<%=request.getParameter("id")%>>
				<td><%=pb.getProductName()%></td>
				<td><%=pb.getProductDescription()%></td>
				<td>
					<%
						if (pb.getProductCategoryId() == 1) {
							out.println("五穀根莖類");
						} else if (pb.getProductCategoryId() == 2) {
							out.println("奶類");
						} else if (pb.getProductCategoryId() == 3) {
							out.println("蛋豆魚肉類");
						} else if (pb.getProductCategoryId() == 4) {
							out.println("蔬菜類");
						} else if (pb.getProductCategoryId() == 5) {
							out.println("水果類");
						} else if (pb.getProductCategoryId() == 6) {
							out.println("油脂與堅果種子類");
						} else if (pb.getProductCategoryId() == 7) {
							out.println("調味品類");
						} else {
							out.println("無法辨別");
						}
						%>
				</td>
				<td><%=pb.getProductUnit() %></td>
				<td><%=pb.getProductPrice() %></td>
				<td><%=pb.getProductOrigin()%></td>
				</form>
				<td>1</td>
				<td>
					<form ALIGN=center action="addproducttocart" method="post">
						<input type="hidden" name="userid" value=1002> <input
							type="hidden" name="productid" value="<%=pb.getProductId()%>"> <input
							type="hidden" name="name" value="<%=pb.getProductName()%>">
						<input type="hidden" name="unit" value="<%=pb.getProductUnit()%>">
						<input type="hidden" name="price" value="<%=pb.getProductPrice()%>">
						<input type="hidden" name="quantity" value=1> <input
							type="hidden" name="action" value="delete"> <input
							ALIGN=center type="submit" value="加入購物車" name="delete">
					</form>

				</td>
			</tr>

			<%
			}
			%>
		</tbody>
	</table>
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
</body>
</html>