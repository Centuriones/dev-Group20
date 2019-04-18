<%-- 
    Document   : main
    Created on : 09/04/2019, 12:37:31 PM
    Author     : strongarm
--%>

<%@page import="uts.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Check</title>
    </head>
    <body>
        <%
            User user = (User)session.getAttribute("user");
        %>
        <h1>You're logged in as: <%=user.getName()%></h1>
        <h4><a href='index.jsp'>Proceed to home.</a></h4>
        <p>Is this not you? <a href='logout.jsp'>Logout</a></p>
       
    </body>
</html>
