<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
		Connection con = null;
		PreparedStatement pstmt = null;
	%>
	<%
		Class.forName("com.mysql.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bheem", "root", "jdbc");
		String sql = "create table Registration(id int not null Auto_Increment,first_name varchar(100),last_name varchar(100),email_id varchar(100),password varchar(100),gender varchar(100),dob varchar(100),Primary key (id))";
		pstmt = con.prepareStatement(sql);
		int x = pstmt.executeUpdate();
		if (x > 0) {
			out.println("Table is Created");
		} else {
			out.println("Table is not Created");
		}
	%>
</body>
</html>