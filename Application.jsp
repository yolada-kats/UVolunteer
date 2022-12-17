<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
	<head>
	<meta charset="utf-8">
	

	<title>Application Form</title>

	<!-- Bootstrap core CSS -->
	<link rel="stylesheet" href="css/bootstrap.min.css">	
	<!-- Bootstrap Optional theme -->

    <link rel="stylesheet" href="application.css">

</head>
<body>
  <% if(session.getAttribute("userObj") == null){%>
    <jsp:forward page="signin.jsp"/>
  <%
    return;
  }    
  %>
    <div class="container">
    
      <div class="row justify-content-center">
        <div class="col-6 col-md-9">
        
        <form method="POST" action="ApplicationController.jsp">
          <h2 class="text-color">Application Form</h2>
          <br>
            <div class="form-group">
                <label for="organization">Organization:</label>
                <input type="organization" class="form-control" id="organization" placeholder="Enter your organization name" name="organization">
              </div>
              <div class="form-group">
                <label for="region">Region:</label>
                <input type="region" class="form-control" id="region" placeholder="Enter your city's name" name="region">
              </div>
              <div class="form-group">
                <label for="url">URL:</label>
                <input type="url" class="form-control" id="url" placeholder="Enter your url" name="url">
              </div>

            <div class="form-group">
                <label for="date">Date:</label>
                <input type="date" class="form-control" placeholder="date *" name="date" onfocus="(this.type = 'date')">
              </div>

            
            </div>
            <div class="form-group">
              <a href="SearchPage.html" style="text-decoration: none; color: white;" ><button type="submit" class="btn btn-light">Update</button></a>
            </div>
            </div>
        

          </form>
            
            
        </div>

</body>
</html>