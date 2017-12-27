<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Getting Data</title>
</head>
<body>
	<h1 align="center">Candidate Details</h1>
	<table align="center" border="1">
		<tr>
			<td>id</td>
			<td>First_name</td>
			<td>Last_name</td>
			<td>Email_id</td>
			<td>Gender</td>
			<td>DOB</td>
			<td>Action</td>
		</tr>
		<%
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
		%>
		<%
			try {
				Class.forName("com.mysql.jdbc.Driver");
				con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bheem", "root", "jdbc");
				String sql = "select * from registration";
				pstmt = con.prepareStatement(sql);
				rs = pstmt.executeQuery();
				while (rs.next()) {
		%>
		<tr>
			<td><%=rs.getString("id")%></td>
			<td><%=rs.getString("first_name")%></td>
			<td><%=rs.getString("last_name")%></td>
			<td><%=rs.getString("email_id")%></td>
			<td><%=rs.getString("gender")%></td>
			<td><%=rs.getString("dob")%></td>
			<td><a href="update.jsp?id=<%=rs.getString("id")%>">update</a>/
			<a href="delete.jsp?id=<%=rs.getString("id") %>">Delete</a></td>
		</tr>

		<%
			}
			} catch (Exception e) {
				e.printStackTrace();
			}
		%>
	</table>
</body>
</html>