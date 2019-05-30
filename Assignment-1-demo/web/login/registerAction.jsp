<%-- 
    Document   : registerAction
    Created on : 30/05/2019, 7:20:35 PM
    Author     : LTChr
--%>

<%@page import="uts.wsd.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registering User...</title>
    </head>
    <body>
        <%
            UserDao userDao = (UserDao) session.getAttribute("userDao");
            String userId = request.getParameter("username");
            String password = request.getParameter("password");
            String email = request.getParameter("email");
            String firstName = request.getParameter("firstname");
            String lastName = request.getParameter("lastname");
            boolean staff = false;
            
            boolean userCreated = userDao.createUser(userId, firstName, lastName, email, password, staff);
            
            if (userCreated) {
                session.setAttribute("successMessage", "Your User Account has been Created");
                response.sendRedirect("login.jsp");
            } else {
                session.setAttribute("errorMessage", "Invalid Details or Account Already Exists");
                response.sendRedirect("createProfile.jsp");                               
            }         
        %>
    </body>
</html>
