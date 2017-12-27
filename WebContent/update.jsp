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
<title>UPDATE CANDIDATE DETAILS</title>
</head>
<body>
	<form action="update1.jsp" method="post">
		<h1 align="center">Update Candidate Details</h1>
		<table align="center">
			<%
				Connection con = null;
				PreparedStatement pstmt = null;
				ResultSet rs = null;
			%>
			<%
				String id = request.getParameter("id");
				try {
					Class.forName("com.mysql.jdbc.Driver");
					con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bheem", "root", "jdbc");
					String sql = "select * from registration where id=" + id;
					pstmt = con.prepareStatement(sql);
					rs = pstmt.executeQuery();
					while (rs.next()) {
			%>
			<tr>
				<td><input type="hidden" name="id"
					value="<%=rs.getString("id")%>"> <input type="text"
					name="id" value="<%=rs.getString("id")%>"></td>
			</tr>
			<tr>
				<td>First_name</td>
				<td><input type="text" name="fname"
					value="<%=rs.getString("first_name")%>"></td>
			</tr>
			<tr>
				<td>Last_name</td>
				<td><input type="text" name="lname"
					value="<%=rs.getString("last_name")%>"></td>
			</tr>
			<tr>
				<td>email_id</td>
				<td><input type="text" name="email"
					value="<%=rs.getString("email_id")%>"></td>
			</tr>
			<tr>
				<td>Dob</td>
				<td><input type="text" name="dob"
					value="<%=rs.getString("dob")%>"></td>
			</tr>
			<tr>
				<td><input type="reset" value="Reset"> <input
					type="submit" value="Update"></td>
			</tr>
			<%
				}
				} catch (Exception e) {
					e.printStackTrace();
				}
			%>
		</table>
	</form>
</body>
</html>