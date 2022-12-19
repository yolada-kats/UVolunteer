<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="univolunteer.*"%>
<%@ page import="java.util.*" %>

<% String keyword = request.getParameter("keyword");%>
<% User user = (User)session.getAttribute("userObj");%>



<!DOCTYPE html>
<html>
   
    <head>
         <meta charset="UTF-8">
         <meta name="viewport" content="width=device-width, initial-scale=1.0">
         <link rel="stylesheet" href="org_profile.css">
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
                <li><a href ="SearchPage.html" style="text-decoration: none"><button type="button" class="button"></ion-icon><span class="button_icon"><ion-icon name="search-outline"></span><span class="button_text">Search</span></button></a></li>
                <li><a href ="favouriteController.jsp" style="text-decoration: none"><button type="button" class="button"></ion-icon><span class="button_icon"><ion-icon name="star-outline"></span><span class="button_text">Favourites</span></button></a></li>        
            <%}else{%>
                <li><a href ="index.jsp" style="text-decoration: none"><button type="button" class="button"></ion-icon><span class="button_icon"><ion-icon name="home-outline"></span><span class="button_text">Home</span></button></a></li>
                <li><a href ="org_profile.jsp" style="text-decoration: none"><button type="button" class="button"></ion-icon><span class="button_icon"><ion-icon name="person-outline"></ion-icon></span><span class="button_text">Profile</span></button></li>
                <li><a href ="SearchPage.html" style="text-decoration: none"><button type="button" class="button"></ion-icon><span class="button_icon"><ion-icon name="search-outline"></span><span class="button_text">Search</span></button></a></li>
                <li><a href ="favouriteController.jsp" style="text-decoration: none"><button type="button" class="button"></ion-icon><span class="button_icon"><ion-icon name="star-outline"></span><span class="button_text">Favourites</span></button></a></li>
                <li><a href ="Application.jsp" style="text-decoration: none"><button type="button" class="button"></ion-icon><span class="button_icon"><ion-icon name="cloud-upload-outline"></span><span class="button_text">Upload</span></button></a></li>
            <%}%>
        </ul>

        <form action="org_profile_results.jsp" method="POST">
            <div class="container">
                <div class="search-bar">
                    <input type="text" name="keyword" placeholder="Search for students based on country or city...">
                    <button type="submit"><img src="images/search.png"></button>
                </div>
                
                <%if (keyword == null || keyword.length() < 1){%>
                    <div class="message" style="color:whitesmoke; text-align: center; font-size: 140%; background: rgb(99, 55, 5); border-radius: 10px; padding: 10px;">
                        Please enter a country or a city!
                    </div>
                <%} else {%>
                    <%try {
                        ProfileDAO PDAO = new ProfileDAO();
                        List<Profile> profiles = new ArrayList<Profile>();
                        profiles = PDAO.findProfiles(keyword);
                    %>
                        <div class = "message" style="color:whitesmoke; text-align: center; font-size: 140%; background: rgb(99, 55, 5); border-radius: 10px; padding: 10px;">~ Total profiles from <b><%= keyword%></b>: <%= profiles.size()%> ~</div>
                        <ul class="profiles">
                            <%for(int i = 0; i < profiles.size(); i++) {%>
                                <il>
                                    <div>
                                        <img src="images/member1.png">
                                        <div class="personal_info">
                                            <a href ="profile.jsp?username=<%= (profiles.get(i)).getUsername()%>" style="text-decoration: none;"><div class="name"><%= ((profiles.get(i)).getName()) + " " + ((profiles.get(i)).getSurname())%></div></a>
                                            <text class="city"><ion-icon name="location-outline"></ion-icon><%= ((profiles.get(i)).getCity())%></text>
                                        </div>
                                    </div>
                                </il>
                            <%}%>
                        </ul>  
                    <%                            
                    } catch (Exception e) {
                        
                    }
                }%>      
            </div>
        </form>
        
       
        <ul class="social" >    
            <li><a href="#"><img src="images/facebook .png"></a></li>
            <li><a href="#"><img src="images/instagram.png"></a></li>
            <li><a href="#"><img src="images/twitter.png"></a></li>
        </ul>
        
        <div type="div" class="bar">
            <h1>U<span class="color">ni</span>Volunteer </h1>
        </div>


    </body>
</html>