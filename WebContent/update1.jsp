<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>UPDATE THE CADIDATE DETAILS</title>
</head>
<body>
	<%
		String id = request.getParameter("id");
		String fname = request.getParameter("fname");
		String lname = request.getParameter("lname");
		String email = request.getParameter("email");
		String dob = request.getParameter("dob");
		if (id != null) {
			Connection con = null;
			PreparedStatement ps = null;
			int personID = Integer.parseInt(id);
			try {
				Class.forName("com.mysql.jdbc.Driver");
				con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bheem","root","jdbc");
				String sql = "Update registration set id=?,first_name=?,last_name=?,email_id=?,dob=? where id="
						+ id;
				ps = con.prepareStatement(sql);
				ps.setString(1, id);
				ps.setString(2, fname);
				ps.setString(3, lname);
				ps.setString(4, email);
				ps.setString(5, dob);
				int i = ps.executeUpdate();
				if (i > 0) {
					out.print("Record Updated Successfully");
				} else {
					out.print("There is a problem in updating Record.");
				}
			} catch (SQLException sql) {
				request.setAttribute("error", sql);
				out.println(sql);
			}
		}
	%>
</body>
</html>