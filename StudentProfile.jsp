<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="univolunteer.*"%>
<%@ page import="java.lang.Math.*"%>

<% User user = (User)session.getAttribute("userObj");%>
<% String name = request.getParameter("name");%>
<% String surname = request.getParameter("surname");%>
<% String country = request.getParameter("country");%>
<% String city = request.getParameter("city");%>
<% String email = request.getParameter("email");%>
<% String comments = request.getParameter("comments");%>



<!DOCTYPE html>
<html>  
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="studentprofile.css">
        <style>
            .social {
                position: fixed;
                top: 350px;
                right: 10px;
                transform: translateY(-50%);
                display: flex;
                justify-content: center;
                align-items: center;
                flex-direction: column;
            }

            .social li {
                list-style: none;
            }

            .social li a {
                display: inline-block;
                margin: 5px 0;
                transform: scale(0.6);
                filter: invert(1);
            }
        </style>
    </head>
    <body>
        
        <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
        <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
        
        <% if(user == null){%>
			<jsp:forward page="signin.jsp"/>
		<%}%>
        <ul class="menu">
            <%if(user.getType().equals("Student")){%>
                <li><a href ="index.jsp" style="text-decoration: none"><button type="button" class="button"></ion-icon><span class="button_icon"><ion-icon name="home-outline"></span><span class="button_text">Home</span></button></a></li>
                <li><a href ="UpdateProfile.jsp" style="text-decoration: none"><button type="button" class="button"></ion-icon><span class="button_icon"><ion-icon name="person-outline"></ion-icon></span><span class="button_text">Profile</span></button></li>
                <li><a href ="SearchPage.jsp" style="text-decoration: none"><button type="button" class="button"></ion-icon><span class="button_icon"><ion-icon name="search-outline"></span><span class="button_text">Search</span></button></a></li>
                <li><a href ="favouriteController.jsp" style="text-decoration: none"><button type="button" class="button"></ion-icon><span class="button_icon"><ion-icon name="star-outline"></span><span class="button_text">Favourites</span></button></a></li>        
            <%}else{%>
                <li><a href ="index.jsp" style="text-decoration: none"><button type="button" class="button"></ion-icon><span class="button_icon"><ion-icon name="home-outline"></span><span class="button_text">Home</span></button></a></li>
                <li><a href ="org_profile.jsp" style="text-decoration: none"><button type="button" class="button"></ion-icon><span class="button_icon"><ion-icon name="person-outline"></ion-icon></span><span class="button_text">Profile</span></button></li>
                <li><a href ="SearchPage.jsp" style="text-decoration: none"><button type="button" class="button"></ion-icon><span class="button_icon"><ion-icon name="search-outline"></span><span class="button_text">Search</span></button></a></li>
                <li><a href ="favouriteController.jsp" style="text-decoration: none"><button type="button" class="button"></ion-icon><span class="button_icon"><ion-icon name="star-outline"></span><span class="button_text">Favourites</span></button></a></li>
                <li><a href ="Application.jsp" style="text-decoration: none"><button type="button" class="button"></ion-icon><span class="button_icon"><ion-icon name="cloud-upload-outline"></span><span class="button_text">Upload</span></button></a></li>

            <%}%>
        </ul>

        <% try {

            ProfileDAO PDAO = new ProfileDAO();
            PDAO.updateInfo(user.getUsername(), name, surname, country, city, email, comments);
            Profile profile = PDAO.findProfile(user.getUsername());
            
        %>
            <div class="personal_info">
                <div class="text_info"> 
                    <img src="images/member1.png">
                    <div class="text">
                        <% if(profile.getName() == null || (profile.getName()).length() < 1){%>
                            <text> Name: </text>
                        <%} else {%>
                            <text> Name: <%= profile.getName()%> </text>
                        <%}%>
                        <% if(profile.getSurname() == null || (profile.getSurname()).length() < 1){%>
                            <text> Surname: </text>
                        <%} else {%>
                            <text> Surname: <%= profile.getSurname()%> </text>
                        <%}%>
                        <% if(profile.getCountry() == null || (profile.getCountry()).length() < 1){%>
                            <text> Country: </text>
                        <%} else {%>
                            <text> Country: <%= profile.getCountry()%> </text>
                        <%}%>
                        <% if(profile.getCity() == null || (profile.getCity()).length() < 1){%>
                            <text> City: </text>
                        <%} else {%>
                            <text> City: <%= profile.getCity()%> </text>
                        <%}%>
                        <% if(profile.getEmail() == null || (profile.getEmail()).length() < 1){%>
                            <text> Email: </text>
                        <%} else {%>
                            <text> Email: <%= profile.getEmail()%> </text>
                        <%}%>
                    </div>
                </div>
                <% if(profile.getComments() == null || (profile.getComments()).length() < 1){%>
                    <text> Comments: </text>
                <%} else {%>
                    <text class="comments">
                        Comments: <p><%= profile.getComments()%></p>
                    </text>
                <%}%>
                
                <a href="UpdateProfile.jsp" style="text-decoration: none; color: white;" ><button class="update"> Update Profile </button> </a>
            </div>
        <% } catch (Exception e) {
            request.setAttribute("message", e.getMessage());%>
            <div class="personal_info">
                <div class="text_info">
                    <%= (String)request.getAttribute("message")%>
                </div>
            
            </div>
        <%}%>

        <div type="div" class="bar">
            <h1>U<span class="color">ni</span>Volunteer </h1>
        </div>

        <ul class="social" >    
            <li><a href="#"><img src="images/facebook .png"></a></li>
            <li><a href="#"><img src="images/instagram.png"></a></li>
            <li><a href="#"><img src="images/twitter.png"></a></li>
        </ul>
    </body>
</html>