<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="univolunteer.*,java.util.List,java.util.ArrayList"%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0"> 
        <link rel="stylesheet" href="favorites.css">
    </head>
    <body>

        <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
        <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
        <%String keyword  = request.getParameter("searchinput");
        ApplicationDAO search = new ApplicationDAO();
        List <Application> applications = search.findApplications(keyword);
        %>
        <ul class="menu">
            <li><a href ="indexOrganiser.html" style="text-decoration: none"><button type="button" class="button"></ion-icon><span class="button_icon"><ion-icon name="home-outline"></span><span class="button_text">Home</span></button></a></li>
            <li><a href ="UpdateProfile.html" style="text-decoration: none"><button type="button" class="button"></ion-icon><span class="button_icon"><ion-icon name="person-outline"></ion-icon></span><span class="button_text">Profile</span></button></a></li>
            <li><a href ="SearchPage.html" style="text-decoration: none"><button type="button" class="button"></ion-icon><span class="button_icon"><ion-icon name="search-outline"></span><span class="button_text">Search</span></button></a></li>
            <li><a href ="Favorites.html" style="text-decoration: none"><button type="button" class="button"></ion-icon><span class="button_icon"><ion-icon name="star-outline"></span><span class="button_text">Favourites</span></button></a></li>
            <li><a href ="Application.html" style="text-decoration: none"><button type="button" class="button"></ion-icon><span class="button_icon"><ion-icon name="cloud-upload-outline"></span><span class="button_text">Upload</span></button></a></li>
        </ul>
        <div class="container">
        <div class="search-bar">
            <input type="text" name="q" placeholder="Search for programs...">
            <button type="submit"><img src="images/search.png"></button>
        </div>
        <div class="big-flex-box">
            <%
            int sumapp = 0;
            for(Application app: applications){ 
            sumapp +=  1;}
            int totalapp = 0;
            for(Application app: applications){ 
            totalapp +=  1;
            if((totalapp%2)==1){
            %>
            <div class="flex-container">
            <%}%>
                <div class="flex-box">
                    <div class="title-and-icon">
                        <img class="inside-box-icon" src="images/TEDx.jpg" alt="Company Image">
                        <b><%= app.getOrganization()%></b>
                    </div>
                    <div class="info-icons">
                        <button class="info" type="button" disabled> <ion-icon name="compass-outline"></ion-icon> <%=app.getRegion() %></button>
                        <button class="info" type="button" disabled> <ion-icon name="calendar-outline"></ion-icon>  <%=app.getDate()%></button>
                    </div>
                    <div class="info-buttons">
                        <button class="application" type="submit"><a href=<%= app.getUrl()%> style="text-decoration: none; color: white;">Click here to visit</a></button>
                        <button class="favorite" type="submit"> <ion-icon name="heart"></ion-icon>Favourites</button>
                    </div>
                </div>
            <%if((totalapp%2)!=1 || sumapp==totalapp){%>
            </div>                  
            <%}%>    
            <%}%> 
        </div>
        </div>
    <div type="div" class="bar">
        <h1>U<span class="color">ni</span>Volunteer </h1>
        <div class="buttons">
                <a href ="logout.jsp" style="text-decoration: none">
                    <button class="b1">
                        Log out
                    </button>
                </a>
         </div>
    </div>

        <ul class="social" >    
            <li><a href="#"><img src="images/facebook .png"></a></li>
            <li><a href="#"><img src="images/instagram.png"></a></li>
            <li><a href="#"><img src="images/twitter.png"></a></li>
        </ul>
        
    </body>
</html>