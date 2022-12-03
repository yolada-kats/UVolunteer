<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCUMENT html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>UniVOLUNTEER - Login Form</title>
        <link rel="stylesheet" href="signin.css">
    </head>
    <body>   
       
        <div class="container"> 
        <% if(request.getAttribute("message") != null) { %>		
            <div class="alert" style="margin-bottom: 10%; margin-top: 10%; text-align: center; color: #ea2222;;"><%=(String)request.getAttribute("message") %></div>
        <% } %>
        <form method="post" action="loginController.jsp">
            <div class="txt_field">
                <input type="text" name="username" required>
                <span></span>
                <label >Username</label>
            </div>
            <div class="txt_field">
                <input type="password" name="password" required>                
                <span></span>
                <label>Password</label>
            </div>
            <div class="textfield">
            <input type="submit" value="Login">
            </div> 
        </form>
        </a>
        </div>
    </body>
</html>