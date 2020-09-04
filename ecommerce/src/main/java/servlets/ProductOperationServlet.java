package servlets;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import org.hibernate.Session;
import org.hibernate.Transaction;

import dao.CategoryDao;
import dao.ProductDao;
import entities.Category;
import entities.Product;
import helper.FactoryProvider;

@MultipartConfig
public class ProductOperationServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {

		PrintWriter out = response.getWriter();
		// which operation to perform
		String op = request.getParameter("operation");
		if (op.trim().equals("addcategory")) {
			// add category
			// fetching category data
			String title = request.getParameter("catTitle");
			String description = request.getParameter("catDescription");

			Category category = new Category();
			category.setCategoryTitle(title);
			category.setCategoryDescription(description);

			// add category into database
			CategoryDao cd = new CategoryDao(FactoryProvider.getFactory());
			int catId = cd.saveCategory(category);

			// out.println("category added" +catId);

			HttpSession httpsession = request.getSession();
			httpsession.setAttribute("message", "Category Is Succesfully Added!! " + catId);
			response.sendRedirect("admin.jsp");
			return;

		} else if (op.trim().equals("addproduct")) {
			// add product
			String pTitle = request.getParameter("proTitle");
			String pDesc = request.getParameter("proDescription");
			int pPrice = Integer.parseInt(request.getParameter("proPrice"));
			int pDiscount = Integer.parseInt(request.getParameter("proDiscount"));
			int pQuantity = Integer.parseInt(request.getParameter("proQuantity"));
			int catId = Integer.parseInt(request.getParameter("catId"));
			// store image file data
			Part part = request.getPart("proPic");

			Product product = new Product();
			product.setpTitle(pTitle);
			product.setpDesc(pDesc);
			product.setpPhoto(part.getSubmittedFileName());
			product.setpPrice(pPrice);
			product.setpDiscount(pDiscount);
			product.setpQuantity(pQuantity);

			// get category by id (want category object to pass into above
			// constructor)
			CategoryDao cd = new CategoryDao(FactoryProvider.getFactory());
			Category category = cd.getCategoryById(catId);

			product.setCategory(category);

			ProductDao pd = new ProductDao(FactoryProvider.getFactory());
			 int proId=(Integer)pd.saveProduct(product);

			// pic upload
			/* find out the path to upload photo */


		String path =request .getRealPath("img")+File.separator+"products"+File.separator+ part.getSubmittedFileName();
		System.out.println(path);

			try{
		FileOutputStream fos= new FileOutputStream(path);
		InputStream is= part.getInputStream();
			
		//reading data so make an array
    	byte [] data= new byte[is.available()];
 
		is.read(data);
	fos.write(data);
		fos.close();
		}
 		catch(Exception e){
		e.printStackTrace();
		}

			HttpSession httpsession = request.getSession();
			httpsession.setAttribute("message", "New Product Is Succesfully Added!! ");
			response.sendRedirect("admin.jsp");
			return;
		}

	}
	}
