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
        <title>JSP Page</title>
    </head>
    <body>
        <%session.invalidate();%>
        <p>You have been logout successfully!</p>
        <p><a href="index.jsp">Click here </a>to go to login page.</p>
    </body>
</html>