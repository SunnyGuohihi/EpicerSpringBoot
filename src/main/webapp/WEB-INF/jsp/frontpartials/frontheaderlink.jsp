<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- *********  極重要!!! 不可以缺漏  ******** -->
<!-- ////// 每隻jsp 的最上面 : html起始設定~到 <body> ////// -->
<!-- ////// Epicer 的title會直接固定(暫時不給改) ////// -->

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="zh-tw">
<head>

<!-- Basic Page Needs
  ================================================== -->
<meta charset="utf-8">
<title>Epic-ER 料理生活購物平台</title>

<!-- Mobile Specific Metas (提供網頁的內容資訊給瀏覽器或存取網頁的服務使用)
  ================================================== -->
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="description"
	content="Epic-ER 是一個料理生活並與購物結合的地方，提供大家共享食譜、購買食材、烹飪課程以及論壇討論的複合型平台。讓使用者進入Epic-ER中，就能藉由各種料理體驗生活滿滿幸福的氛圍。">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=5.0">
<meta name="author" content="iSpan EEIT 49 第二組">
<meta name="generator" content="Epic-ER iSpan EEIT49">

<!-- Favicon -->
<link rel="shortcut icon" type="image/x-icon"
	href="./source/images/favicon.png" />

<!-- Themefisher Icon font -->
<link rel="stylesheet"
	href="./source/plugins/themefisher-font/style.css">
<!-- bootstrap.min css -->
<link rel="stylesheet"
	href="./source/plugins/bootstrap/css/bootstrap.min.css">

<!-- Animate css -->
<link rel="stylesheet" href="./source/plugins/animate/animate.css">
<!-- Slick Carousel -->
<link rel="stylesheet" href="./source/plugins/slick/slick.css">
<link rel="stylesheet" href="./source/plugins/slick/slick-theme.css">

<!-- Main Stylesheet -->
<link rel="stylesheet" href="./source/css/style.css">
<!-- ================  後臺套版功能也可以用  ============= -->
<link rel="apple-touch-icon" sizes="76x76" href="./assets/img/apple-icon.png">
<link rel="icon" type="image/png" href="./assets/img/favicon.png">
<!--     Fonts and icons     -->
<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet" />
<!-- Nucleo Icons --> 
<link href="./assets/css/nucleo-icons.css" rel="stylesheet" />
<link href="./assets/css/nucleo-svg.css" rel="stylesheet" />
<!-- Font Awesome Icons --> 
<script src="https://kit.fontawesome.com/42d5adcbca.js" crossorigin="anonymous"></script>
<link href="./assets/css/nucleo-svg.css" rel="stylesheet" />
<!-- CSS Files 會撞到所以先註解 --> 
<!-- <link id="pagestyle" href="./assets/css/argon-dashboard.css?v=2.0.4" rel="stylesheet" /> -->
<!-- Custom fonts for this template--> 
<link href="./assets/css/all.min.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

<!-- Custom styles for this template-->
<link href="./assets/css/sb-admin-2.min.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js"></script>

<!-- ================  其他補充功能  ============= -->
<!-- SweetAlert2 -->
<script src="js/sweetalert2.all.min.js"></script>
<!-- Data Table -->
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.12.1/css/jquery.dataTables.css">
