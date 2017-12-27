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
		String fname = request.getParameter("fname");
		String lname = request.getParameter("lname");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String gender = request.getParameter("gender");
		String dob = request.getParameter("dob");
		try {

			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bheem", "root", "jdbc");
			String sql = "insert into registration(First_name,Last_name,email_id,password,gender,dob) values(?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, fname);
			pstmt.setString(2, lname);
			pstmt.setString(3, email);
			pstmt.setString(4, password);
			pstmt.setString(5, gender);
			pstmt.setString(6, dob);
			int x = pstmt.executeUpdate();
			if (x > 0) {
				out.println("successfully Registered");
				RequestDispatcher rd = request.getRequestDispatcher("insert.jsp");
				rd.forward(request, response);
			} else {
				out.println("Fail to Register");
				RequestDispatcher rd = request.getRequestDispatcher("insert.jsp");
				rd.forward(request, response);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (con != null) {
				con.close();
			}
		}
	%>
</body>
</html>