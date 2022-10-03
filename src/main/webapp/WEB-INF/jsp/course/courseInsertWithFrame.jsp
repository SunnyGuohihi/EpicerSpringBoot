<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.*, com.epicer.model.course.*,com.epicer.controller.*,org.hibernate.Session,
org.hibernate.SessionFactory,com.epicer.util.*"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html lang="zh">

<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Epicer Admin System</title>

<!-- eLindHead (開始) -->
<%@include file="../includes/eLinkHead.jsp"%>
<!-- eLindHead (結束) -->
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

		<%
		TimeTest TT = new TimeTest();
		Date date = new Date();
		String stringDate = TT.TransDateToString(date);
		%>

		<h1>新增課程</h1>
		<div class="p-4 bg-secondary">
			<form:form action="addCourse" method="post" modelAttribute="Course"
				enctype="multipart/form-data">
				<table>
					<!-- courseName -->
					<tr>
						<div class="col-md-6">
							<div class="form-group">
								<td><label>課程名稱:</label></td>
								<td><form:input type="text" path="courseName"
										class="form-control form-control-alternative"
										id="exampleFormControlInput1" placeholder="請輸入課程名稱" /></td>
							</div>
						</div>
					</tr>

					<!-- coursePrice -->
					<tr>
						<div class="col-md-6">
							<div class="form-group">
								<td><label>課程價錢：</label></td>
								<td><form:input type="text" path="coursePrice"
										class="form-control form-control-alternative"
										id="exampleFormControlInput1" placeholder="請輸入課程價錢" /></td>
							</div>
						</div>
						</div>
					</tr>

					<!-- courseDescription -->
					<tr>
						<div class="col-md-6">
							<div class="form-group">
								<td><label>課程介紹：</label></td>
								<td><form:textarea type="textarea" path="courseDescription"
										class="form-control" id="exampleFormControlTextarea1"
										cols="40" rows="5" style="resize:none" placeholder="請輸入課程描述"></form:textarea></td>
							</div>
						</div>
						</div>
					</tr>


					<!-- courseDate -->
					<tr>
						<div class="col-md-6">
							<div class="form-group">
								<td><label>課程日期：</label></td>
								<td><form:input type="date" path="fakeCourseDate"
										min="<%=stringDate%>" /></td>
							</div>
						</div>
						</div>
					</tr>

					<!-- teacherId -->
					<!--  <tr>
						<div class="col-md-6">
							<div class="form-group">
								<td><label>老師ID：</label></td>
								<td><form:input type="text" path="fakeTeacherID"
										class="form-control form-control-alternative"
										id="exampleFormControlInput1" placeholder="name@example.com" /></td>
							</div>
						</div>
						</div>
					</tr>-->

					<!-- 測試下拉式選單 -->
					<tr>
						<div class="form-group">
							<td><label>老師：</label></td>
							<td><form:select path="fakeTeacherID"
									class="form-control form-control-alternative"
									id="exampleFormControlInput1">
									<option>可選的老師</option>
									<%
									List<Teacher> list = (List<Teacher>) request.getAttribute("listAll");
									for (Teacher t : list) {
									%>
									<option><%=t.getTeacherId()%></option>
									<%
									}
									%>

								</form:select></td>
						</div>
					</tr>

					<!-- classroomId -->
					<tr>
						<div class="form-group">
							<td><label>教室：</label></td>
							<td><form:select path="classroomId"
									class="form-control form-control-alternative"
									id="exampleFormControlInput1" placeholder="name@example.com">
									<option>可選的教室</option>
									<option>101</option>
									<option>102</option>
									<option>103</option>
								</form:select></td>
						</div>
					</tr>


					<!--  <tr>
				<td><label>教室ID：</label></td>
				<td><form:input type="text" path="classroomId" /></td>
			</tr>-->

					<!-- courseStyle -->
					<tr>
						<div class="form-group">
							<td><label>課程類別：</label></td>
							<td><form:select path="courseStyle"
									class="form-control form-control-alternative"
									id="exampleFormControlInput1" placeholder="name@example.com">
									<option>請選擇類別</option>
									<option>技術類</option>
									<option>主食類</option>
									<option>甜點類</option>
									<option>節慶套餐類</option>
								</form:select></td>
						</div>
					</tr>


					<!-- image -->
					<tr>
						<td><label>課程圖片：</label></td>
						<td><input type="file" name="photo"
							class="form-control form-control-alternative" id="Ann"
							placeholder="name@example.com" /></td>
						<td><img width=200 id="gmi" src=""></td>
					</tr>


					<tr>
						<td colspan="8"><button type="submit" value="Send"
								class="btn bg-gradient-primary">提交新增</button></td>
					</tr>
				</table>
			</form:form>
		</div>






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

	<script type="text/javascript" src="js/jquery-3.6.0.js"></script>
	<script type="text/javascript">
		$(function() {
			$('#Ann').on('change', function(e) {
				const file = this.files[0];//將上傳檔案轉換為base64字串
				const fr = new FileReader();//建立FileReader物件
				fr.onload = function(e) {
					$('#gmi').attr('src', e.target.result);//读取的结果放入圖片
				};
				// 使用 readAsDataURL 將圖片轉成 Base64
				fr.readAsDataURL(file);
			});
		});
	</script>

</body>

</html>