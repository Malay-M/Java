package org.Misc;

import java.sql.Connection;
import java.sql.DriverManager;

import com.mysql.cj.jdbc.Driver;

public class SqlConnector {

	
	public static Connection Connect() throws Exception{
		
		
		Class.forName("com.mysql.cj.jdbc.Driver");
		
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/todo","root","password");
		
		
		return conn;
	}
	
		
}
