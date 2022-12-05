<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="univolunteer.*"%>

<%  String username = request.getParameter("username");
    String password = request.getParameter("password");
    String type = request.getParameter("type");
    UserDAO uDAO = new UserDAO();
    User user = new User(username,password,type);
    try{
        uDAO.register(user);
        session.setAttribute("userObj",user);%>
            <jsp:forward page="index.jsp"/>
    <%}catch(Exception e){
        request.setAttribute("message", e.getMessage());
        %>
        <jsp:forward page="signin.jsp"/>
    <%}
%>