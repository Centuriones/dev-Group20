<%-- 
    Document   : logout
    Created on : 2019-4-16, 14:55:40
    Author     : CZC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Logout Page</title>
    </head>
    <body>
        <%
            session.setAttribute("user", null);
        %>
        <p>You have been logged out successfully!</p>
        <p>Click <a href="login.jsp"><strong>here</strong></a> to go to login page.</p>
        <p>Click <a href="index.jsp"><strong>here</strong></a> to proceed to the home page.</p>
    </body>
</html>