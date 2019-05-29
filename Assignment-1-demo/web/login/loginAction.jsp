<%-- 
    Document   : loginAction
    Created on : 2019-4-16, 14:54:40
    Author     : CZC
--%>

<%@page import="uts.wsd.User"%>
<%@page import="uts.wsd.Users"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
    </head>
    <body>
        <%
            String password;
            String email;
            User user;
            Users users;
        %>
        <%
            email = request.getParameter("email");
            password = request.getParameter("password");
            if((session.getAttribute("users")) == null){
                users = new Users();
            } else {
                users = (Users)session.getAttribute("users");
            }
            
            user = users.login(email, password);
            
            if(user != null){
                session.setAttribute("user",user);
                response.sendRedirect("main.jsp");
            } else {
                session.setAttribute("error", "No user");
                response.sendRedirect("login.jsp");
            }
        %>
        <p>Redirecting...</p>
    </body>
</html>