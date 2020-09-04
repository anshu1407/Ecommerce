<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>New User</title>
<%@include file="components/css_js.jsp" %>
</head>
<body>
<%@include file="components/navbar.jsp" %>

<div class="container-fluid">
<div class="row mt-3">
<div class="col-md-4 offset-md-4">
<div class="card">

<div class="card-header custom-bg">
<h3 class="text-center">Sign Up</h3>
</div>
<div class="card-body px-4">
<%@include file="components/message.jsp"%>

<form action="RegisterServlet" method="post">
  <div class="form-group">
    <label for="name">UserName</label>
    <input type="text" name="user_name" class="form-control" placeholder="Enter User Name" id="name" aria-describedby="emailHelp" required>
   
  </div>
  <div class="form-group">
    <label for="email">Email</label>
    <input type="email"  name="user_email" class="form-control" placeholder="Enter Email Address" id="email" required>
  </div>
  
   <div class="form-group">
    <label for="password">Password</label>
    <input type="password" name="user_password" class="form-control" placeholder="Enter Password" id="password" required>
  </div>
  
   <div class="form-group">
    <label for="phone">Phone No.</label>
    <input type="number" name="user_phone"class="form-control" placeholder="Enter Phone No." id="phone" required>
  </div>
  
   <div class="form-group">
    <label for="address">Address</label>
    <textarea name="user_address" class="form-control" placeholder="Enter Address" id="address" required></textarea>
  </div>
  <button type="submit" class="btn btn-primary">Register</button>
  <button type="reset" class="btn btn-outline-warning">Reset</button>
  
</form>
</div>
</div>
</div>
</div>

</div>
</body>
</html>