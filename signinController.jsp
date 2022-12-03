<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="univolunteer.*"%>

<%  String username = request.getParameter("username");
    String password = request.getParameter("password");
    String type = request.getParameter("type");
    UserDAO uDAO = new UserDAO();
    User user = new User(username,password,type);
    try{
        uDAO.register(user);
        session.setAttribute("userObj",user);
        if(type.equals("Student")){%>
            <jsp:forward page="index.jsp"/>
        <%}else{%>
            <jsp:forward page="index.jsp"/>
        <%}%>
    <%}catch(Exception e){
        request.setAttribute("message","Wrong username or password");
        %>
        <jsp:forward page="Signin.jsp"/>
    <%}
%>