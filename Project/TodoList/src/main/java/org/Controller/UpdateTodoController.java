package org.Controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import org.Model.Bean.TodoBean;
import org.Model.Dao.UserDao;


@WebServlet("/updateTodo")
public class UpdateTodoController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		TodoBean tb = new TodoBean();
		
		tb.setId(request.getParameter("todoid"));
		tb.setTopic(request.getParameter("topic"));
		tb.setDesc(request.getParameter("desc"));
		tb.setDate(request.getParameter("date"));
		tb.setStatus(request.getParameter("status"));
		
		
		int i = UserDao.updateTodo(tb);
//		request.setAttribute("updateStatus", i);
		
		RequestDispatcher rd = request.getRequestDispatcher("updatetodo.jsp?id="+tb.getId()+"&updateStatus="+i);
		rd.forward(request, response);
	}

}
