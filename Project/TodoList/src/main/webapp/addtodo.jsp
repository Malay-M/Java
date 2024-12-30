<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add todo</title>

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
            <h1>Add Todo</h1>
        </div>
        
       
      
	  <div class="row justify-content-center ">
	        	<form class="border rounded p-3 m-3" method="POST" style="width:60%" action="addTodo">
	        	
	        	
	        	
	        	<div class="form-group">
                    <h2>Add Todo</h2>


                    <div style="padding-bottom:2%">
                        <label for="topic">Topic:</label>
                        <input type="text" name="topic" class="form-control" id="topic" aria-describedby="emailHelp" placeholder="Enter topic" required>
                    </div>



                    <div class="form-group">
                        
                        <label for="desc">Description:</label>
                        <input type="text" name="desc" class="form-control" id="desc" placeholder="Enter description" required>
                    </div>

                   
                    

                    <div class="form-group">
                        
                        <label for="inputDate">Date:</label>
                        <input type="date" name="date" class="form-control" id="inputDate" placeholder="Enter city" required>
                    </div>



				
					<div class="form-group" style="display:none;">
					
						<label for="inputStatus">Status:</label>
                        
                        <select class="form-select form-select-lg mb-3 p-2" name="status" aria-label=".form-select-lg example">
							  
							  <option value="Pending" selected>Pending</option>
							  <option value="Complete">Complete</option>
						
							</select>
                    </div>
                    
	        	
	        	<div>
	        			<button class="btn btn-primary my-2 my-sm-0" type="submit">Add Todo</button>


				</div>
	        	</form>
	       
	       <div class="mt-3">
	       
	       <form action="todolist.jsp">
	       <button class="btn my-2 my-sm-0 btn-info" type="submit">Todo List</button>
	       
	       </form>
	       		
	       </div>
	       	
	        	
	        </div>
	       
	       
	  <div class="row">
	  
	  
	  </div>
	        
	        
	        
	        
	    </div>
	    
	    
</div>





</body>

<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>



</html>