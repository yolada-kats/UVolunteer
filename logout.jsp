<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page errorPage="error_ex3_8200025.jsp"%>

<%
session.invalidate();
%>
<jsp:forward page="signin.jsp"/>
