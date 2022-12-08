<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="univolunteer.*"%>
<%@ page import="java.sql.Date"%>
<html>
	<head>
        <meta charset="utf-8">
        
    
        <title>Application Form</title>
    
        <!-- Bootstrap core CSS -->
        <link rel="stylesheet" href="css/bootstrap.min.css">	
        <!-- Bootstrap Optional theme -->
    
        <link href="application_controller.css" rel="stylesheet">
    
    
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

		
		
		if((organization.length() >= 3)   ) {  
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
			<button class="btn btn-primary" type="button" ><a href="SearchPage.jsp" style="text-decoration: none; color: white;"> < Application Form</a></button>
			
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
	
			<button class="btn btn-primary" type="button" ><a href="Application.jsp" style="text-decoration: none; color: white;"> < Back to the form</a></button>

		<% } %>
        <%if(request.getAttribute("message") != null) { %>		
            <div class="alert alert-danger" role="alert"><%=(String)request.getAttribute("message") %></div>
            <button class="btn btn-primary" type="button" ><a href="Application.jsp" style="text-decoration: none; color: white;"> < Back to the form</a></button>
         <%} %>

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