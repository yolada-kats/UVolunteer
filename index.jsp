<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="univolunteer.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="index.css">
    </head>
    <body>
        <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
        <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
        <ul class="menu">
            <% if(session.getAttribute("userObj") == null){%>
                <li><button type="button" class="button"></ion-icon><span class="button_icon"><ion-icon name="home-outline"></span><span class="button_text">Home</span></button></li>
                <li><a href ="StudentProfile.jsp" style="text-decoration: none"><button type="button" class="button"></ion-icon><span class="button_icon"><ion-icon name="person-outline"></ion-icon></span><span class="button_text">Profile</span></button></li>
                <li><a href ="SearchPage.jsp" style="text-decoration: none"><button type="button" class="button"></ion-icon><span class="button_icon"><ion-icon name="search-outline"></span><span class="button_text">Search</span></button></a></li>
                <li><a href ="favouriteController.jsp" style="text-decoration: none"><button type="button" class="button"></ion-icon><span class="button_icon"><ion-icon name="star-outline"></span><span class="button_text">Favourites</span></button></a></li>
            <%}else{
                User user = (User)session.getAttribute("userObj");
                if(user.getType().equals("Student")){%>
                    <li><button type="button" class="button"></ion-icon><span class="button_icon"><ion-icon name="home-outline"></span><span class="button_text">Home</span></button></li>
                    <li><a href ="StudentProfile.jsp" style="text-decoration: none"><button type="button" class="button"></ion-icon><span class="button_icon"><ion-icon name="person-outline"></ion-icon></span><span class="button_text">Profile</span></button></li>
                    <li><a href ="SearchPage.jsp" style="text-decoration: none"><button type="button" class="button"></ion-icon><span class="button_icon"><ion-icon name="search-outline"></span><span class="button_text">Search</span></button></a></li>
                    <li><a href ="favouriteController.jsp" style="text-decoration: none"><button type="button" class="button"></ion-icon><span class="button_icon"><ion-icon name="star-outline"></span><span class="button_text">Favourites</span></button></a></li>        
                <%}else{%>
                    <li><button type="button" class="button"></ion-icon><span class="button_icon"><ion-icon name="home-outline"></span><span class="button_text">Home</span></button></li>
                    <li><a href ="org_profile.jsp" style="text-decoration: none"><button type="button" class="button"></ion-icon><span class="button_icon"><ion-icon name="person-outline"></ion-icon></span><span class="button_text">Profile</span></button></li>
                    <li><a href ="SearchPage.jsp" style="text-decoration: none"><button type="button" class="button"></ion-icon><span class="button_icon"><ion-icon name="search-outline"></span><span class="button_text">Search</span></button></a></li>
                    <li><a href ="favouriteController.jsp" style="text-decoration: none"><button type="button" class="button"></ion-icon><span class="button_icon"><ion-icon name="star-outline"></span><span class="button_text">Favourites</span></button></a></li>
                    <li><a href ="Application.jsp" style="text-decoration: none"><button type="button" class="button"></ion-icon><span class="button_icon"><ion-icon name="cloud-upload-outline"></span><span class="button_text">Upload</span></button></a></li>
                <%}
            }%>
        </ul>
        <div type="div" class="bar">
            <h1>U<span class="color">ni</span>Volunteer </h1>
            <div class="buttons">
                <% if(session.getAttribute("userObj") == null){%>
                    <a href ="login.jsp" style="text-decoration: none">
                    <button class="b1">
                        Log in
                    </button>
                    </a>
                    <a href ="signin.jsp" style="text-decoration: none">
                    <button class="b2">
                        Sing in
                    </button> 
                    </a>
                 <%}else{%>
                    <a href ="logout.jsp" style="text-decoration: none">
                        <button class="b1">
                            Log out
                        </button>
                    </a>
                <%}%>
             </div>
        </div>

        <ul class="social" >    
            <li><a href="#"><img src="images/facebook .png"></a></li>
            <li><a href="#"><img src="images/instagram.png"></a></li>
            <li><a href="#"><img src="images/twitter.png"></a></li>
        </ul>
    </body>
</html>