<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
span {
position:relative;
overflow:hidden;
white-space: nowrap;  
overflow: hidden;  
text-overflow: ellipsis; 
max-width:600px;
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
<form accept-charset="UTF-8" id="global-search" action="recipelist" method="post">
                          <div class="to-search">
                            <div class="search-by-keyword">
                              <div class="focus-input search-container search-recipe select-input"> 搜尋：<input type="search" class="light-table-filter" data-table="order-table" placeholder="請輸入食譜名" name="searchByRecipe">
                                <input type="submit">
                              </div>
                            </div>
                            <h3>
                              <a class="header-action-link" href="http://localhost:8091/to/add" rel="nofollow"><i class="icon-plus-regular"></i>&nbsp;寫食譜 
                              </a>
                            </h3>
                          </div>
                        </form>
<div class="card">
  <div class="table-responsive">
    <table class="table align-items-center mb-0" width = "100%">
    <colgroup>
			<col width="16%">
			<col width="52%">
			<col width="8%">
			<col width="8%">
			<col width="8%">
			<col width="8%">
		</colgroup>
      <thead>
        <tr>
          <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">食譜名稱</th>
          <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">食譜簡介</th>
          <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">烹調時間</th>
          <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">幾人份</th>
          <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">修改</th>
          <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">刪除</th>
        </tr>
      </thead>
      <c:forEach items="${requestScope.searchAll}" var="item">
      <tbody>
        <tr>
        <form name="Form" action="/recipe/${item.recipeId}" method="POST">
         <input type="hidden" name="_method" value="DELETE" >
          <td>
            <div class="d-flex px-2 py-1">
              <div>
                <img src="${pageContext.request.contextPath}/${item.imgPath}" class="avatar avatar-sm me-3">
              </div>
              <div class="d-flex flex-column justify-content-center">
                <h6 class="mb-0 text-xs"><a href="${pageContext.request.contextPath}/reciperesult/${item.recipeId}">${item.recipeName}</h6>
<!--                 <p class="text-xs text-secondary mb-0">john@creative-tim.com</p> -->
              </div>
            </div>
          </td>
          <td>
<%--             <p class="text-xs font-weight-bold mb-0">${item.recipeDescription}</p> --%>
            <span class="mb-0 text-xs" >${item.recipeDescription}</span>
<!--             <p class="text-xs text-secondary mb-0">Organization</p> -->
          </td>
          <td class="align-middle text-center text-sm">
            <span class="mb-0 text-xs">${item.cookTime}</span>
          </td>
          <td class="align-middle text-center">
            <span class="text-secondary text-xs font-weight-bold">${item.howManyPeople}</span>
          </td>
          <td class="align-middle">
            <a href="${pageContext.request.contextPath}/recipeForUpdate/${item.recipeId}">修改</a>
          </td>
           <td class="align-middle">
           <input type="submit" value="刪除">
          </td>
          </form>
        </tr>
      </tbody>
      </c:forEach>

    </table>
  </div>
</div>
<script>
		(function(document) {
			'use strict';

			// 建立 LightTableFilter
			var LightTableFilter = (function(Arr) {

				var _input;

				// 資料輸入事件處理函數
				function _onInputEvent(e) {
					_input = e.target;
					var tables = document.getElementsByClassName(_input
							.getAttribute('data-table'));
					Arr.forEach.call(tables, function(table) {
						Arr.forEach.call(table.tBodies, function(tbody) {
							Arr.forEach.call(tbody.rows, _filter);
						});
					});
				}

				// 資料篩選函數，顯示包含關鍵字的列，其餘隱藏
				function _filter(row) {
					var text = row.textContent.toLowerCase(), val = _input.value
							.toLowerCase();
					row.style.display = text.indexOf(val) === -1 ? 'none'
							: 'table-row';
				}

				return {
					// 初始化函數
					init : function() {
						var inputs = document
								.getElementsByClassName('light-table-filter');
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

</body>

</html>