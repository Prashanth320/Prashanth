<%@page import="java.sql.ResultSet"%>
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
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		Class.forName("com.mysql.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bheem", "root", "jdbc");
		String sql = "select email_id,password from registration where email_id=? and password=?";
		pstmt.setString(1, email);
		pstmt.setString(2, password);
		pstmt = con.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		while (rs.next()) {
			if (rs.getString(password).equals("password") && rs.getString(email).equals("email")) {
				out.println("Successfully logged in:"+email);
			} else {
				out.println("invalid username/password");
			}
		}
	%>
</body>
</html>