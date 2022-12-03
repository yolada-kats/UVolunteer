<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="univolunteer.*,java.util.List,java.util.ArrayList"%>

<% if(session.getAttribute("userObj") == null){%>
    <jsp:forward page="signin.jsp"/>
<%}else{
    User user = (User)session.getAttribute("userObj");
    Favourite fav = new Favourite();
    List <Favourite> favourites = fav.listFavourites(user);
    boolean ans = favourites.isEmpty();
        if(ans){%>
            <jsp:forward page="emptyFavourites.jsp"/>
        <%}else{%>
            <jsp:forward page="favourite.jsp"/>
        <%}
}%>