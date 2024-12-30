<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
    <%@ page import="org.Model.Bean.UserBean" %>
    <%@ page import="org.Model.Dao.UserDao" %>
    <%@ page import="java.sql.ResultSet" %>
    

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Todo List</title>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    
</head>

<body>
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <a class="navbar-brand" href="#">Todo List</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item active">
                    <a class="nav-link" href="index.html">Home <span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="logout">Logout</a>
                </li>
                 
            </ul>

          




            <form class="form-inline my-2 my-lg-0">
                <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
                <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
            </form>
        </div>
    </nav>

    <div class="container" style="display: flex; justify-content: center; align-items: center;margin-top: 2%;">

	<div class="col">
	
        <div class="row justify-content-center login-form border rounded bg-info text-white" style="width:100%">
            <h1>Todo List</h1>
        </div>
        
       
      
	 <div class="row justify-content-left">
    <div class="d-flex m-2">
        <form action="addtodo.jsp" class="me-2">
            <button class="btn btn-success my-2 my-sm-0 m-2 border border-dark" type="submit">Add Todo</button>
        </form>
        <form action="alltodo.jsp">
            <button class="btn btn-warning my-2 my-sm-0 m-2 text-white border border-dark" type="submit">History</button>
        </form>
    </div>
</div>
	       
	       
	  <div class="row">
	  
			  	<table class="table">
		  <thead class="thead-dark">
		    <tr style="text-align: center;">
		      <th scope="col">No</th>
		      <th scope="col">Topic</th>
		      <th scope="col">Description</th>
		      <th scope="col">Date</th>
		      <th scope="col">Status</th>
		      <th scope="col">Action</th>
		    </tr>
		  </thead>
		  <tbody>
		    
		  
		  <% 
		  	int count = 1;
		  	UserBean ub = (UserBean)session.getAttribute("user");
		  	
		  	ResultSet rs = UserDao.fetchTodo(ub.getId());
		  	
		  	
		  	while(rs.next()) {
		  		String todoId = rs.getString("id");
		  		out.println("<tr style='text-align: center;'>");
		  		out.println("<th scope='row'>"+ (count++) +"</th>");
		  		out.println("<td>"+ rs.getString("todo_topic") +"</td>");
		  		out.println("<td>"+ rs.getString("todo_desc") +"</td>");
		  		out.println("<td>"+ UserDao.reverseDate(rs.getString("todo_date")) +"</td>");
		  		out.println("<td>"+ rs.getString("todo_status") +"</td>");
		  		out.println("<td>");
		  		out.print("<button type='button' class='btn btn-success mr-2'><a style='text-decoration:none; color:white;' href='updatetodo.jsp?id=" +todoId+ "'> Edit </a></button>");
		  		out.print("<button type='button' class='btn btn-danger'><a style='text-decoration:none; color:white;' href='deleteTodo?id=" +todoId+ "'> Delete </a></button>");
		  		out.println("</td>");
		  		out.println("</tr>");
		  	}
		  
		  %>
		
		      
		      
		      
		      
		      
		      
		    
		  </tbody>
		</table>
		
	
	  
	  </div>
	        
	        
	        
	        
	    </div>
	    
	    
</div>




</body>

<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>



</html>