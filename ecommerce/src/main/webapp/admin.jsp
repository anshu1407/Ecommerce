
<%@page import="entities.Category"%>
<%@page import="java.util.List"%>
<%@page import="helper.FactoryProvider"%>
<%@page import="dao.CategoryDao"%>
<%@page import="entities.User"%>
<%

User user= (User) session.getAttribute("current_user");

if(user==null)
{
	session.setAttribute("message", "you are not logged in!! Login First");
	response.sendRedirect("login.jsp");
	return;
}
else
	{
	if (user.getUserType().equals("customer")){

		session.setAttribute("message", "you can not acces this page..");
		response.sendRedirect("login.jsp");
	}
	
}

%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin</title>
<%@include file="components/css_js.jsp"%>
<style type="text/css">

.admin .card{
	
	border:1px solid #6200EE;
	
}

.admin .card:hover{
	
	background:#e2e2e2;
	cursor: pointer;
}

</style>
</head>
<body>

	<%@include file="components/navbar.jsp"%>
	<div class="container admin">
	<div class="container-fluid mt-3" >
	<%@include file="components/message.jsp" %>
	</div>
		<!--row  -->
		<div class="row mt-3">
			<!-- column 1-->
			<div class="col-md-4">
			
				<div class="card">
					<div class=" card-body text-center">
					<div class="container">
					<img style="max-width:100px;" class="img-fluid  rounded-circle" src="img/user.png"  alt="user_icon">
					</div>
					<h1>67888</h1>
						<h2 class="text-uppercase text-muted">User</h2>
                        

					</div>

				</div>

			</div>
			<!-- column 2  -->
			<div class="col-md-4">
				<div class="card">
					<div class=" card-body text-center">
						<div class="container">
					<img style="max-width:100px;" class="img-fluid rounded-circle" src="img/list.png"  alt="list_icon">
					</div>
                        <h1>6789</h1>
						<h2 class="text-uppercase text-muted">Categories</h2>

					</div>

				</div>


			</div>
			<!--column 3  -->
			<div class="col-md-4">
				<div class="card">
					<div class=" card-body text-center">
						<div class="container">
					<img style="max-width:100px;" class="img-fluid rounded-circle" src="img/product.png"  alt="product_icon">
					</div>
						<h1>67888</h1>
						<h2 class="text-uppercase text-muted">Products</h2>
					</div>
				</div>
			</div>

		</div>
		<div class="row mt-3">
	<!-- 	second-row first column -->
		<div class="col-md-6">
		<div class="card" data-toggle="modal" data-target="#add-category-modal">
					<div class=" card-body text-center ">
						<div class="container">
					<img style="max-width:100px;" class="img-fluid rounded-circle" src="img/category.png"  alt="category_icon">
					</div>
						<h6>click here to add category</h6>
						<h2 class="text-uppercase text-muted">Add Category</h2>
					</div>
				</div>
		
		
		</div>
			<!-- 	second-row second column -->
		<div class="col-md-6">
		<div class="card" data-toggle="modal" data-target="#add-product-modal">
					<div class=" card-body text-center">
						<div class="container">
					<img style="max-width:100px;" class="img-fluid rounded-circle" src="img/new-product.png"  alt="new-product_icon">
					</div>
						<h6>click here to add product</h6>
						<h2 class="text-uppercase text-muted">Add New-Products</h2>
					</div>
				</div>
		
		</div>
		
		
		</div>

	</div>

<!-- add category modal -->


<!-- Modal -->
<div class="modal fade" id="add-category-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header custom-bg text-white">
        <h5 class="modal-title" id="exampleModalLabel">Add Category Details</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
       <form action="ProductOperationServlet" method="post">
       <input type="hidden" name="operation" value="addcategory">
       <div class="form-group">
       <input type="text" class="form-control" name="catTitle" placeholder="Category Title" required>
       </div>
         <div class="form-group">
       <textarea style="height:150px" class="form-control" name="catDescription" placeholder="Category Description" required></textarea>
       </div>
       <div class="container text-center">
         <button type="submit" class="btn btn-primary custom-bg">Add Category</button>
    <button type="button" class="btn btn-secondary " data-dismiss="modal">Close</button>
       </div>
       </form>
      </div>

    </div>
  </div>
</div>

<!-- End category modal -->

<!-- add product modal -->


<!-- Modal -->
<div class="modal fade" id="add-product-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header custom-bg text-white">
        <h5 class="modal-title" id="exampleModalLabel">Add Product Details</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      <!--  enctype="multipart/form-data"  it means we have image or audio in our form-->
    <form action="ProductOperationServlet" method="post" enctype="multipart/form-data">
     <input type="hidden" name="operation" value="addproduct">
       <div class="form-group">
       <input type="text" class="form-control" name="proTitle" placeholder="Product Title" required>
       </div>
         <div class="form-group">
       <textarea style="height:150px" class="form-control" name="proDescription" placeholder="Product Description" required></textarea>
       </div>
         
         <div class="form-group">
       <input type="number" class="form-control" name="proPrice" placeholder="Product Price" required>
       </div>
         <div class="form-group">
       <input type="number" class="form-control" name="proDiscount" placeholder="Product Discount" required>
       </div>
         <div class="form-group">
       <input type="number" class="form-control" name="proQuantity" placeholder="Product Quantity" required>
       </div>
       
       <%
       CategoryDao cd = new CategoryDao(FactoryProvider.getFactory());
       
      List<Category>list= cd.getCategories();
       
       %>
         <div class="form-group">
       <select name="catId" class="form-control" id="">
         <% for(Category c: list){%>
         
         <option  value="<%= c.getCategoryId()%>"><%=c.getCategoryTitle() %></option>
      
         <%}
         %>
              </select>
    
         </div>
          <div  class="form-group">
          <label for="proPic" >Select Image For Product </label>
          <input type="file" name="proPic" id="proPic" required>
          </div>
       <div class="container text-center">
         <button type="submit" class="btn btn-primary custom-bg">Add Product</button>
        <button type="button" class="btn btn-secondary " data-dismiss="modal">Close</button>
       </div>
       </form>
      </div>
     
    </div>
  </div>
</div>

<!-- End product modal -->

</body>
</html>