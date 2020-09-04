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

	<div class="container-fluid">
		<div class="row mt-5">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-header custom-bg">
						<h3 class="text-center">Login</h3>
					</div>
					<div class="card-body">
					<%@include file="components/message.jsp"%>
						<form action="LoginServlet" method="post">
							<div class="form-group">
								<label for="email">Email</label> <input type="email"
									name="email" class="form-control"
									placeholder="Enter Email Address" id="email">
							</div>

							<div class="form-group">
								<label for="password">Password</label> <input type="password"
									name="password" class="form-control"
									placeholder="Enter Password" id="password">
							</div >
							 <div class="text-center">
									<a href="register.jsp">if not register click here</a>
							</div>
							<div class="container text-center mt-2">
							
							<button type="submit" class="btn btn-primary">Login</button>
							<button type="reset" class="btn btn-outline-warning">Reset</button>
							</div>
						</form>

					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>