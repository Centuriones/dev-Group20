<%-- 
    Document   : welcome
    Created on : 2019-4-2, 13:10:46
    Author     : CZC
--%>

<%@page import="uts.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Introduction Page</title>
    </head>
    
    <%
        String name;
        String password;
        String email;
        String gender;
        %>
        
        <%
            name=request.getParameter("name");
            password=request.getParameter("password");
            email=request.getParameter("email");
            gender=request.getParameter("gender");
            String tos=request.getParameter("tos");
            %>
    <body>
        <%if(tos!=null){
        User user = new User(email, name, password, gender);%>
        <%
        session.setAttribute("abc",user);
        %>
        <h1>Hello <%=name%>, </h1>
        <p>Welcome to your new account, having an account allows you to purchase 
        new movies and track your buying trends.</p>
        <p>Your email is <%=email%></p>
        <p>Your password is <%= password%></p>
        
        <p>Your gender is <%= gender%></p>
        <%}else{%>
        <p>Sorry, you must agree to the Terms of Service.</p>
        <p>Click <a href="register.jsp">here</a> to go back.</p>
        <%}%>
        <p>Click <a href="index.jsp">here</a> to proceed to the main page.</p>
    </body>
</html>