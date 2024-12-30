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


@WebServlet("/Login")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		HttpSession session = request.getSession();
		
		
		
		
		
		
		
		String email = request.getParameter("email");
		String pass = request.getParameter("password");
		

		
		
		if(UserDao.rowCount(email) > 0) {
			if(UserDao.checkPass(email, pass) > 0) {
				
				UserBean user = new UserBean();
				user = UserDao.fetchLogin(email, pass);
				
				
				
				session.setAttribute("user", user);
				
				RequestDispatcher rd = request.getRequestDispatcher("todolist.jsp");
				rd.forward(request, response);
				return;
			} else {
				boolean checkPass = false;
				request.setAttribute("checkPass", checkPass);	
			}
		} else {
			
			boolean notFound = true;
			request.setAttribute("notfound", notFound);	
		}
		
		RequestDispatcher rs = request.getRequestDispatcher("login.jsp");
		rs.forward(request, response);
		
		
		
		
		
		
	}

}
