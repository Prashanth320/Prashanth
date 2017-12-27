<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Registration</title>
</head>
<body>
	<form action="InsertData.jsp" method="post">
		<h1 align="center">Registration for Candidate</h1>
		<table align="center">
			<tr>
				<td>First_Name</td>
				<td><input type="text" name="fname"></td>
			</tr>
			<tr>
				<td>Last_Name</td>
				<td><input type="text" name="lname"></td>
			</tr>
			<tr>
				<td>email_id</td>
				<td><input type="text" name="email"></td>
			</tr>
			<tr>
				<td>password</td>
				<td><input type="password" name="password"></td>
			</tr>
			<tr>
				<td>Gender</td>
				<td><input type="radio" name="gender" value="Male">Male
					<input type="radio" name="gender" value="FeMale">FeMale</td>
			</tr>
			<tr>
				<td>DOB</td>
				<td><input type="text" name="dob"></td>
			</tr>
			<tr>
				<td><input type="reset" value="Reset"> <input
					type="submit" value="Register"></td>
			</tr>
		</table>
	</form>
</body>
</html>