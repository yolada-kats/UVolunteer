<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="univolunteer.*"%>

<%  String username = request.getParameter("username");
    String password = request.getParameter("password");
    UserDAO uDAO = new UserDAO();

    try{
        User user = uDAO.authenticate(username, password);
        session.setAttribute("userObj",user);%>
        <jsp:forward page="index.jsp"/>
    <%}catch(Exception e){
        request.setAttribute("message", e.getMessage());
        %>
        <jsp:forward page="login.jsp"/>
    <%}
%>