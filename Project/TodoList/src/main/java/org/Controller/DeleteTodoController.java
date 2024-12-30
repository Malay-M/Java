package org.Controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import org.Model.Dao.UserDao;

@WebServlet("/deleteTodo")
public class DeleteTodoController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String todoId = request.getParameter("id");
		
		int i = UserDao.deleteTodo(todoId);
		
		RequestDispatcher rd = request.getRequestDispatcher("todolist.jsp");
		rd.forward(request, response);
	}

}
