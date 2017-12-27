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
		String id = request.getParameter("id");
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bheem", "root", "jdbc");
			String sql = "delete from registration where id=" + id;
			pstmt = con.prepareStatement(sql);
			int x = pstmt.executeUpdate();
			if (x > 0) {
				out.println("successfully Deleted");
			} else {
				out.println("unable to delete");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	%>
</body>
</html>