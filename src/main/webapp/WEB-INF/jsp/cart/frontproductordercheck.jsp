<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.epicer.model.cart.*"%>
<%@page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<%
response.setContentType("text/html;charset=UTF-8");
response.setHeader("Cache-Control", "no-cache"); // HTTP 1.1
response.setHeader("Pragma", "no-cache"); // HTTP 1.0
response.setDateHeader("Expires", -1); // Prevents caching at the proxy server
%>
<html>
<head>
<meta charset="UTF-8">
<title>後臺表單查詢(未套版)</title>
<style>
table {
	border: 2px solid black;
	width: 1400px;
	margin: 5px auto
}

th td tr {
	border: 1px solid silver;
	width: 300px;
	height: 20px;
	margin: 0 auto;
}
</style>
<!-- eLinkHead (開始) -->
<%@include file="../includes/eLinkHead.jsp"%>
<!-- eLinkHead (結束) -->
</head>
<body>
	<!-- ////////////////// 前台首頁的navbar (開始) //////////////////-->
	<%@include file="../frontincludes/epicerNavbar.jsp"%>
	<!-- ////////////////// 前台首頁的navbar (結束) //////////////////-->

	<div>
		<table>
			<thead>
				<tr>
					<th>會員ID</th>
					<!-- <th>運費金額</th> -->
					<th>訂購商品數量</th>
					<th>訂購總金額</th>
					<th>付款狀態</th>
					<th>出貨狀態</th>
					<th>訂購日期</th>
					<th>使用優惠碼</th>
					<th>收件人姓名</th>
					<th>收件電話</th>
					<th>收件地址</th>
					<th>收件E-mail</th>
					<th>訂單明細</th>
					<th>狀態修改</th>
					<th>&nbsp;</th>
				</tr>
			</thead>
			<%
			request.setAttribute("userId", 1002);
			List<OrderProduct> orderList = (List<OrderProduct>) request.getAttribute("allorderlist");
			for (OrderProduct op : orderList) {
			%>
			<tbody>

				<tr>
					<form action="allorderlist" method="get">
						<input type="hidden" name="id"
							value=<%=request.getParameter("id")%>>
					<td><%=op.getOrderUser()%></td>
					<%-- <td><%=op.getShipbill()%></td> --%>
					<td><%=op.getProductTotalQuantity()%></td>
					<td><%=op.getProductTotalPrice()%></td>
					<td><%=op.getPayStatus()%></td>
					<td><%=op.getShipment()%></td>
					<td><%=op.getOrderDate()%></td>
					<td><%=op.getCouponId()%></td>
					<td><%=op.getOrderName()%></td>
					<td><%=op.getOrderPhone()%></td>
					<td><%=op.getOrderAddress()%></td>
					<td><%=op.getOrderEmail()%></td>
					</form>
					<td>
					<span><a class="updateOrder" href="#" title="修改">
<%-- 					<i class="fa-solid fa-trash" onclick="deleteCartId('<%=c.getCartProductId() %>');"></i> --%>
					</a> </span>
					</td>
					<td>
					<span><a class="cancelOrder" href="#" title="刪除">
<%-- 					<i class="fa-solid fa-trash" onclick="deleteCartId('<%=c.getCartProductId() %>');"></i> --%>
					</a> </span>
					</td>
				</tr>
			</tbody>
			<%
			}
			%>
		</table>
	</div>








	<!-- ////////////////// Sidebar Backgrounds 開始 //////////////////-->
	<%@include file="../includes/eSidenavTypeSetting.jsp"%>
	<!-- ////////////////// Sidebar Backgrounds 結束 ////////////////// -->
</body>
</html>