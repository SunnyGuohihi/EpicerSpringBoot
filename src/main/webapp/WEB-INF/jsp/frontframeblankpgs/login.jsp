<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- ////// 登入畫面  //////// -->

<!-- //////**極重要!!!!不可少//////<html> + <head> + <link>//////// -->
<%@include file="../frontpartials/frontheaderlink.jsp" %>
</head>
<body id="body">


<!-- 主文內容 開始 -->

<section class="signin-page account">
  <div class="container">
    <div class="row">
      <div class="col-md-6 col-md-offset-3">
        <div class="block text-center">
          <a class="logo" href="index.html">
            <img src="./source/images/epicerlogowhite.jpg" alt="" width="50%">
          </a>
          <h2 class="text-center">Welcome Back</h2>
          <form class="text-left clearfix" action="index.html" >
            <div class="form-group">
              <input type="email" class="form-control"  placeholder="Email">
            </div>
            <div class="form-group">
              <input type="password" class="form-control" placeholder="Password">
            </div>
            <div class="text-center">
              <button type="submit" class="btn btn-main text-center" >Login</button>
            </div>
          </form>
          <p class="mt-20">New in this site ?<a href="signin.html"> Create New Account</a></p>
        </div>
      </div>
    </div>
  </div>
</section>


<!-- 主文內容 結束 -->

<!-- //////**極重要!!!!不可少//////<script>//////// -->
<%@include file="../frontpartials/frontscripttobodyend.jsp" %>

</body>
</html>