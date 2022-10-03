<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-wEmeIV1mKuiNpC+IOBjI7aAzPcEZeedi5yW5f2yOq55WWLwNGmvvx4Um1vskeMj0"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-p34f1UUtsS3wqzfto5wAAmdvj+osOnFyQFpp4Ua3gs/ZVWx6oOypYoCJhGGScy+8"
	crossorigin="anonymous"></script>

<style>
li {
	width: 120px;
	font-size: 22px;
}
</style>

</head>

<body>
	<!-- Navbar -->
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<!-- Container wrapper -->
		<div class="container-fluid">
			<!-- Toggle button -->
			<button class="navbar-toggler" type="button"
				data-mdb-toggle="collapse" data-mdb-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<i class="fas fa-bars"></i>
			</button>

			<!-- Collapsible wrapper -->
			<div class="collapse navbar-collapse" id="navbarSupportedContent"
				style="text-align: center; padding-left: 10%;">
				<!-- Navbar brand -->

				</a>
				<!-- Left links -->
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li class="nav-item"><a class="nav-link"
						href="http://localhost:8091/queryallproductmenu">搜全部</a></li>
					<li class="nav-item"><a class="nav-link"
						href="http://localhost:8080/Hibernate_Web/NewSearch.jsp">找食譜</a></li>
					<li class="nav-item"><a class="nav-link"
						href="http://localhost:8080/Hibernate_Web/DisplayProduct.jsp">逛食品</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="#">找外燴</a></li>
					<li class="nav-item"><a class="nav-link"
						href="http://localhost:8080/Hibernate_Web/coursePage.jsp">找課程</a>
					</li>
					<li class="nav-item"><a class="nav-link"
						href="http://localhost:8080/ForumSpringMvc/QueryAll">論壇</a></li>
					<li class="nav-item"><a class="nav-link" href="http://localhost:8091/queryusercart">購物車</a></li>
					
					 <li class="nav-item">
                     <form name='form1' action='checkuserstatus' method='post'>
                        <a class="nav-link" href="javascript:document.form1.submit();">會員登入</a>
                          </form>
                    </li>
						
					<li class="nav-item"><a class="nav-link" href="http://localhost:8091/adminorderquery">我的訂單</a></li>
				</ul>
				<!-- Left links -->
			</div>
			<!-- Collapsible wrapper -->

			<!-- Right elements -->
			<div class="d-flex align-items-center">
				<!-- Icon -->
				<a class="text-reset me-3" href="#"> <i
					class="fas fa-shopping-cart"></i>
				</a>


			</div>
			<!-- Right elements -->
		</div>
		<!-- Container wrapper -->
	</nav>
	<!-- Navbar -->
</body>

</html>
