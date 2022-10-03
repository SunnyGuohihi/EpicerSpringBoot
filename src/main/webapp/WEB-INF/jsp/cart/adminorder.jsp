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
<html lang="zh">

<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Epicer管理員系統-訂單管理</title>

<!-- eLinkHead (開始) -->
<%@include file="../includes/eLinkHead.jsp" %>
<!-- eLinkHead (結束) -->
</head>

<body class="g-sidenav-show   bg-gray-100">

	<!-- ////////////////// 介面最外層框架 //////////////////-->
	<div class="min-height-300 bg-primary position-absolute w-100"></div>
	<!-- ////////////////// Side Navber (開始) //////////////////-->
	<%@include file="../includes/eSidenavAdmin.jsp" %>
	<!-- ////////////////// Side Navber (結束) //////////////////-->
	<!-- //////////////////主畫面框架(開始) ////////////////// -->
	<main class="main-content position-relative border-radius-lg ">
		<!-- ////////////////// (Header)Start 上方 Navbar 上方  (要加裝在個人頁面)(從includes/eHead.jsp要拉一個檔案到自己資料夾改)////////////////// -->
		<%@include file="../includes/eHead.jsp"%>
		<!-- ////////////////// End 上方 Navbar //////////////////-->
<!-- ////////////////// 個人主文開始 //////////////////-->

<!-- ////////////////// 套版 //////////////////-->
<div class="card">
  <div class="table-responsive">
    <table class="table align-items-center mb-0">
      <thead>
        <tr>
          <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">訂單編號</th>
          <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">會員編號</th>
<!--           <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">運費金額</th> -->
          <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">商品總數量</th>
          <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">訂單金額</th>
          <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">付款狀態</th>
          <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">出貨狀態</th>
          <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">訂購日期</th>
          <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">使用優惠碼</th>
          <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">收件人姓名</th>
          <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">收件電話</th>
          <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">收件地址</th>
          <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">E-mail</th>
          <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">訂單明細</th>
          <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">狀態修改</th>
          <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">&nbsp;</th>
          <th></th>
        </tr>
      </thead>
      <%
		request.setAttribute("userId", 1002);
		List<OrderProduct> orderList = (List<OrderProduct>) request.getAttribute("allorderlist");
		for (OrderProduct op : orderList) {
		%>
      <tbody>
      <!-- ////////////////// 外框上部 //////////////////-->
        <tr>
        <form action="allorderlist" method="get">
		<input type="hidden" name="id" value=<%=request.getParameter("id")%>>
          
          <td>
            <div class="d-flex px-2">
              <div>
                <img src="https://cdn-icons-png.flaticon.com/512/1261/1261052.png" class="avatar avatar-sm rounded-circle me-2">
              </div>
              <div class="my-auto">
                <h6 class="mb-0 text-xs"><%=op.getOrderProductId()%></h6>
              </div>
            </div>
          </td>
          
          <td><p class="text-xs font-weight-bold mb-0"><%=op.getOrderUser()%></p></td>
<%--      <td><p class="text-xs font-weight-bold mb-0"><%=op.getShipbill()%></p></td> --%>
          <td><p class="text-xs font-weight-bold mb-0"><%=op.getProductTotalQuantity()%></p></td>
          <td><p class="text-xs font-weight-bold mb-0"><%=op.getProductTotalPrice()%></p></td>
          <td><p class="text-xs font-weight-bold mb-0"><%=op.getPayStatus()%></p></td>
          <td><p class="text-xs font-weight-bold mb-0"><%=op.getShipment()%></p></td>
          <td><p class="text-xs font-weight-bold mb-0"><%=op.getOrderDate()%></p></td>
          <td><p class="text-xs font-weight-bold mb-0"><%=op.getCouponId()%></p></td>
          <td><p class="text-xs font-weight-bold mb-0"><%=op.getOrderName()%></p></td>
          <td><p class="text-xs font-weight-bold mb-0"><%=op.getOrderPhone()%></p></td>
          <td><p class="text-xs font-weight-bold mb-0"><%=op.getOrderAddress()%></p></td>
          <td><p class="text-xs font-weight-bold mb-0"><%=op.getOrderEmail()%></p></td>
          <td><p class="text-xs font-weight-bold mb-0">
          <span><a class="orderDetailList" href="#" title="訂單明細">
	  		<i class="ni ni-bullet-list-67" onclick="updateCartId('<%=op.getOrderProductId() %>');"></i>
		  </a> </span>
          </p></td>
          
          <td><p class="text-xs font-weight-bold mb-0">
          <span><a class="updateOrder" href="#" title="狀態修改">
	  		<i class="ni ni-ruler-pencil" onclick="updateCartId('<%=op.getOrderProductId() %>');"></i>
		  </a> </span>
          </p></td>

         	<!-- ///////// 功能按鈕(備用) ///////// -->
<!--           <td class="align-middle"> -->
<!--             <button class="btn btn-link text-secondary mb-0"> -->
<!--               <i class="fa fa-ellipsis-v text-xs" aria-hidden="true"></i> -->
<!--             </button> -->
<!--           </td> -->
          </form>
        </tr>
			<!-- ////////////////// 外框底部 //////////////////-->
      </tbody>
      <%
		}
		%>
    </table>
  	</div>
  </div>
	

<!-- ////////////////// 個人主文結束 //////////////////-->
		<!--////////////////// Footer(開始) //////////////////-->
		<%@include file="../includes/eFooter.jsp"%>
		<!-- ////////////////// Footer(結束) //////////////////-->

		</div>
		<!-- ////////////////// 中間主畫面(結束) ////////////////// -->
	</main>
	<!-- ////////////////// 主畫面框架(結束) //////////////////-->

	<!-- ////////////////// (右上設定鈕)Sidenav Type 調整樣式 ////////////////// -->
	<!-- ////////////////// Sidebar Backgrounds 開始 //////////////////-->
	<%@include file="../includes/eSidenavTypeSetting.jsp"%>
	<!-- ////////////////// Sidebar Backgrounds 結束 ////////////////// -->

	<!-- ////////////////// 框架Script url (開始)(不能少) ////////////////// -->
	<%@include file="../includes/eScriptForBody.jsp"%>
	<!-- ////////////////// 框架Script (結束) //////////////////-->

</body>

</html>