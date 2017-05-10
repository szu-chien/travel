<%@
	page language="java"
	contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"
  import="java.sql.*,
          java.util.*"
%>
<%
	response.setHeader("Access-Control-Allow-Origin", "*");
	String sqlCommand=null;
	Connection connection=null;
	Statement statement=null;
	ResultSet rs = null;

	Class.forName("com.mysql.jdbc.Driver");

	try{
		String url="jdbc:mysql://localhost:3306/log";
		String db_user="root";
		String db_pwd="";
	  connection = DriverManager.getConnection(url,db_user,db_pwd);
	  statement = connection.createStatement();
	}
	catch(SQLException sqle)
	{
    	out.println("");
  }

	sqlCommand = "select * from log";
	rs = statement.executeQuery(sqlCommand);
  out.println(rs);
	// JSONArray list = new JSONArray();
	// while (rs.next()) {
  //   // JSONObject object = new JSONObject();
	// 	// int id = rs.getInt("id");
	// 	String name = rs.getString("name");
	// 	// String number = rs.getString("number");
	// 	// object.put("id",id);
	//   // object.put("name", name);
	//   // object.put("number", number);
	//   // list.put(object);
  //   out.println(name);
	// }
  // out.println(list);
%>
