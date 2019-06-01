<%-- 
    Document   : doCreateProfile
    Created on : 23/05/2019, 7:05:22 PM
    Author     : neko
--%>

<%@page import="uts.wsd.*"%>
<%@page import="java.util.*"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login - Online Movie Store</title>
    </head>
    <body>

        <%
            UserDb userDao = (UserDb) session.getAttribute("userDao");
            String email = request.getParameter("email");
            String firstName = request.getParameter("firstname");
            String lastName = request.getParameter("lastname");
            String password = request.getParameter("password");
            String phone = request.getParameter("phone");
            boolean staff = false;
            
            boolean userCreated = userDao.createUser(email, firstName, lastName, password, phone, staff);
            
            if (userCreated) {
                session.setAttribute("successMessage", "Your User Account has been Created");
                response.sendRedirect("login.jsp");
            } else {
                session.setAttribute("errorMessage", "Invalid Details or Account Already Exists");
                response.sendRedirect("register.jsp");                               
            }         
        %>
        
    </body>
</html>