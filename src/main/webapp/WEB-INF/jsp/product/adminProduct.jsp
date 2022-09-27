<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.epicer.model.product.*"%>
<%@page import="java.util.List"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="zh">

<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Epicer管理員系統</title>

<!-- eLindHead (開始) -->
<%@include file="../includes/eLinkHead.jsp" %>
<!-- eLindHead (結束) -->
<style type="text/css">

fieldset {
	            width: 1200px;
                border-radius: 15px;
                margin: 20px auto;
                background-color: white;
}


span {
position:relative;
overflow:hidden;
white-space: nowrap;  
overflow: hidden;  
text-overflow: ellipsis; 
max-width:300px;
display:inline-block;

}
.d-flex  {
  position:relative;
overflow:hidden;
white-space: nowrap;  
overflow: hidden;  
text-overflow: ellipsis; 
max-width:270px;
display:inline-block;
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
	<div class="card">
	<br>
	
	<h5 ALIGN=CENTER>商品列表</h5>
	<br>
	
        
	
	<div class="nav-wrapper position-relative end-0">
   <ul class="nav nav-pills nav-fill p-1" role="tablist">
   <li class="nav-item">
         <a class="nav-link mb-0 px-0 py-1 active"  href="${pageContext.request.contextPath}/product" role="tab" aria-controls="profile" aria-selected="true">
         搜全部
         </a>
      </li>
      <li class="nav-item">
         <a class="nav-link mb-0 px-0 py-1 active"  href="${pageContext.request.contextPath}/productCategory?productCategoryId=1" role="tab" aria-controls="profile" aria-selected="true">
         五穀根莖類
         </a>
      </li>
      <li class="nav-item">
         <a class="nav-link mb-0 px-0 py-1 active"  href="${pageContext.request.contextPath}/productCategory?productCategoryId=2"  role="tab" aria-controls="dashboard" aria-selected="false">
         奶類
         </a>
      </li>
      <li class="nav-item">
         <a class="nav-link mb-0 px-0 py-1 active"  href="productCategory?productCategoryId=3" role="tab" aria-controls="dashboard" aria-selected="false">
         蛋豆魚肉類
         </a>
      </li>
      <li class="nav-item">
         <a class="nav-link mb-0 px-0 py-1 active"  href="productCategory?productCategoryId=4" role="tab" aria-controls="dashboard" aria-selected="false">
         蔬菜類
         </a>
      </li>
      <li class="nav-item">
         <a class="nav-link mb-0 px-0 py-1 active"  href="productCategory?productCategoryId=5" role="tab" aria-controls="dashboard" aria-selected="false">
         水果類
         </a>
      </li>
      <li class="nav-item">
         <a class="nav-link mb-0 px-0 py-1 active"  href="productCategory?productCategoryId=6" role="tab" aria-controls="dashboard" aria-selected="false">
         油脂與堅果種子類
         </a>
      </li>
      <li class="nav-item">
         <a class="nav-link mb-0 px-0 py-1 active"  href="productCategory?productCategoryId=7" role="tab" aria-controls="dashboard" aria-selected="false">
         調味品類
         </a>
      </li>
    </ul>
</div>



<!-- 	<div class="input-group " > -->
<!--           <input type="search" class="light-table-filter" data-table="table align-items-center mb-0" class="form-control" placeholder="請輸入關鍵字" type="text" > -->
<!--           <span class="input-group-text"><i class="ni ni-zoom-split-in"></i></span> -->
<!--         </div> -->
        
        <div class="form-group">
					<div class="input-group ">
						<span class="input-group-text"><i
							class="ni ni-zoom-split-in"></i></span> <input type="search"
							class="light-table-filter form-control" data-table="table align-items-center mb-0"
							placeholder="請輸入關鍵字">
					</div>
				</div>
	
	
	
  <div class="table-responsive">
    <table class="table align-items-center mb-0">
    
    	<colgroup>
              <col width="15%">
              <col width="5%">
              <col width="5%">
              <col width="5%">
              <col width="5%">
              <col width="5%">
              <col width="10%">
              <col width="5%">
              <col width="5%">
            </colgroup>
    
      <thead>
        <tr>
          <th class="text-uppercase text-secondary text-s font-weight-bolder opacity-7 ">商品/類別</th>
          <th class="text-center text-uppercase text-secondary text-s font-weight-bolder opacity-7">單位</th>
          <th class="text-center text-uppercase text-secondary text-s font-weight-bolder opacity-7">價格</th>
          <th class="text-center text-uppercase text-secondary text-s font-weight-bolder opacity-7">產地</th>
          <th class="text-center text-uppercase text-secondary text-s font-weight-bolder opacity-7">庫存</th>
          <th class="text-center text-uppercase text-secondary text-s font-weight-bolder opacity-7">上架狀態</th>
          <th class="text-center text-uppercase text-secondary text-s font-weight-bolder opacity-7">商品描述</th>
          <th colspan="2" class="text-center text-uppercase text-secondary text-s font-weight-bolder opacity-7">操作</th>
        </tr>
      </thead>
      
      <%
				List<Product> product = (List<Product>)request.getAttribute("findAll");
				for (Product pb : product) {
		%>
      
      <tbody>
      
      
        <tr>
          <td>
            <div class="d-flex px-2 py-1">
         <input type="hidden" name="productId" value=<%=pb.getProductId()%>>
              <div>
<!--        照片位置         -->
              <img src="./<%=pb.getProductImage()%>"  width="80px" border-radius="15px" margin="20px auto">
              </div>
               &nbsp;&ensp;
              <div class="d-flex flex-column justify-content-center">
                <h6 class="mb-0 text-s"><%=pb.getProductName()%></h6>
                <p class="text-xs text-secondary mb-0" >
                <% 
				if (pb.getProductCategoryId() == 1) {
					out.println("五穀根莖類");
				} else if (pb.getProductCategoryId()==2) {
					out.println("奶類");
				} else if (pb.getProductCategoryId()==3) {
					out.println("蛋豆魚肉類");
				} else if (pb.getProductCategoryId()==4) {
					out.println("蔬菜類");
				} else if (pb.getProductCategoryId()==5) {
					out.println("水果類");
				} else if (pb.getProductCategoryId()==6) {
					out.println("油脂與堅果種子類");
				} else if (pb.getProductCategoryId()==7) {
					out.println("調味品類");
				} else {
					out.println("無法辨別");
				}
				%>
                </p>
              </div>
            </div>
            
          </td>
          <td>
          <span class="text-secondary text-xs font-weight-bold"><%=pb.getProductUnit()%></span>
          <!--可以顯示上下兩格的表格
            <p class="text-xs font-weight-bold mb-0">Manager</p>
            <p class="text-xs text-secondary mb-0">Organization</p>
            -->
          </td>
          
          <td class="align-middle text-center">
            <span class="text-secondary text-xs font-weight-bold"><%=pb.getProductPrice()%></span>
          </td>
          <td class="align-middle text-center">
            <span class="text-secondary text-xs font-weight-bold"><%=pb.getProductOrigin()%></span>
          </td>
          <td class="align-middle text-center">
            <span class="text-secondary text-xs font-weight-bold"><%=pb.getProductStock()%></span>
          </td>
          <td class="align-middle text-center">
            <span class="text-secondary text-xs font-weight-bold">
            <% 
				if (pb.getProductStatus() == 0) {
					out.println("未上架");
				} else if (pb.getProductStatus()==1) {
					out.println("上架中");
				} else {
					out.println("無法辨別");
				}
			%>
            </span>
          </td>
           <td class="align-middle text-center" >
            <span class="text-secondary text-xs font-weight-bold" ><%=pb.getProductDescription()%></span>
          </td>
          
          
          <!--  超連結的方式我還不會
          <td class="align-middle">
            <a href="javascript:;" class="text-secondary font-weight-bold text-l" data-toggle="tooltip" data-original-title="Edit user">
              <i class="ni ni-settings"></i>
              <i class="ni ni-scissors"></i>
            </a>
          </td>
          -->
          
          <td>
		 <form  action="updateProduct" method="post">
            <input type="hidden" name="ProductId" value=<%=pb.getProductId()%> >
            <input type="hidden" name="ProductName" value=<%=pb.getProductName()%> >
            <input type="hidden" name="ProductCategoryId" value=<%=pb.getProductCategoryId()%>>
            <input type="hidden" name="productImage" value=<%=pb.getProductImage()%>>
            <input type="hidden" name="ProductUnit" value=<%=pb.getProductUnit()%> >
            <input type="hidden" name="ProductPrice" value=<%=pb.getProductPrice()%> >
            <input type="hidden" name="ProductOrigin" value=<%=pb.getProductOrigin()%>>
            <input type="hidden" name="ProductStock" value=<%=pb.getProductStock()%>>
            <input type="hidden" name="ProductStatus" value=<%=pb.getProductStatus()%>>
            <input type="hidden" name="ProductDescription" value=<%=pb.getProductDescription()%> >
<!--             <input ALIGN=center type="submit" value="修改" > -->
            <button class="btn bg-gradient-primary mb-0"    onclick="">
             <i class="ni ni-settings"></i>
     	</button>
        </form>
         </td>
         
         <td>
        <form id="deleteProduct<%=pb.getProductId()%>" action="deleteProductAction" method="post">
            <input type="hidden" name="ProductId" value=<%=pb.getProductId()%> >
            <input type="hidden" name="ProductName" value=<%=pb.getProductName()%> >
            <input type="hidden" name="ProductCategoryId" value=<%=pb.getProductCategoryId()%>>
            <input type="hidden" name="productImage" value=<%=pb.getProductImage()%>>
            <input type="hidden" name="ProductUnit" value=<%=pb.getProductUnit()%> >
            <input type="hidden" name="ProductPrice" value=<%=pb.getProductPrice()%> >
            <input type="hidden" name="ProductOrigin" value=<%=pb.getProductOrigin()%>>
            <input type="hidden" name="ProductStock" value=<%=pb.getProductStock()%>>
            <input type="hidden" name="ProductStatus" value=<%=pb.getProductStatus()%>>
            <input type="hidden" name="ProductDescription" value=<%=pb.getProductDescription()%> >
            <button type="button" class="btn bg-gradient-primary mb-0"  onclick="del(<%=pb.getProductId()%>)">
            	<i class="ni ni-scissors" ></i>
            	</button>
        </form>
        </td>
          
        </tr>
        
        <%
			}
			%>
			
      </tbody>
    </table>
  </div>
</div>
</fieldset>

<script type="text/javascript">

function del(i) {
	Swal.fire({
	  title: '確定要刪除?',
	  text: '將無法回復',
	  icon: 'warning',
	  showCancelButton: true,
	  confirmButtonColor: '#3085d6',
	  cancelButtonColor: '#d33',
	  confirmButtonText: 'delete'
	})
	.then((result) => {
		if(result.isConfirmed){
	    Swal.fire(
	      '已刪除!',
	      '商品已從資料庫移除!',
	      'success'
	    )
		.then((result) => {
	  	  $("#deleteProduct"+i).submit();
		})
	}
		})
	}	

</script>

<!-- ////////////////// 個人主文結束 //////////////////-->
		<!--////////////////// Footer(開始) //////////////////-->
		<%@include file="../includes/eFooter.jsp"%>
		<!-- ////////////////// Footer(結束) //////////////////-->

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


<script>
	(function(document) {
		  'use strict';

		  // 建立 LightTableFilter
		  var LightTableFilter = (function(Arr) {

		    var _input;

		    // 資料輸入事件處理函數
		    function _onInputEvent(e) {
		      _input = e.target;
		      var tables = document.getElementsByClassName(_input.getAttribute('data-table'));
		      Arr.forEach.call(tables, function(table) {
		        Arr.forEach.call(table.tBodies, function(tbody) {
		          Arr.forEach.call(tbody.rows, _filter);
		        });
		      });
		    }

		    // 資料篩選函數，顯示包含關鍵字的列，其餘隱藏
		    function _filter(row) {
		      var text = row.textContent.toLowerCase(), val = _input.value.toLowerCase();
		      row.style.display = text.indexOf(val) === -1 ? 'none' : 'table-row';
		    }

		    return {
		      // 初始化函數
		      init: function() {
		        var inputs = document.getElementsByClassName('light-table-filter');
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
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</body>

</html>