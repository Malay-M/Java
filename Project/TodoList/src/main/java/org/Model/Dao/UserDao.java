package org.Model.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import org.Misc.SqlConnector;
import org.Model.Bean.TodoBean;
import org.Model.Bean.UserBean;

public class UserDao {

	
	public static int insert(UserBean user) {
		
		try {
			Connection conn = SqlConnector.Connect();
			
			PreparedStatement ps = conn.prepareStatement("insert into register (first_name, last_name, email, city, password) values (?,?,?,?,?)");
			
			ps.setString(1, user.getFname());
			ps.setString(2, user.getLname());
			ps.setString(3, user.getEmail());
			ps.setString(4,  user.getCity());
			ps.setString(5, user.getPass());
			
			
			
			int i = ps.executeUpdate();
			
			return i;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}
	
	
	public static int rowCount(UserBean user) {
		
		try {
			int count = 0;
			Connection conn = SqlConnector.Connect();
			
			PreparedStatement ps = conn.prepareStatement("select * from register where email=?");
			ps.setNString(1, user.getEmail());
			
			ResultSet rs = ps.executeQuery();
			
			
			while(rs.next()) {
				count++;
			}
			
			return count;
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		return 0;
	}
	
	
	
	
public static int rowCount(String email) {
		
		try {
			int count = 0;
			Connection conn = SqlConnector.Connect();
			
			PreparedStatement ps = conn.prepareStatement("select * from register where email=?");
			ps.setString(1, email);
			
			ResultSet rs = ps.executeQuery();
			
			
			while(rs.next()) {
				count++;
			}
			
			return count;
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		return 0;
	}


	public static int checkPass(String email, String pass) {
		try {
			int count = 0;
			Connection conn = SqlConnector.Connect();
			
			PreparedStatement ps = conn.prepareStatement("select * from register where email=? and password=?");
			ps.setString(1, email);
			ps.setString(2, pass);
			
			ResultSet rs = ps.executeQuery();
			
			
			while(rs.next()) {
				count++;
			}
			
			return count;
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		return 0;
	}
	

	public static UserBean fetchLogin(String email, String pass) {
		
		UserBean user = new UserBean();
		try {
			
			Connection conn = SqlConnector.Connect();
			
			PreparedStatement ps = conn.prepareStatement("select * from register where email=? and password=?");
			ps.setString(1, email);
			ps.setString(2, pass);
			
			ResultSet rs = ps.executeQuery();
			
			
			if(rs.next()) {
				user.setId(rs.getString("id"));
				user.setFname(rs.getString("first_name"));
				user.setLname(rs.getString("last_name"));
				user.setEmail(rs.getString("email"));
				user.setCity(rs.getString("city"));
				user.setPass(rs.getString("password"));
				user.setTimestamp(rs.getString("timestamp"));
			}
			
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return user;
	}
	
	
	
	public static int addTodo(String userId, TodoBean tb) {
		int i = 0;
		try {
			
			Connection conn = SqlConnector.Connect();
			

			PreparedStatement ps = conn.prepareStatement("INSERT INTO todolist (user_id,todo_topic,todo_desc,todo_date,todo_status) VALUES (?,?,?,?,?)");
			ps.setString(1, userId);
			ps.setString(2, tb.getTopic());
			ps.setString(3, tb.getDesc());
			ps.setString(4, tb.getDate());
			ps.setString(5, tb.getStatus());

			i = ps.executeUpdate();
			
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return i;
	}
	
	
	public static ResultSet fetchTodo(String id) {
		
		
		ResultSet rs = null;
		
		try {
			
			
			Connection conn = SqlConnector.Connect();
			
			PreparedStatement ps = conn.prepareStatement("Select * from todolist where user_id=? and todo_status='Pending' and todo_date >= CURDATE()");
			ps.setString(1, id);
			
			rs = ps.executeQuery();
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return rs;
	}
	
	public static int deleteTodo(String id) {
		int i = 0;
		try {
			
			Connection conn = SqlConnector.Connect();
			
			PreparedStatement ps = conn.prepareStatement("delete from todolist where id=?");
			ps.setString(1, id);

			i = ps.executeUpdate();
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return i;
	}
	

	public static TodoBean fetchTodoItem(String id) {
			
			TodoBean tb = new TodoBean();
			 
			try {
				Connection conn = SqlConnector.Connect();
				
				PreparedStatement ps = conn.prepareStatement("select * from todolist where id=?");
				ps.setString(1, id);
				
				ResultSet rs = ps.executeQuery();
				
				if(rs.next()) {
					
					tb.setTopic(rs.getString("todo_topic"));
					tb.setDesc(rs.getString("todo_desc"));
					tb.setDate(rs.getString("todo_date"));
					tb.setStatus(rs.getString("todo_status"));
					
				}
				return tb;
				
			} catch(Exception e) {
				e.printStackTrace();
			}
			
			return tb;
		}
	

	public static int updateTodo(TodoBean tb) {
		int i = 0;
		try {
			Connection conn = SqlConnector.Connect();
			
			PreparedStatement ps = conn.prepareStatement("update todolist set todo_topic=?, todo_desc=?, todo_date=?, todo_status=? where id=?");
			
			ps.setString(1, tb.getTopic());
			ps.setString(2, tb.getDesc());
			ps.setString(3, tb.getDate());
			ps.setString(4, tb.getStatus());
			ps.setString(5, tb.getId());
			
			
			i = ps.executeUpdate();
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return i;
	}
	

public static ResultSet fetchAllTodo(String id) {
		
		
		ResultSet rs = null;
		
		try {
			
			
			Connection conn = SqlConnector.Connect();
			
			PreparedStatement ps = conn.prepareStatement("Select * from todolist where user_id=?");
			ps.setString(1, id);
			
			rs = ps.executeQuery();
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return rs;
	}


	public static String reverseDate(String str) {
		String rev = "";
		
		String[] date = str.split("-");
		
		rev = date[2] + "-" + date[1] + "-" + date[0];
		
		return rev;
	}
	
	
	
	

}




