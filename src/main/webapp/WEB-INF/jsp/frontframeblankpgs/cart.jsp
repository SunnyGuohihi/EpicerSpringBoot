<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- ////// 購物車畫面  /////// -->
    
<!-- //////**極重要!!!!不可少//////<html> + <head> + <link>//////// -->
<%@include file="../frontpartials/frontheaderlink.jsp" %>
</head>
<body id="body">

<!-- 主文內容 開始 -->
<!-- /////// 超級重要!!!!Navbar 1+2 要連放一起!! (1)聯絡電話 + 購物車 + 商品搜尋 (2)首頁連動，大家串聯在這，最最後要討論串連的地方///// -->
<%@include file="../frontpartials/frontheadernavigation.jsp" %>
<%@include file="../frontpartials/frontheadernavigationtwo.jsp" %>


<!-- /////// 可抽換連結分頁回首頁(客製化/個人化)(類似分頁標籤) /////// -->
<jsp:include page="../frontpartials/pageheader.jsp" flush="true">
<jsp:param name="title" value="購物車" />
<jsp:param name="pagination" value="我的購物車" />
</jsp:include>



<div class="page-wrapper">
  <div class="cart shopping">
    <div class="container">
      <div class="row">
        <div class="col-md-8 col-md-offset-2">
          <div class="block">
            <div class="product-list">
              <form method="post">
                <table class="table">
                  <thead>
                    <tr>
                      <th class="">商品名稱</th>
                      <th class="">價格</th>
                      <th class="">數量</th>
                      <th class="">小計</th>
                      <th class="">變更明細</th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr class="">
                      <td class="">
                        <div class="product-info">
                          <img width="80" src="./source/images/shop/cart/cart-1.jpg" alt="" />
                          <a href="#!">Sunglass</a>
                        </div>
                      </td>
                      <td class="">$200</td>
                      <td class="">1</td>
                      <td class="">$200</td>
                      <td class="">
                      	<a class="product-update" href="#!">修改</a><br/>
                        <a class="product-remove" href="#!">刪除</a>
                      </td>
                    </tr>
                    <tr class="">
                      <td class="">
                        <div class="product-info">
                          <img width="80" src="./source/images/shop/cart/cart-2.jpg" alt="" />
                          <a href="#!">Airspace</a>
                        </div>
                      </td>
                      <td class="">$200</td>
                      <td class="">1</td>
                      <td class="">$200</td>
                      <td class="">
                      	<a class="product-update" href="#!">修改</a><br/>
                        <a class="product-remove" href="#!">刪除</a>
                      </td>
                    </tr>
                    <tr class="">
                      <td class="">
                        <div class="product-info">
                          <img width="80" src="./source/images/shop/cart/cart-3.jpg" alt="" />
                          <a href="#!">Bingo</a>
                        </div>
                      </td>
                      <td class="">$200</td>
                      <td class="">1</td>
                      <td class="">$200</td>
                      <td class="">
                      	<a class="product-update" href="#!">修改</a><br/>
                        <a class="product-remove" href="#!">刪除</a>
                      </td>
                    </tr>
                  </tbody>
                </table>
                <a href="checkout.html" class="btn btn-main pull-right">Checkout</a>
              </form>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>


<!-- /////// 首頁第五段 - 要連動到外網粉絲頁?instagram?(可以拆掉不使用) ///// -->
<%@include file="../frontpartials/footer.jsp" %>

<!-- 主文內容 結束 -->

<!-- //////**極重要!!!!不可少//////<script>//////// -->
<%@include file="../frontpartials/frontscripttobodyend.jsp" %>

</body>
</html>