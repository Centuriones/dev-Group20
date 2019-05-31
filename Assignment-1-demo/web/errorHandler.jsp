<%-- 
    Document   : errorHandler
    Created on : 31/05/2019, 7:18:14 PM
    Author     : LTChr
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
        <p>An inescapable error has been encountered you have been safely logged out.</p>
        <p>Click <a href="index.jsp"><strong>here</strong></a> to proceed to the home page.</p>
    </body>
</html>