<%@ page import="java.util.*,com.epicer.model.users.*,com.epicer.util.*"  language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh">

<head>
<meta charset="utf-8" />
<meta name="viewport"
 content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Epicer Admin System</title>

<!-- eLindHead (開始) -->
<%@include file="../includes/eLinkHead.jsp" %>
<!-- eLindHead (結束) -->
  <style>
    body{
   background-color: antiquewhite;
    }
    
    
    #table_id_length{
     margin-left: 150px;
    
    }
    
   #table_id_filter{
    margin-left: 140px;
    margin-top:15px;
      margin-bottom: 15px;
   }
   
   #table_id_info{
    margin-top:15px;
   margin-bottom: 15px;
   margin-left: 190px;
   }
   
    #table_id_paginate{
    margin-top:15px;
      margin-bottom: 15px;
   margin-left: 190px;
   }
    
    .center {
  margin-left: auto;
  margin-right: auto;
  text-align: center;
  width: 80%;
  background-color:#fff;
  opacity: 1;
  border: 1px  solid transparents;
  border-radius: 15px;
  }
  
  select {
 background-color:#fff;
  opacity: 1;
  margin: 15px;
  width: 300px;
  height: 3em;
  padding: 8px;
  border-radius: 5px;
  }
  
  input{
  background-color:#fff;
  opacity: 1;
  margin: 15px;
  width: 100px;
  height: 3em;
  padding: 8px;
  border: 1px  solid transparents;
  border-radius: 5px;
  }
  
  
   .down{
     margin-left: auto;
  margin-right: auto;
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
<%
List<User> list = (List<User>)session.getAttribute("list");
if(list == null){ %>
<form action="user" method="post">
        <h4 style="margin-left:200px;">層級</h4>
        <div style="margin-left:200px">
        <select name="status" required>
                    <option  value="0">管理者</option>
                    <option  value="1">會員</option>
                     <option  value="4">黑名單</option>
                    </select>
                    </div>
       <input type="submit" name="submit" value="搜尋" style="margin-left:250px;margin-top:15px">
</form>
<form action="back" method="post">
        <input type="submit" name="submit" value="返回" style="margin-left:900px;margin-top:15px"  >
        </form>
<!--第二層--->

<% }else{ 
ListIterator it = list.listIterator();
Tools tools= new Tools();
Message msg = (Message)request.getAttribute("msg"); //delete
String info ="";
if(msg == null){
 info="";
}else{
 info=msg.getMessage();
} %>
<form action="user" method="post">
 <h4 id="p" value="<%= info %>" style="margin-left:250px;color:red"><%= info %></h4>
        <h4 style="margin-left:200px;">層級</h4>
        <div style="margin-left:200px">
        <select name="status" required >
                    <option  value="0">管理者</option>
                    <option  value="1">會員</option>
                      <option  value="4">黑名單</option>
                    </select>&emsp;&emsp;<input type="submit" name="submit" value="搜尋" >
                    </div>
</form>  
 <hr>
 <form action="delete" method="post" id="deleteform">
  <table class="center" id="table_id">
            <thead>
              <tr>
                <th>編號</th>
                <th>層級</th>
                <th>姓名</th>
                <th>暱稱</th>
                <th>性別</th>
              <th>生日</th>
                <th>帳號</th>
                <th>密碼</th>
               <th>電話</th>
               <th>城市</th>
                <th>區域</th>
                <th>路段</th>
                <th>上次登錄</th>
                <th>再見</th>
              </tr>
            </thead>
            <%   while(it.hasNext()){
User user = (User)it.next();%> 
 <tbody>
              <tr style="height: 75px;">
                
                <td><a href="select/${user.getId()}"><%= user.getId() %></a></td>
               <td><%= user.getStatus() %></td>
               <td><%= user.getName() %></td>
                <td><%= user.getNickname() %></td>
               <td><%= user.getGenderName(user.getGender())%></td>
               <td><%= tools.getStringDate(user.getBirth()) %></td>
                <td><%= user.getAccount() %></td>
               <td><%= user.getPassword() %></td>
                <td><%= user.getPhone() %></td>
               <td><%= user.getCityName(user.getCity())%></td>
                <td><%= user.getTownship() %></td>
               <td><%= user.getAddress() %></td>
<%                      String logindate =null;
                     logindate = tools.getStringDate(user.getLogindate());%>
                <td><%= logindate %></td>
  <td><input type="radio" name="userid" value="<%= user.getId() %>"  required></td>
              </tr>
            </tbody>
            <% }%>
 </table>
      <input type="text" name="password" id="password" placeholder="員工密碼"  style="margin-left:900px;margin-top:15px" required>
      <input type="submit" name="submit" id="delete" value="刪除"  style="margin-left:900px;margin-top:15px">
       </form>
<form action="back" method="post">
         <input type="submit" name="submit" value="返回" style="margin-left:900px;margin-top:15px"  >
         </form>
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
      <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <script src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.min.js"></script>
      <script src="js/sweetalert2.all.min.js"></script>
    <script>
    $(document).ready( function () {
        $('#table_id').DataTable(); 
        $("#delete").click(function(){
         var password = $("#password").val();
         if($.trim(password) == ""){
          Swal.fire({
             icon: 'error',
             title: 'Oops...',
             text: '請先輸入密碼',
           })
          return;
         }
         if(confirm("是否確定刪除")){
          $('#deleteform').submit();
          return true;
         }else{
          return false;
         }
        })    //click   
    } ); //底
    </script>
</body>
</html>
<% } %>