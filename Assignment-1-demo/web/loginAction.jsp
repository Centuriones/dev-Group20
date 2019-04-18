<%-- 
    Document   : loginAction
    Created on : 2019-4-16, 14:54:40
    Author     : CZC
--%>

<%@page import="uts.User"%>
<%@page import="uts.Users"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
       
         <% 
String email = request.getParameter("email");
String password = request.getParameter("password");
Users users = new Users();
User user = users.login("email","password");
if(user != null){
       session.setAttribute("user",user);
       response.sendRedirect("main.jsp");
       }
else {
session.setAttribute("error", "user does not exists");
response.sendRedirect("login.jsp");
}

       %>

    </body>
</html>
