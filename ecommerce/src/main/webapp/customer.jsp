<%@page import="entities.User"%>
<%

User user= (User) session.getAttribute("current_user");

if(user==null)
{
	session.setAttribute("message", "you are not logged in!! Login First");
	response.sendRedirect("login.jsp");
	return;
}

%>



<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<%@include file="components/css_js.jsp"%>
</head>
<body>

<%@include file="components/navbar.jsp"%>
<h1>User panel</h1>
</body>
</html>