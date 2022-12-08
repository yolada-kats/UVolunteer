<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="univolunteer.*"%>

<%  String organization = request.getParameter("organization");
    String url = request.getParameter("url");
    String region = request.getParameter("region");
    ApplicationDAO appDAO = new ApplicationDAO();
    Application user = new Application(organization,url, null, region, null);
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