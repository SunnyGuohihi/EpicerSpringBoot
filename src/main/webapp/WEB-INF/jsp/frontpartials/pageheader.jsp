<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<section class="pageheader">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="content">
					<ol class="breadcrumb">
					<h1 class="page-name">${param.title}</h1>
						<li><a href="index.html">首頁</a></li>
						<li class="active">${param.pagination}</li>
					</ol>
				</div>
			</div>
		</div>
	</div>
</section>