<%@page import="helper.Helper"%>
<%@page import="entities.Category"%>
<%@page import="dao.CategoryDao"%>
<%@page import="entities.Product"%>
<%@page import="java.util.List"%>
<%@page import="dao.ProductDao"%>
<%@page import="helper.FactoryProvider"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<html>
<head>
<title>Ecommerce</title>
<%@include file="components/css_js.jsp" %>


</head>
<body>

<%@include file="components/navbar.jsp" %>
<div class="row mt-3 mx-3">
<%
  ProductDao dao=new ProductDao(FactoryProvider.getFactory());
  List<Product> list= dao.getAllProducts();
  
  CategoryDao cdao= new CategoryDao(FactoryProvider.getFactory());
  List<Category> clist= cdao.getCategories();
%>
<!-- show categories -->
<div class="col-md-2">
<div class="list-group">
 <a href="#" class="list-group-item list-group-item-action active custom-bg">
   All Products
  </a>
  
<%

 for(Category category : clist){
	%>
 <a href="#" class="list-group-item list-group-item-action"><%=category.getCategoryTitle() %></a>
	 <%
 }
%>
</div>
</div>

<!-- show products -->
<div class="col-md-10">
<div class="row mt-1 ">
<div class="col-md-12">
<div class="card-columns">

<!--traversing products  -->
<%
 for(Product product : list)
 {
%>
<div class="card">

<img class="card-img-top m-2" src="img/products/<%=product.getpPhoto() %>" style="max-height: 270px" alt="img loading">
<div class="card-body">

<h5 class="card-tittle"><%=product.getpTitle()%></h5>
<p class="card-text"><%=Helper.get30words(product.getpDesc()) %></p>
</div>


<div class="card-footer">
<button class="btn custom-bg text-white">Add To Cart</button>
<span>	&#8377; <%= product.getpPrice() %></span>
</div>
</div>


<%
}

%>


</div>
</div>

</div>


</div>


</div>

</body>
</html>
