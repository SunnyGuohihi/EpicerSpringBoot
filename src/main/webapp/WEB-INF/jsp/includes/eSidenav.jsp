<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>



<!-- Side Navber (開始)-->
<aside
	class="sidenav bg-white navbar navbar-vertical navbar-expand-xs border-0 border-radius-xl my-3 fixed-start ms-4 "
	id="sidenav-main">
	<div class="sidenav-header">
		<i
			class="fas fa-times p-3 cursor-pointer text-secondary opacity-5 position-absolute end-0 top-0 d-none d-xl-none"
			aria-hidden="true" id="iconSidenav"></i> <a class="navbar-brand m-0"
			href=" (裝首頁jsp)https://demos.creative-tim.com/argon-dashboard/pages/dashboard.html "
			target="_blank"> <img src="../assets/img/logo-bgwhite.jpg"
			class="navbar-brand-img h-100" alt="main_logo"> <span
			class="ms-1 font-weight-bold">後臺管理</span>
		</a>
	</div>
	<hr class="horizontal dark mt-0">
	<div class="collapse navbar-collapse  w-auto "
		id="sidenav-collapse-main">
		<ul class="navbar-nav">
			
			<!-- 一個分類可彈出&連動多個連結-->
			<!-- 會員管理 -->
			<p>
				<a class="nav-link active" data-bs-toggle="collapse"
					href="#collapseMember" role="button" aria-expanded="false"
					aria-controls="collapseExample">
					 <i class="ni ni-circle-08 text-primary text-sm opacity-10" ></i>會員管理</a>
			</p>
			<div class="collapse" id="collapseMember">
			<a class="nav-link active"
				href="./pages/dashboard.html" >
					<div
						class="icon icon-shape icon-sm border-radius-md text-center me-2 d-flex align-items-center justify-content-center">
					</div> <span class="nav-link-text ms-1">使用者管理</span>
			</a>
			<a class="nav-link active" href="./pages/dashboard.html" >
					<div class="icon icon-shape icon-sm border-radius-md text-center me-2 d-flex align-items-center justify-content-center" ></div>
					<span class="nav-link-text ms-1">工作管理</span>
			</a>
			<a class="nav-link active" href="./pages/dashboard.html" >
					<div class="icon icon-shape icon-sm border-radius-md text-center me-2 d-flex align-items-center justify-content-center" ></div>
					<span class="nav-link-text ms-1">新進人員註冊</span>
			</a>
			</div>

			<!-- 食譜管理 -->
			<p>
				<a class="nav-link active" data-bs-toggle="collapse"
					href="#collapseRecipe" role="button" aria-expanded="false"
					aria-controls="collapseExample">
					 <i class="ni ni-paper-diploma text-warning text-sm opacity-10"></i>食譜管理</a>
			</p>
			<div class="collapse" id="collapseRecipe">
			<a class="nav-link active"
				href="./pages/dashboard.html" >
					<div
						class="icon icon-shape icon-sm border-radius-md text-center me-2 d-flex align-items-center justify-content-center">
					</div> <span class="nav-link-text ms-1">所有食譜</span>
			</a>
			<a class="nav-link active"
				href="./pages/dashboard.html" >
					<div
						class="icon icon-shape icon-sm border-radius-md text-center me-2 d-flex align-items-center justify-content-center">
					</div> <span class="nav-link-text ms-1">新增食譜</span>
			</a>
			</div>
			
			<!-- 商場管理 -->
			<p>
				<a class="nav-link active" data-bs-toggle="collapse"
					href="#collapseProduct" role="button" aria-expanded="false"
					aria-controls="collapseExample">
					 <i class="ni ni-shop text-success text-sm opacity-10"></i>商場管理</a>
			</p>
			<div class="collapse" id="collapseProduct">
			<a class="nav-link active"
				href="./pages/dashboard.html" >
					<div
						class="icon icon-shape icon-sm border-radius-md text-center me-2 d-flex align-items-center justify-content-center">
					</div> <span class="nav-link-text ms-1">所有商品</span>
			</a>
			<a class="nav-link active"
				href="./pages/dashboard.html" >
					<div
						class="icon icon-shape icon-sm border-radius-md text-center me-2 d-flex align-items-center justify-content-center">
					</div> <span class="nav-link-text ms-1">新增商品</span>
			</a>
			</div>
			
			<!-- 課程管理 -->
			<p>
				<a class="nav-link active" data-bs-toggle="collapse"
					href="#collapseCourse" role="button" aria-expanded="false"
					aria-controls="collapseExample">
					 <i class="ni ni-app text-info text-sm opacity-10"></i>課程管理</a>
			</p>
			<div class="collapse" id="collapseCourse">
			<a class="nav-link active"
				href="./pages/dashboard.html" >
					<div
						class="icon icon-shape icon-sm border-radius-md text-center me-2 d-flex align-items-center justify-content-center">
					</div> <span class="nav-link-text ms-1">所有課程</span>
			</a>
			<a class="nav-link active"
				href="./pages/dashboard.html" >
					<div
						class="icon icon-shape icon-sm border-radius-md text-center me-2 d-flex align-items-center justify-content-center">
					</div> <span class="nav-link-text ms-1">新增課程</span>
			</a>
			</div>
			
			<!-- 外燴管理 -->
			<p>
				<a class="nav-link active" data-bs-toggle="collapse"
					href="#collapseCuisine" role="button" aria-expanded="false"
					aria-controls="collapseExample">
					 <i class="ni ni-delivery-fast text-danger text-sm opacity-10"></i>外燴管理</a>
			</p>
			<div class="collapse" id="collapseCuisine">
			<a class="nav-link active"
				href="./pages/dashboard.html" >
					<div
						class="icon icon-shape icon-sm border-radius-md text-center me-2 d-flex align-items-center justify-content-center">
					</div> <span class="nav-link-text ms-1">所有菜單</span>
			</a>
			<a class="nav-link active"
				href="./pages/dashboard.html" >
					<div
						class="icon icon-shape icon-sm border-radius-md text-center me-2 d-flex align-items-center justify-content-center">
					</div> <span class="nav-link-text ms-1">新增菜單</span>
			</a>
			</div>
			
			<!-- 論壇管理 -->
			<p>
				<a class="nav-link active" data-bs-toggle="collapse"
					href="#collapseForum" role="button" aria-expanded="false"
					aria-controls="collapseExample">
					 <i class="ni ni-planet text-danger text-sm opacity-10"></i>論壇管理</a>
			</p>
			<div class="collapse" id="collapseForum">
			<a class="nav-link active"
				href="./pages/dashboard.html" >
					<div
						class="icon icon-shape icon-sm border-radius-md text-center me-2 d-flex align-items-center justify-content-center">
					</div> <span class="nav-link-text ms-1">所有文章</span>
			</a>
			<a class="nav-link active"
				href="./pages/dashboard.html" >
					<div
						class="icon icon-shape icon-sm border-radius-md text-center me-2 d-flex align-items-center justify-content-center">
					</div> <span class="nav-link-text ms-1">新增文章</span>
			</a>
			</div>
			
			<!-- 訂單管理 -->
			<p>
				<a class="nav-link active" data-bs-toggle="collapse"
					href="#collapseCart" role="button" aria-expanded="false"
					aria-controls="collapseExample">
					 <i class="ni ni-cart text-success text-sm opacity-10"></i>訂單管理</a>
			</p>
			<div class="collapse" id="collapseCart">
			<a class="nav-link active"
				href="./pages/dashboard.html" >
					<div
						class="icon icon-shape icon-sm border-radius-md text-center me-2 d-flex align-items-center justify-content-center">
					</div> <span class="nav-link-text ms-1">購物車明細</span>
			</a>
			<a class="nav-link active"
				href="http://localhost:8091/adminorderquery" >
					<div
						class="icon icon-shape icon-sm border-radius-md text-center me-2 d-flex align-items-center justify-content-center">
					</div> <span class="nav-link-text ms-1">所有訂單</span>
			</a>
			<a class="nav-link active"
				href="./pages/dashboard.html" >
					<div
						class="icon icon-shape icon-sm border-radius-md text-center me-2 d-flex align-items-center justify-content-center">
					</div> <span class="nav-link-text ms-1">優惠券</span>
			</a>
			</div>

			<!-- 一個分類對應一個連結-->
			<!-- 會員管理 -->
			<li class="nav-item"><a class="nav-link active"
				href="./pages/dashboard.html" >
					<div
						class="icon icon-shape icon-sm border-radius-md text-center me-2 d-flex align-items-center justify-content-center">
						<i class="ni ni-circle-08 text-primary text-sm opacity-10"></i>
					</div> <span class="nav-link-text ms-1">會員中心</span>
			</a>
			</li>

			<!-- 食譜管理 -->
			<li class="nav-item"><a class="nav-link "
				href="./pages/tables.html">
					<div
						class="icon icon-shape icon-sm border-radius-md text-center me-2 d-flex align-items-center justify-content-center">
						<i class="ni ni-paper-diploma text-warning text-sm opacity-10"></i>
					</div> <span class="nav-link-text ms-1">食譜管理</span>
			</a></li>

			<!-- 商場管理 -->
			<li class="nav-item"><a class="nav-link "
				href="./pages/billing.html">
					<div
						class="icon icon-shape icon-sm border-radius-md text-center me-2 d-flex align-items-center justify-content-center">
						<i class="ni ni-shop text-success text-sm opacity-10"></i>
					</div> <span class="nav-link-text ms-1">商場管理</span>
			</a></li>

			<!-- 課程管理 -->
			<li class="nav-item"><a class="nav-link "
				href="./pages/virtual-reality.html">
					<div
						class="icon icon-shape icon-sm border-radius-md text-center me-2 d-flex align-items-center justify-content-center">
						<i class="ni ni-app text-info text-sm opacity-10"></i>
					</div> <span class="nav-link-text ms-1">課程管理</span>
			</a></li>

			<!-- 外燴管理 -->
			<li class="nav-item"><a class="nav-link "
				href="./pages/rtl.html">
					<div
						class="icon icon-shape icon-sm border-radius-md text-center me-2 d-flex align-items-center justify-content-center">
						<i class="ni ni-delivery-fast text-danger text-sm opacity-10"></i>
					</div> <span class="nav-link-text ms-1">外燴管理</span>
			</a></li>

			<!-- 論壇管理 -->
			<li class="nav-item"><a class="nav-link "
				href="./pages/rtl.html">
					<div
						class="icon icon-shape icon-sm border-radius-md text-center me-2 d-flex align-items-center justify-content-center">
						<i class="ni ni-planet text-danger text-sm opacity-10"></i>
					</div> <span class="nav-link-text ms-1">論壇管理</span>
			</a></li>

			<!-- 購物車管理 -->
			<li class="nav-item"><a class="nav-link "
				href="./pages/billing.html">
					<div
						class="icon icon-shape icon-sm border-radius-md text-center me-2 d-flex align-items-center justify-content-center">
						<i class="ni ni-cart text-success text-sm opacity-10"></i>
					</div> <span class="nav-link-text ms-1">購物車管理</span>
			</a></li>

			<!-- 個人資料維護 -->
			<li class="nav-item mt-3">
				<h6
					class="ps-4 ms-2 text-uppercase text-xs font-weight-bolder opacity-6">Account
					pages</h6>
			</li>
			<li class="nav-item"><a class="nav-link "
				href="./pages/profile.html">
					<div
						class="icon icon-shape icon-sm border-radius-md text-center me-2 d-flex align-items-center justify-content-center">
						<i class="ni ni-single-02 text-dark text-sm opacity-10"></i>
					</div> <span class="nav-link-text ms-1">Profile</span>
			</a></li>
			<li class="nav-item"><a class="nav-link "
				href="./pages/sign-in.html">
					<div
						class="icon icon-shape icon-sm border-radius-md text-center me-2 d-flex align-items-center justify-content-center">
						<i class="ni ni-single-copy-04 text-warning text-sm opacity-10"></i>
					</div> <span class="nav-link-text ms-1">Sign In</span>
			</a></li>
			<li class="nav-item"><a class="nav-link "
				href="./pages/sign-up.html">
					<div
						class="icon icon-shape icon-sm border-radius-md text-center me-2 d-flex align-items-center justify-content-center">
						<i class="ni ni-collection text-info text-sm opacity-10"></i>
					</div> <span class="nav-link-text ms-1">Sign Up</span>
			</a></li>
		</ul>
	</div>

	<!-- Sidebar 右下方文件連動 -->
	<!--     <div class="sidenav-footer mx-3 "> -->
	<!--       <div class="card card-plain shadow-none" id="sidenavCard"> -->
	<!--         <img class="w-50 mx-auto" src="./assets/img/illustrations/icon-documentation.svg" alt="sidebar_illustration"> -->
	<!--         <div class="card-body text-center p-3 w-100 pt-0"> -->
	<!--           <div class="docs-info"> -->
	<!--             <h6 class="mb-0">Need help?</h6> -->
	<!--             <p class="text-xs font-weight-bold mb-0">Please check our docs</p> -->
	<!--           </div> -->
	<!--         </div> -->
	<!--       </div> -->
	<!--       <a href="https://www.creative-tim.com/learning-lab/bootstrap/license/argon-dashboard" target="_blank" class="btn btn-dark btn-sm w-100 mb-3">Documentation</a> -->
	<!--       <a class="btn btn-primary btn-sm mb-0 w-100" href="https://www.creative-tim.com/product/argon-dashboard-pro?ref=sidebarfree" type="button">Upgrade to pro</a> -->
	<!--     </div> -->

</aside>
<!-- Side Navber (結束)-->
