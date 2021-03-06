<%-- 
    Document   : registerAction
    Created on : 30/05/2019, 7:20:35 PM
    Author     : LTChr
--%>

<%@page import="uts.wsd.*"%>
<%@page import="uts.wsd.UserDb.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registering User...</title>
    </head>
    <body>
        <%
            UserDb userDb = (UserDb) session.getAttribute("userDb");
            String email = request.getParameter("email");
            String firstName = request.getParameter("firstName");
            String lastName = request.getParameter("lastName");
            String password = request.getParameter("password");
            String phone = request.getParameter("phone");
            boolean staff = false;
            
            boolean userCreated = userDb.createUser(email, firstName, lastName, password, phone, staff);
            
            if (userCreated) {
                session.setAttribute("successMessage", "Your User Account has been Created");
                response.sendRedirect("login.jsp");
            } else {
                session.setAttribute("errorMessage", "Invalid Details");
                response.sendRedirect("register.jsp");                               
            } 
        %>
    </body>
</html>
