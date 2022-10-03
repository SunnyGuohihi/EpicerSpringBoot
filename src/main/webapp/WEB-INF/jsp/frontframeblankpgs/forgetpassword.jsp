<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- ////// 忘記密碼 ////// -->

<!-- //////**極重要!!!!不可少//////<html> + <head> + <link>//////// -->
<%@include file="../frontpartials/frontheaderlink.jsp" %>
</head>
<body id="body">

<!-- 主文內容 開始 -->

<section class="forget-password-page account">
  <div class="container">
    <div class="row">
      <div class="col-md-6 col-md-offset-3">
        <div class="block text-center">
          <a class="logo" href="index.html">
            <img src="./source/images/epicerlogowhite.jpg" alt="" width="50%">
          </a>
          <h2 class="text-center">Welcome Back</h2>
          <form class="text-left clearfix">
            <p>Please enter the email address for your account. A verification code will be sent to you. Once you have received the verification code, you will be able to choose a new password for your account.</p>
            <div class="form-group">
              <input type="email" class="form-control" id="exampleInputEmail1" placeholder="Account email address">
            </div>
            <div class="text-center">
              <button type="submit" class="btn btn-main text-center">Request password reset</button>
            </div>
          </form>
          <p class="mt-20"><a href="login.html">Back to log in</a></p>
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