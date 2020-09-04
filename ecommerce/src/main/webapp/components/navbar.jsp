<%@page import="entities.User"%>
<%

User user1= (User) session.getAttribute("current_user");


%>



<nav class="navbar navbar-expand-lg navbar-dark custom-bg">
<div class="container">
  <a class="navbar-brand" href="#">Shopping</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo02" aria-controls="navbarTogglerDemo02" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarTogglerDemo02">
    <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
      <li class="nav-item active">
        <a class="nav-link" href="index.jsp">Home <span class="sr-only">(current)</span></a>
      </li>
     
    </ul>
  
    <form class="form-inline my-2 my-lg-0">
      <input class="form-control mr-sm-2" type="search" placeholder="Search">
      <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
    </form>
    
   <ul class="navbar- nav ml-auto ">
   
   <!-- conditional rendering -->
   <%
   if(user1==null){
   
   
   %>
   
    <li class="nav-item active  ">
        <a class="nav-link text-white" href="login.jsp">Login</a>
      </li>
      
       <li class="nav-item active ">
        <a class="nav-link text-white" href="register.jsp">Registration</a>
      </li>
   
  <%
  
     }
   else{
       
	   %>
	       <li class="nav-item active  ">
        <a class="nav-link text-white"  href="#!"><%= user1.getUserName() %></a>
      </li>
      
       <li class="nav-item active ">
        <a class="nav-link text-white" href="LogoutServlet">Logout</a>
      </li>
   
  <%
  
     }
      %>
     
   </ul>
  </div>

</div>
</nav>