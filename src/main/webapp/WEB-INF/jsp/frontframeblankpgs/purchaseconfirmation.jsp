<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- ////// 訂單明細確認畫面  /////// -->

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
<jsp:param name="title" value="購物車/訂單明細" />
<jsp:param name="pagination" value="訂單資訊" />
</jsp:include>

<div class="page-wrapper">
  	<div class="purchase-confirmation shopping">
    	<div class="container">
      		<div class="row">
        		<div class="col-md-8 col-md-offset-2">
          			<div class="block ">
            			<div class="purchase-confirmation-details">
				            <table id="purchase-receipt" class="table">
				                <thead>
									<tr>
					                    <th><strong>Payment:</strong></th>
					                    <th>33056</th>
				                  	</tr>
				                </thead>

				                <tbody>

				                  	<tr>
				                    	<td class=""><strong>Payment Status:</strong></td>
				                    	<td class="">Complete</td>
				                  	</tr>


				                  	<tr>
				                    	<td><strong>Payment Method:</strong></td>
				                    	<td>Free Purchase</td>
				                  	</tr>
				                  	<tr>
				                    	<td><strong>Date:</strong></td>
				                    	<td>December 20, 2016</td>
				                  	</tr>
				                  	<tr>
				                    	<td><strong>Subtotal</strong></td>
				                    	<td>
				                      	$18.00        </td>
				                    </tr>

				                    <tr>
				                      	<td><strong>Total Price:</strong></td>
				                      	<td>$18.00</td>
				                    </tr>
				                </tbody>
				            </table>
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