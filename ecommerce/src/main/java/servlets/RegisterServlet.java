package servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import helper.FactoryProvider;
import org.hibernate.Session;
import org.hibernate.Transaction;

import entities.User;

public class RegisterServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
		PrintWriter out = response.getWriter();
		try {
			String userName = request.getParameter("user_name");
			String userEmail = request.getParameter("user_email");
			String userPassword = request.getParameter("user_password");
			String userPhone = request.getParameter("user_phone");
			String userAddress = request.getParameter("user_address");

			// validation

			if (userName.isEmpty()) {
				out.println("enter a name");
				return;
			}
			// creating user object to store data

			User user = new User(userName, userEmail, userPassword, userPhone, "default.jpg", userAddress, "customer");

			Session hibernateSession = FactoryProvider.getFactory().openSession();

			Transaction tx = hibernateSession.beginTransaction();

			int userId = (Integer) hibernateSession.save(user);
			tx.commit();
			hibernateSession.close();

			HttpSession httpSession = request.getSession();
			httpSession.setAttribute("message", "Registration is successfully done!! User id is " + userId);
			response.sendRedirect("register.jsp");
			return;

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
