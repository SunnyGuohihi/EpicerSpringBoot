<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.epicer.model.product.*"%>
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
<script src="../../assets/js/plugins/sweetalert.min.js"></script>
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
			<h5 ALIGN=CENTER>修改商品</h5>
			
			<form id="updateProduct<%=request.getParameter("ProductId")%>" action="updateProductAction" method="post" enctype="multipart/form-data">
			
			<input type="hidden" name="ProductId" value=<%=request.getParameter("ProductId")%>>
			
				<div class="form-group">
					<label for="exampleFormControlSelect1">商品名稱:</label> 
					<input type="text" class="form-control" name="productName" value=<%=request.getParameter("ProductName")%> >
				</div>
				<div class="form-group">
					<label for="exampleFormControlSelect1">商品類別:</label> 
					<select	class="form-control" name="productCategoryId" >
						<option value=<%= request.getParameter("ProductCategoryId")%>>
                <% 
				if (request.getParameter("ProductCategoryId").equals("1")) {
					out.println("五穀根莖類");
				} else if (request.getParameter("ProductCategoryId").equals("2")) {
					out.println("奶類");
				} else if (request.getParameter("ProductCategoryId").equals("3")) {
					out.println("蛋豆魚肉類");
				} else if (request.getParameter("ProductCategoryId").equals("4")) {
					out.println("蔬菜類");
				} else if (request.getParameter("ProductCategoryId").equals("5")) {
					out.println("水果類");
				} else if (request.getParameter("ProductCategoryId").equals("6")) {
					out.println("油脂與堅果種子類");
				} else if (request.getParameter("ProductCategoryId").equals("7")) {
					out.println("調味品類");
				} else {
					out.println("無法辨別");
				}
				%>
						
						</option>
						
						<option value="1" name="五穀根莖類" >五穀根莖類</option>
                        <option value="2" name="奶類">奶類</option>
                        <option value="3" name="蛋豆魚肉類">蛋豆魚肉類</option>
                        <option value="4" name="蔬菜類">蔬菜類</option>
                        <option value="5" name="水果類">水果類</option>
                        <option value="6" name="油脂與堅果種子類">油脂與堅果種子類</option>
                        <option value="7" name="調味品類">調味品類</option>
					</select>
				</div>
				
				<div class="form-group">
					<label for="exampleFormControlInput1">商品照片:</label> 
					<input type="file" class="form-control" name="productImage"  >
					<img class="img" src="../<%=request.getParameter("productImage") %>" width="300px" >
					
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
					<input type="text" class="form-control" name="productUnit" value=<%= request.getParameter("ProductUnit") %>>
				</div>
				<div class="form-group">
					<label for="exampleFormControlInput1">價格:</label> 
					<input type="text" class="form-control" name="productPrice" value=<%= request.getParameter("ProductPrice") %>>
				</div>
				<div class="form-group">
					<label for="exampleFormControlInput1">產地:</label> 
					<input type="text" class="form-control" name="productOrigin" value=<%= request.getParameter("ProductOrigin") %>>
				</div>
				<div class="form-group">
					<label for="exampleFormControlInput1">庫存:</label> 
					<input type="text" class="form-control" name="productStock" value=<%= request.getParameter("ProductStock") %>>
				</div>
                <div class="form-group">
					<label for="exampleFormControlSelect1">上架狀態:</label> 
					<select	class="form-control" name="productStatus" >
						<option value=<%= request.getParameter("ProductStatus")%>>
						<% 
				if (request.getParameter("ProductStatus").equals("0")) {
					out.println("未上架");
				} else if (request.getParameter("ProductStatus").equals("1")) {
					out.println("已上架");
				} else {
					out.println("無法辨別");
				}
				%>
						</option>
						<option value="0" name="未上架" >未上架</option>
                        <option value="1" name="上架中">上架中</option>
					</select>
				</div>
				
				<div class="form-group">
					<label for="exampleFormControlTextarea1">商品描述:</label>
					<textarea class="form-control" name="productDescription""
						rows="3" ><%= request.getParameter("ProductDescription") %>
						</textarea>
				</div>
				
				<div class="button" >
       
            <input type="hidden" name="action" value="update" >
<!--             <input type="submit" value="更新" name="update" > -->
            
            <button type="button" class="btn bg-gradient-primary mb-0" onclick="update(<%=request.getParameter("ProductId")%>)">更新</button>

        </div>
			</form>
		</fieldset>

<script type="text/javascript">

function update(i) {
	Swal.fire({
		  icon: 'success',
		  title: '更新完成',
		  showConfirmButton: false,
		  timer: 1000
		  
		})
		
		.then((result) => {
	 
	    
	    $("#updateProduct"+i).submit();
	  
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