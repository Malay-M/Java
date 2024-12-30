<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="org.Model.Bean.*" %>
    
<%
    
    UserBean user = (UserBean) session.getAttribute("user");
    if (user != null) {
        RequestDispatcher rd = request.getRequestDispatcher("todolist.jsp");
        rd.forward(request, response);
        return;
    }
%> 
    
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign Up</title>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <style>

        #login-btn {
            display: flex;
        }

        #login-btn a {
            text-decoration: none;
            color: inherit;
        }

        .container {
            display: flex;
            justify-content: center;
            align-items: center;
            margin-top: 2%;

        }

        .login-form {
            width: 60%;
            background-color: white;
            padding: 1.5rem;
            border-radius: 5%;
        }

        .login-form h2 {
            font-weight: bold;
        }
    </style>
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
                    <a class="nav-link" href="login.jsp">Login</a>
                </li>
                 <li class="nav-item">
                    <a class="nav-link" href="signup.jsp">Register</a>
                </li>
            </ul>

            




            <form class="form-inline my-2 my-lg-0">
                <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
                <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
            </form>
        </div>
    </nav>

    <div class="container">

        <div class="signup-form  border rounded p-4">
            <form method="POST" action="SignUp">

                <div class="form-group">
                    <h2>Sign Up</h2>


                    <div class="row" style="padding-bottom: 2%;">
                        <div class="col">
                            <label for="firstName">First name</label>
                            <input type="text" name="fname" class="form-control" placeholder="First name" required>
                        </div>
                        <div class="col">
                            <label for="lastName">Last name</label>
                            <input type="text" name="lname" class="form-control" placeholder="Last name" required>
                        </div>
                    </div>

                    
                   

                    

                    <div style="padding-bottom:2%">
                        <label for="exampleInputEmail1">Email address</label>
                        <input type="email" name="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email" required>
                        <!-- <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small> -->
                    </div>



                    <div class="form-group">
                        
                        <label for="inputCity">City</label>
                        <input type="text" name="city" class="form-control" id="inputCity" placeholder="Enter city" required>
                    </div>

                   
                    

                    <div class="row" style="padding-bottom: 2%;">
                        <div class="col">
                            <label for="exampleInputPassword1">Password</label>
                            <input type="password" name="password" class="form-control" id="pass1" placeholder="Password" onkeyup="checkPasswords();" required>
                        </div>
                        <div class="col">
                            <label for="exampleInputPassword1">Confirm password</label>
                            <input type="password" class="form-control" id="pass2" placeholder="Confirm password" onkeyup="checkPasswords();" required>
                        </div>
                    </div>
                    <%
					    Boolean status = (Boolean) request.getAttribute("status"); 
					    if (status != null) { 
					        if (!status) {
					            out.print("<div class='alert alert-danger' role='alert'>Email already registered</div>");
					        } else {
					            out.print("<div class='alert alert-success' role='alert'>Registered Successfully</div>");
					        }
					    } 
					%>
                    
                   
                    
                    
                    


                    <div id="notMatch" class="alert alert-danger" role="alert">
                        Password must be same
                    </div>


                    <div class="form-check">
                        <input type="checkbox" class="form-check-input" id="check">
                        <label class="form-check-label" for="exampleCheck1">Check me out</label>
                    </div>




                    <p>Already have an account?<a href="login.jsp"> Login</a></p>
                    <input type="submit" name="submit" value="Sign Up" class="btn btn-primary">
            </form>
        </div>

    </div>



</body>

<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<script>
    let checkButton = document.querySelector("#check");
    let pass1 = document.querySelector("#pass1");
    let pass2 = document.querySelector("#pass2");

    let submit = document.getElementById("submit");

    checkButton.addEventListener("change", () => {
        if (pass1.type == "text") {
            pass1.type = "password";
            pass2.type = "password";
        } else {
            pass1.type = "text";
            pass2.type = "text";
        }
    });

    let match = document.querySelector("#notMatch");
    match.hidden = true;

    let checkPasswords = () => {
        if (pass1.value == pass2.value) {
            match.hidden = true;
            submit.disabled = false;
        } else {
            match.hidden = false;
            submit.disabled = true;
        }
    };
</script>


</html>