<%-- 
    Document   : welcome
    Created on : 2019-4-2, 13:10:46
    Author     : CZC
--%>

<%@page import="uts.wsd.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>welcome page</title>
    </head>   
        <%
            String name;
            String password;
            String email;
            String gender;
            
            name=request.getParameter("name");
            password=request.getParameter("password");
            email=request.getParameter("email");
            gender=request.getParameter("gender");
            String tos=request.getParameter("tos");
        %>
    <body>
        <%
            Users users;
            if(tos!=null){
                User user = new User(email, name, password, gender);
                if((session.getAttribute("users")) == null){
                    users = new Users();
                } else {
                    users = (Users)session.getAttribute("users");
                }
                session.setAttribute("user",user);
                users.addUser(user);
                session.setAttribute("users",users);
        %>
        <h1>Hello <%=name%>, </h1>
        <p>Welcome to your new account, having an account allows you to purchase 
        new movies and track your buying trends.</p>
        <p>Your email is <%=email%></p>
        <p>Your password is <%= password%></p>
        
        <p>Your gender is <%= gender%></p>
        <%} else {%>
        <p>Sorry, you must agree to the Terms of Service.</p>
        <p>Click <a href="register.jsp"><strong>here</strong></a> to return to the register page.</p>
        <%}%>
        <p>Click <a href="index.jsp"><strong>here</strong></a> to proceed to the home page.</p>
    </body>
</html>