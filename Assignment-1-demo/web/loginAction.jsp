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
        <title>Login Page</title>
    </head>
    <body>
        <%
            String password;
            String email;
        %>
        <%
            email = request.getParameter("email");
            password = request.getParameter("password");
            Users users = (Users)session.getAttribute("users");
            System.out.println(users.getList());
            User user = users.login("email","password");
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
