package org.Controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import org.Model.Bean.TodoBean;
import org.Model.Bean.UserBean;
import org.Model.Dao.UserDao;


@WebServlet("/addTodo")
public class AddTodoController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String topic = request.getParameter("topic");
		String desc = request.getParameter("desc");
		String date = request.getParameter("date");
		String status = request.getParameter("status");
		
		
		HttpSession session = request.getSession();
		
		UserBean user = (UserBean)session.getAttribute("user");
		
		TodoBean tb = new TodoBean();
		
		tb.setTopic(topic);
		tb.setDesc(desc);
		tb.setDate(date);
		tb.setStatus(status);
		
		
		int i = UserDao.addTodo(user.getId(), tb);

		RequestDispatcher rd = request.getRequestDispatcher("todolist.jsp");
		rd.forward(request, response);
	}

}
