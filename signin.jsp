<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>UniVOLUNTEER - Signin Form</title>
        <link rel="stylesheet" href="signin.css">
    </head>
    <body>
        <div class="container">
        <h1> </h1>
        <form method="post" action="signinController.jsp">
            <div class="txt_field">
                <input type="text"  name="username" required>
                <span></span>
                <label>Username</label>
            </div>
            <div class="txt_field">
                <input type="password"  name="password" required>                
                <span></span>
                <label>Password</label>
            </div>
            <div class="options">
                <Label for="R1">Student</Label>
                <input required type="Radio" name="type" id="R1" Value="Student">
                <Label for="R2">Organiser</Label>
                <input required type="Radio" name="type" id="R2" Value="Organiser">
            </div>
            <div class="textfield">
            <input type="submit" value="Sign in">
            </div> 
            <div class="Login">
                Already a member? <a href="login.jsp">Login</a>
            </div>
        </form>
        </div>
    </body>
</html>