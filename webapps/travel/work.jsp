<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id = "database" class="com.database.Database">
  <jsp:setProperty property="ip" name="database" value="localhost" />
  <jsp:setProperty property="port" name="database" value="3306" />
  <jsp:setProperty property="db" name="database" value="log" />
  <jsp:setProperty property="user" name="database" value="root" />
  <jsp:setProperty property="password" name="database" value="" />
</jsp:useBean>

<%
  // 資料庫連接
  database.connectDB();
  // 執行sql指令
  database.query("select * from log;");
  ResultSet rs = database.getRS();
  out.println(rs);
%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title></title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.98.2/css/materialize.min.css">

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
    <!-- Compiled and minified JavaScript -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.98.2/js/materialize.min.js"></script>
  </head>
  <body>
    <div class="navbar-fixed">
          <nav>
              <div class="nav-wrapper">
                <center>
                  <h style="font-size:25px;font-weight:bold;">會員資料</h>
                </center>
              </div>
          </nav>
      </div>
      <div class="row">
        <%
            out.println(rs);
            // 檢查資料庫是否有資料
            if (rs != null){
              // 搜尋資料庫資料 next會尋找下一筆資料
              while(rs.next()){
                String id = rs.getString("id");
                String account = rs.getString("account");
                String password = rs.getString("password");
                String email = rs.getString("email");
                String username = rs.getString("username");
                out.println("test");
                out.println(username);
        %>
        <div class="col s6">
          <div class="card horizontal">
                <div class="card-image" style="padding:2vh;">

                </div>
                <div class="card-stacked">
                    <div class="card-content">
                        <h style="font-size:20px;font-weight:bold;"><%=username%></h>
                        <p>帳號： <%=account%></p>
                        <p>信箱：<%=email%></p>
                    </div>
                    <div class="card-action">
                      <a href="detail.jsp?id=<%=id%>">詳細資訊</a>
                    </div>
                </div>
            </div>
        </div>
        <%}}%>
      </div>
  </body>
</html>
