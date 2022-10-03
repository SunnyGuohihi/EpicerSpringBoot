<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh">

<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Epicer管理員系統</title>

<!-- eLinkHead (開始) -->
<%@include file="../includes/eLinkHead.jsp"%>
<!-- eLinkHead (結束) -->
<!-- <link rel="stylesheet" href="../assets/js/plugins/sweetalert2.min.css"> -->
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.12.1/css/jquery.dataTables.css">
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



		Hello ni hao ma<br /> Hello ni hao ma<br /> Hello ni hao ma<br />
		Hello ni hao ma<br /> Hello ni hao ma<br /> Hello ni hao ma<br />

		個人文字打在這<br />



		<button class="btn bg-gradient-primary mb-0"
			onclick="Swal.fire('Any fool can use a computer')">Try me!</button>
			
		<button class="btn bg-gradient-primary mb-0"
			onclick="
			Swal.fire({
				  title: 'Custom width, padding, color, background.',
				  width: 600,
				  padding: '3em',
				  color: '#716add',
				  background: '#fff url(/images/trees.png)',
				  backdrop: `
				  	rgba(0,0,123,0.4)
				    url('images/a2c7860c8aafc86438b3e9568b47b252.gif')
				    left top
				    no-repeat
				  `
				  })"
				  
				  >Try me!</button>
			
			
	<table id="myTable">
	
	
	</table>






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

	<!-- 	<script src="../../assets/js/plugins/sweetalert2.min.js"></script> -->
	<!-- 	<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script> -->

	<!-- 	<script src="../assets/js/plugins/sweetalert2.min.js"></script> -->
	<!-- 	<link rel="stylesheet" href="sweetalert2.min.css"> -->

	<script type="text/javascript" charset="utf8"
		src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.js"></script>
	
	
	<script>
		$('#myTable').dataTable({});
	</script>
	
	




</body>

</html>