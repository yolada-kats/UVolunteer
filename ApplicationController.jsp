<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="univolunteer.*"%>
<%@ page import="java.sql.Date"%>
<html>
	<head>
        <meta charset="utf-8">
        
    
        <title>Application Form</title>
		<style>
			body {
    			position: absolute;
   				background-image: url("images/color.png");
    			background-repeat: no-repeat;
    			background-attachment: fixed;
    			background-position: center;
    			background-size: cover;
			}
			.page-header {
				color:rgb(74, 44, 12);
				text-align: center;

			}
.btn-light{
    color:rgb(74, 44, 12);
    background-color:rgb(74, 44, 12);;
    border-color: rgb(245, 241, 235);
    width: 250px;
    height: 45px;
    margin-top: 20px;
    margin-bottom: 10px;
    font-family: Georgia, 'Times New Roman', Times, serif;
    cursor: pointer;
    border-radius: 10px;
    margin-left: 450px;
    font-size: 130%;
    

}
.btn-light:hover{
    background-color: rgb(114, 66, 15);
    color: white;
}

	

		</style>
    
        <!-- Bootstrap core CSS -->
        <link rel="stylesheet" href="css/bootstrap.min.css">	
        <!-- Bootstrap Optional theme -->
    
       <!--<link href="application.css" rel="stylesheet">--> 
    
    
	</head>
	
	<body>
		
		<div class="container theme-showcase" role="main">

			
			
		<!-- /container -->
		<% request.setCharacterEncoding("UTF-8"); %>        
		<% 
		String url = request.getParameter("url");
		String organization = request.getParameter("organization");
		String date = request.getParameter("date");
		String region = request.getParameter("region");

		
		
		if((organization.length() >= 3)) {  
			try{
                
                Application apply = new Application(url, organization, date, region);
                ApplicationDAO aDao = new ApplicationDAO();
				aDao.registerApp(apply); %>
                
	    
		<div class="page-header">
			<h2>Registration almost done!</h2>
		</div>
			<div class="alert alert-success">
					If you want to see your form go back to:
			</div>
			<button class="btn-light" type="button" ><a href="SearchPage.jsp" style="text-decoration: none; color: rgba(235, 235, 235, 0.788);" >Check your Application</a></button>
			
			
			<%}catch(Exception e){
				request.setAttribute("message",e.getMessage());
				%>
			<%}%>
			
		   <% } else { %>
			<div class="page-header">
				<h2>Registration form has errors</h2>
			</div>
			<div class="alert alert-danger">
				<%int i=1;
				if(!(organization.length() >= 3)){ %>
					<p><%=i%>. Organization must be at least 3 characters long</p>
				<% i++;}  %>
				<% if(!(region.length() >= 3)){ %>
					<p><%=i%>. Region must be at least 3 characters long</p>
				<% i++;}  %>
				
			</div>
	
			
				<button class="btn-light" type="button"  ><a href="Application.jsp" style="align-items: center; color: rgba(235, 235, 235, 0.788);" >Back to the Form</a></button>
			

		<% } %>

        

		</div>
		<!-- footer -->
		
		<!-- End footer -->
		
		<!-- =================== Place all javascript at the end of the document so the pages load faster =================== -->
		<!-- jQuery library -->
		<script src="js/jquery.min.js"></script>
		<!-- Bootstrap core JavaScript -->
		<script	src="js/bootstrap.min.js"></script>
	</body>
</html>