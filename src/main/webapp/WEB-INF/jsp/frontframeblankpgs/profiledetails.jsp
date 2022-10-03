<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- ////// 會員中心--個人資料維護  /////// -->
    
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
<jsp:param name="title" value="會員中心" />
<jsp:param name="pagination" value="個人管理" />
</jsp:include>

<section class="user-dashboard page-wrapper">
  <div class="container">
    <div class="row">
      <div class="col-md-12">      
      <!-- ///// ↓這邊url最後都要再重新整理過!!!!(因為active位置不同,無法拆寫jsp QQ) -->
        <ul class="list-inline dashboard-menu text-center">
          <li><a href="dashboard.html">Dashboard歡迎+訂購畫面</a></li>
          <li><a href="order.html">Order(訂單/課程)</a></li>
          <li><a href="address.html">Address(文章管理/收藏/食譜)</a></li>
          <li><a class="active"  href="profile-details.html">個人資料維護</a></li>
        </ul>
        <div class="dashboard-wrapper dashboard-user-profile">
          <div class="media">
            <div class="pull-left text-center" href="#!">
              <img class="media-object user-img" src="./source/images/avater.jpg" alt="Image">
              <a href="#x" class="btn btn-transparent mt-20">Change Image</a>
            </div>
            <div class="media-body">
              <ul class="user-profile-list">
                <li><span>Full Name:</span>Johanna Doe</li>
                <li><span>Country:</span>USA</li>
                <li><span>Email:</span>mail@gmail.com</li>
                <li><span>Phone:</span>+880123123</li>
                <li><span>Date of Birth:</span>Dec , 22 ,1991</li>
              </ul>
            </div>
          </div>
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