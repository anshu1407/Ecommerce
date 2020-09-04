package servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.UserDao;
import entities.User;
import helper.FactoryProvider;

public class LoginServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {

		PrintWriter out = response.getWriter();
		String email = request.getParameter("email");
		String password = request.getParameter("password");

		// validation

		// userAuthentication

		UserDao userDao = new UserDao(FactoryProvider.getFactory());
		User user = userDao.getUserByEmailAndPassword(email, password);

		// System.out.println(user);
		HttpSession httpSession = request.getSession();

		if (user == null) {
			// out.println("<h1> Invalid Details </h1>");
			httpSession.setAttribute("message", " Invalid Details");
			response.sendRedirect("login.jsp");
			return;
		} else {
			out.println("<h1>Welcome " + user.getUserName() + "</h1>");

			httpSession.setAttribute("current_user", user);

			if (user.getUserType().equals("admin")) {
				response.sendRedirect("admin.jsp");
			} else if (user.getUserType().equals("customer")) {
				response.sendRedirect("customer.jsp");
			} else {
				response.sendRedirect("login.jsp");
			}

		}

	}
}
