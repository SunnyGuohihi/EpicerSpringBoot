<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh">

<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Epicer管理員系統</title>

<!-- eLindHead (開始) -->
<%@include file="../includes/eLinkHead.jsp"%>
<!-- eLindHead (結束) -->
<style>
fieldset {
	            width: 1200px;
                border: 1px solid white;
                border-radius: 15px;
                margin: 20px auto;
                background-color: white;
                padding: 0px 120px 60px 120px;
}
</style>
</head>

<body class="g-sidenav-show   bg-gray-100">

	<!-- ////////////////// 介面最外層框架 //////////////////-->
	<div class="min-height-300 bg-primary position-absolute w-100"></div>
	<!-- ////////////////// Side Navber (開始) //////////////////-->
	<%@include file="../includes/eSidenavAdmin.jsp"%>
	<!-- ////////////////// Side Navber (結束) //////////////////-->
	<!-- //////////////////主畫面框架(開始) ////////////////// -->
	<main class="main-content position-relative border-radius-lg ">
		<!-- ////////////////// (Header)Start 上方 Navbar 上方  (要加裝在個人頁面)(從includes/eHead.jsp要拉一個檔案到自己資料夾改)////////////////// -->
		<%@include file="../includes/eHead.jsp"%>
		<!-- ////////////////// End 上方 Navbar //////////////////-->
		<!-- ////////////////// 個人主文開始 //////////////////-->

		<fieldset>
		<br>
			<h5 ALIGN=CENTER>新增商品</h5>
			
			<form id="updateProduct"  action="insertProductAction" method="post" enctype="multipart/form-data">
				<div class="form-group">
					<label for="exampleFormControlSelect1">商品名稱:</label> 
					<input type="text" class="form-control" id="productName" name="productName" placeholder=請輸入商品名稱  required>
				</div>
				<div class="form-group">
					<label for="exampleFormControlSelect1">商品類別:</label> 
					<select class="form-control"  name="productCategoryId" >
						<option  value="">請輸入類別</option>
						<option value="1" name="五穀根莖類" >五穀根莖類</option>
                        <option value="2" name="奶類">奶類</option>
                        <option id="productCategoryId" value="3" name="蛋豆魚肉類">蛋豆魚肉類</option>
                        <option value="4" name="蔬菜類">蔬菜類</option>
                        <option value="5" name="水果類">水果類</option>
                        <option value="6" name="油脂與堅果種子類">油脂與堅果種子類</option>
                        <option value="7" name="調味品類">調味品類</option>
					</select>
				</div>
				
<!-- 				放照片的地方 -->
				<div class="form-group">
					<label for="exampleFormControlInput1">商品照片:</label> 
					<input type="file" class="form-control" name="productImage" value="upload" >
					<img class="img"  width="300px" >
					
			<script>
               $('.form-control').on('change', function(e){       
                const file = this.files[0]; 
                const objectURL = URL.createObjectURL(file); 
      
               $('.img').attr('src', objectURL); 
               });
            </script> 
					
				</div>
				
				
				<div class="form-group">
					<label for="exampleFormControlInput1">單位:</label> 
					<input type="text" class="form-control" id="ProductUnit" name="productUnit" placeholder=請輸入商品單位 required>
				</div>
				<div class="form-group">
					<label for="exampleFormControlInput1">價格:</label> 
					<input type="text" class="form-control" id="ProductPrice" name="productPrice" placeholder=請輸入商品價格 required>
				</div>
				<div class="form-group">
					<label for="exampleFormControlInput1">產地:</label> 
					<input type="text" class="form-control" id="ProductOrigin" name="productOrigin" placeholder=請輸入商品產地 required>
				</div>
				<div class="form-group">
					<label for="exampleFormControlInput1">庫存:</label> 
					<input type="text" class="form-control" id="productStock" name="productStock" placeholder=請輸入商品庫存 required>
				</div>
                <div class="form-group">
					<label for="exampleFormControlSelect1">上架狀態:</label> 
					<select	class="form-control" name="productStatus" >
						<option value="">請輸入狀態</option>
						<option value="0" name="未上架" >未上架</option>
                        <option id="productStatus" value="1" name="上架中">上架中</option>
					</select>
				</div>
				
				<div class="form-group">
					<label for="exampleFormControlTextarea1">商品描述:</label>
					<textarea class="form-control" id="productDescription" name="productDescription"
						rows="3"  placeholder=請輸入商品細節 value=""></textarea>
				</div>
				
				
				
				
<!-- 				<div class="button" > -->
       
<!--             <input type="hidden" name="action" value="insert" > -->
<!--             <input type="submit" value="新增" name="insert" > -->
            <button type="button" class="btn bg-gradient-primary mb-0" onclick="insert()">新增</button>
            <button type="button" class="btn bg-gradient-primary mb-0" id="action">一鍵輸入</button>

       
       

<!--         </div> -->
			</form>
		</fieldset>


<script type="text/javascript" src="js/jquery-3.6.0.js"></script>  


<script type="text/javascript">
    //一鍵輸入
$(function(){ 
     $('#action').on('click',function(){
      $('#productName').attr("value","日本5S生食級干貝5S"); 
      $("#productCategoryId").attr("selected",true); 
      $('#ProductUnit').attr("value","1000g±10%/包"); 
      $('#ProductPrice').attr("value","1199"); 
      $('#ProductOrigin').attr("value","北海道"); 
      $('#productStock').attr("value","15"); 
      $('#productStatus').attr("selected",true); 
      $('#productDescription').val("北海道干貝顆顆飽滿，新鮮採集急凍來台！北海道干貝料理多元，生食刺身或以蒜蓉清蒸、熱炒熬湯、炙燒炭烤、奶油香煎，口感細緻濃郁、絲絲甘甜，滿足味蕾的極品！"); 
//       document.getElementById("ProductDescription").value="北海道干貝顆顆飽滿，新鮮採集急凍來台！北海道干貝料理多元，生食刺身或以蒜蓉清蒸、熱炒熬湯、炙燒炭烤、奶油香煎，口感細緻濃郁、絲絲甘甜，滿足味蕾的極品！";
//       $('#ProductDescription').attr("innerText","北海道干貝顆顆飽滿，新鮮採集急凍來台！北海道干貝料理多元，生食刺身或以蒜蓉清蒸、熱炒熬湯、炙燒炭烤、奶油香煎，口感細緻濃郁、絲絲甘甜，滿足味蕾的極品！"); 
     });
});

function insert() {
	Swal.fire({
		  icon: 'success',
		  title: '新增完成',
		  showConfirmButton: false,
		  timer: 1000
		  
		})
		
		.then((result) => {
	  
	    $("#updateProduct").submit();
	  
	})
	
}
    

</script>


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
	<script src="../assets/js/plugins/sweetalert.min.js"></script>

<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>

</body>

</html>