<%-- 
    Document   : doDeleteProfile
    Created on : 21/05/2019, 7:35:41 PM
    Author     : neko
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="uts.wsd.*"%>
<%@page import="java.util.*"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.Timestamp"%>

<%
    User user = (User) session.getAttribute("user");
    if (user != null) {
        UserDb userDao = (UserDb) session.getAttribute("userDao");
        userDao.deleteUser(user.getEmail());
    }
    session.invalidate();
%>

<!DOCTYPE html>
<html>
<html lang="en">
    <head>
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>About - Online Movie Store</title>

    </head>
    <body>
        
        
        
        <div class="container">
            <div class="alert alert-danger topspacer" role="alert">
                Your account has been deleted. Please return to the <a href="${pageContext.request.contextPath}/">Home Page</a>.
            </div>
        </div>
        
     
        
    </body>
</html>