package org.Controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import org.Model.Bean.UserBean;
import org.Model.Dao.UserDao;



@WebServlet("/SignUp")
public class SignUpController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		UserBean user = new UserBean();
		
		
		String fname = request.getParameter("fname");
		String lname = request.getParameter("lname");
		String email = request.getParameter("email");
		String city = request.getParameter("city");
		String pass = request.getParameter("password");
		
		
		user.setFname(fname);
		user.setLname(lname);
		user.setEmail(email);
		user.setCity(city);
		user.setPass(pass);
		
		
		
		
		boolean registerStatus;
		
		if(UserDao.rowCount(user) > 0) {
			registerStatus = false;
		} else {
			UserDao.insert(user);
			registerStatus = true;
		}
		
	
		
//		HttpSession session = request.getSession();
//		session.setAttribute("registerStatus", registerStatus);
		
		request.setAttribute("status", registerStatus);
		RequestDispatcher rs = request.getRequestDispatcher("signup.jsp");
		rs.forward(request, response);
		
		
		
	
	}

}
