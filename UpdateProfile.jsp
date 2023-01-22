<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
	<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="icon" href="images/favicon.ico">

	<title>Update Profile</title>

	<!-- Bootstrap core CSS -->
	<link rel="stylesheet" href="css/bootstrap.min.css">	
	<!-- Bootstrap Optional theme -->
	<link rel="stylesheet" href="css/bootstrap-theme.min.css">
    <link rel="stylesheet" href="updateprofile.css">

</head>
<body>
    <div class="container">
      <div class="row justify-content-center">
        <div class="col-6 col-md-9">
        
        <form method="POST" action="StudentProfile.jsp">
          <h2 class="text-color"> Update Profile </h2>
          <br>
            <div class="form-group">
                <label for="name">Name:</label>
                <input type="name" class="form-control" id="name" placeholder="Enter your name" name="name">
              </div>
              <div class="form-group">
                <label for="Surname">Surname:</label>
                <input type="surname" class="form-control" id="surname" placeholder="Enter your surname" name="surname">
              </div>
              <div class="form-group">
                <label for="city">Country:</label>
                <input type="city" class="form-control" id="city" placeholder="Enter your city" name="country">
              </div>

              <div class="form-group">
                <label for="city">City:</label>
                <input type="city" class="form-control" id="city" placeholder="Enter your city" name="city">
              </div>

              <div class="form-group">
                <label for="email">Email:</label>
                <input type="email" class="form-control" id="email" placeholder="Enter your email" name="email">
              </div>

              <div class="form-group">
                <label for="comments">Little Bio: </label>
                <textarea type="comments" class="form-control" id="comments" placeholder="Enter little Bio" name="comments">
                </textarea>
              </div>
              

            
            </div>
            
            
            </div>
            <div class="buttons">
              <div class="form-group">
                <button type="submit" class="btn_update"> Update </button>
                <button type="submit" class="btn_cancel" name="cancel"> Cancel </button>
              </div>
            </div>
          </form>
            
            
        </div>

</body>
</html>